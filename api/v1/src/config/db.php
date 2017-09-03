<?php
    class db{
        private $dbhost = 'localhost';
        private $dbuser = 'root';
        private $dbpass = '123456';
        private $dbname = 'altoqi_sv';

        //Connect
        public function connect(){
            $mysql_connect_str = "mysql:host=$this->dbhost;dbname=$this->dbname;";
            $dbConnection = new PDO($mysql_connect_str, $this->dbuser, $this->dbpass);
            $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $dbConnection->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );
            return $dbConnection;
        }
    }
?>