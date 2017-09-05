<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
//header('access-control-allow-origin: *');
//header('Content-Type: application/json');

$app = new \Slim\App;

//Get all surveys id and description
$app->get('/survey', function(Request $request, Response $response){
    $sqlSurvey="SELECT * FROM survey";

    try{
        //GET db Object
        $db = new db();
        //connect
        $db = $db->connect();

        //Get survey
        $stmt = $db->query($sqlSurvey);
        $survey = $stmt->fetchAll(PDO::FETCH_OBJ);
        //$survey = '"survey":'.json_encode($survey);

        echo json_encode($survey);

        $db = null;
        return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');

    }catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().' }}';
    }
});

//Get a entire survey
$app->get('/survey/{id}', function(Request $request, Response $response){
    $id = $request->getAttribute('id');
    $sqlSurvey="SELECT title, description FROM survey WHERE id = $id";
    $sqlQuestion="SELECT id, description FROM question WHERE surveyId = $id";
    $sqlQuestionTopics="SELECT qt.id, qt.topic, qt.questionId FROM question_topic qt JOIN question q WHERE q.surveyId = $id and q.id = qt.questionId";
    $sqlQuestionAnswers="SELECT aq.*, a.answer FROM answer_question aq JOIN answer a WHERE a.id = aq.answer_id";
    try{
        //GET db Object
        $db = new db();
        //connect
        $db = $db->connect();

        //Get survey description
        $stmt = $db->query($sqlSurvey);
        $survey = $stmt->fetchAll(PDO::FETCH_OBJ);
        $survey = '"survey":'.json_encode($survey[0]);
        //Get survey questions
        $stmt = $db->query($sqlQuestion);
        $question = $stmt->fetchAll(PDO::FETCH_OBJ);
        $question = '"question":'.json_encode($question);
        //Get questions topics
        $stmt = $db->query($sqlQuestionTopics);
        $questionTopics = $stmt->fetchAll(PDO::FETCH_OBJ);
        $questionTopicsArray = array();
        for ($i = 0; $i < sizeof($questionTopics); $i++) {
          $qIndex = $questionTopics[$i]->questionId;
          $questionTopicsArray[$qIndex][] = $questionTopics[$i];
        }
        $questionTopics = '"question_topic":'.json_encode($questionTopicsArray);
        //Get questions answers
        $stmt = $db->query($sqlQuestionAnswers);
        $questionAnswers = $stmt->fetchAll(PDO::FETCH_OBJ);
        $questionAnswersArray = array();
        for ($i = 0; $i < sizeof($questionAnswers); $i++) {
          $qIndex = $questionAnswers[$i]->question_id;
          $questionAnswersArray[$qIndex][] = $questionAnswers[$i];
        }
        $questionAnswers = '"question_answers":'.json_encode($questionAnswersArray);

        echo '{'.$survey.', '.$question.', '.$questionTopics.', '.$questionAnswers.'}';

        $db = null;
        return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');

    }catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().' }}';
    }
});
//add userAnswer
$app->post('/survey/userAnswerAdd', function(Request $request, Response $response){
    $data = $request->getParsedBody();
    $email = ($data['data']['e-mail']);
    $answers = ($data['data']['answers']);
    $sqlAddUser = "INSERT INTO user(email) VALUES (:email)";
    $sqlUserId = "SELECT id FROM user WHERE email=:email";
    $sqlAddUserAnswer = "INSERT INTO user_answer_topic(question_topic_id, question_answer_id, user_id) VALUES (:question_topic_id, :question_answer_id, :user_id)";

    try{
        //GET db Object
        $db = new db();
        //connect
        $db = $db->connect();

        //Register user
        $stmt = $db->prepare($sqlAddUser);
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        //Get user id
        $stmt = $db->prepare($sqlUserId);
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $userId = $stmt->fetchAll(PDO::FETCH_OBJ);
        $userId = $userId[0]->id;
        //Register all answers of the user
        $stmt = $db->prepare($sqlAddUserAnswer);
        for($i = 0 ; $i < sizeof($answers) ; $i++){
          $question_topic_id = $answers[$i]['question_topic_id'];
          $question_answer_id = $answers[$i]['question_answer_id'];

          $stmt->bindParam(':question_topic_id', $question_topic_id);
          $stmt->bindParam(':question_answer_id', $question_answer_id);
          $stmt->bindParam(':user_id', $userId);
          $stmt->execute();
        }

    }catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().' }}';
    }
    return $request
        ->withHeader('Access-Control-Allow-Origin', '*')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});

?>
