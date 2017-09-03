<?php
ini_set('default_charset', 'utf-8');
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

//Get all customers
$app->get('/api/v1/survey', function(Request $request, Response $response){
    $sql="SELECT * FROM survey";
    
    try{
        //GET db Object
        $db = new db();
        //connect
        $db = $db->connect();
        $db->exec("SET CHARACTER SET utf8");

        $stmt = $db->query($sql);
        $survey = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        echo utf8_encode(json_encode($survey));

    }catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().' }}';
    }
});

?>