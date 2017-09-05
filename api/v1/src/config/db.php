<?php

class db{
    private $dbuser = 'root';
    private $dbpass = '123456';
    private $dbhost = 'localhost';
    private $dbname = 'altoqi_sv';

    public function connect(){
        $mysql_connect_str = "mysql:host=$this->dbhost;dbname=$this->dbname;";

        $dbConnection = new PDO($mysql_connect_str, $this->dbuser, $this->dbpass,
        array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));

        $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        return $dbConnection;
    }
}

?>
