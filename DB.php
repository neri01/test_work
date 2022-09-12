<?php
require_once 'Variables.php';

class Db
{
    public $conn = '';
    public function __construct()
    {

        global $servername;
        global $database;
        global $username;
        global $password;
        $this->conn = mysqli_connect($servername, $username, $password, $database);
    }
    private function sql_request($req)
    {
        $this->conn->set_charset("utf8mb4");
        $result = $this->conn->query($req);
        return $result;
    }
    private function generateCode($length=10) {
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPRQSTUVWXYZ0123456789";
        $code = "";
        $clen = strlen($chars) - 1;
        while (strlen($code) < $length) {
            $code .= $chars[mt_rand(0,$clen)];
        }
        return $code;
    }

    public function code_password($login,$password){
        $temp_login = md5($login);
        $temp_password = "";
        for($i=0;$i<strlen($temp_login);$i++){
            $temp=ord($password[$i])+ord($temp_login[$i]);
            $temp2=intdiv($temp,74)+48;
            $temp_password=$temp_password.chr($temp2);
            $temp_password=$temp_password.chr(($temp % 74)+48);
        }
        return $temp_password;
    }
    public function encode_password($login,$password){
        $temp_login = md5($login);
        $ret_password='';

        for ($i=0;$i<strlen($temp_login);$i++){

            $param1 = (ord($password[$i*2])-48)*74;
            $param2 = ord($password[$i*2+1])-48;
            $param3 = ord($temp_login[$i]);
            $result=$param2+$param1-$param3;
            if($result != 0){
            $ret_password.=chr($result);
            }
        }

        return $ret_password;
    }

    public function get_user_data($login){

        $data = $this->sql_request("SELECT * FROM `users` where `login` = '" . md5(md5($login)) . "'");

        if(mysqli_num_rows($data)>0){
        foreach ($data as $row) {
            $obj["id"]=$row["id"];
            $obj["login"] = $login;
            $obj["password"] = $this->encode_password($login,$row["password"]);
            $obj["last_login"]= $row["last_login"];
            $obj["token"]= $row["token"];
            $obj["nickname"]=$row["nickname"];
        }
        }else{
            return false;
        }

        return $obj;
    }
    public function login($login,$password)
    {

        $user = ($this->get_user_data($login));

        if (!empty($user) and $user["password"] == $password) {
            $hash = md5($this->generateCode(10));
            $data = $this->sql_request("UPDATE `users` 
                                SET `token` = '" . $hash . "', `last_login` = NOW() 
                                where login = '" . md5(md5($login)) . "'");
            return $hash;
        } else {
            return false;
        }
    }

    public function add_user($login,$password,$nickname){
        $_login=md5(md5($login));
        $_password=$this->code_password($login,$password);
        $data = $this->sql_request("INSERT INTO `users` (`id`, `login`, `password`, `nickname`, `token`, `last_login`) 
                                                VALUES (NULL, '".$_login."', '".$_password."', '".$nickname."', '', NOW());");
        if (!empty($data)){
            $data=true;
        }
        return $data;
    }
    public function add_post($login,$msg)
    {
        $user = $this->get_user_data($login);
        if (!empty($user)) {
            $data = $this->sql_request("INSERT INTO `posts` (`id_user`, `post`) VALUES ('".$user["id"]."', '".$msg."');");
            return true;
        }else
            return false;
    }
    public function get_post_list(){
        global $NumPostsOnPage;
        $obj["numPostOnPage"]= $NumPostsOnPage;

        $data = $this->sql_request("SELECT post , nickname FROM `posts` cross join `users` WHERE id = id_user");
        $i=0;
        foreach ($data as $row) {
            $obj[$i]["post"]=$row["post"];
            $obj[$i]["nickname"] = $row["nickname"];
            $i++;
        }

        return $obj;
    }
    public function logout($login){
        $this->sql_request("UPDATE `users` 
                                SET `token` = '', `last_login` = NOW() 
                                where login = '" . md5(md5($login)) . "'");
    }
    public function check_user($login,$token){
        $user = $this->get_user_data($login);
        $file = fopen("logger.txt", "a");
        fwrite($file, "проверяяем токены".$user["token"].' '.$token. "\n");
        fclose($file);
        if ($user["token"]==$token and !empty($token)){
            return true;
        }else{
            return false;
        }
    }
}
?>