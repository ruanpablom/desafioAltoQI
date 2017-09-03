<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

//Get a Survey
$app->get('/survey', function(Request $request, Response $response){
    //$id = (int) $request->getAttribute('id');
    
    $sql = "hadouken";

    try{
        //Get DB Obeject
        $db = new db();
        //DB connect
        $db->connect();
        $stmt = $db->prepare($sql);
        $stmt->execute();
        $survey = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($survey);
    }catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}}';
    }
});

?>