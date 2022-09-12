<?php
require_once 'Api.php';
require_once 'DB.php';

class UsersApi extends Api
{
    public $apiName = 'users';

    /**
     * Метод GET
     * Вывод списка всех записей
     * http://ДОМЕН/users
     * @return string
     */
    public function login()
    {

        $db = new Db();
        $res = $db->login($this->requestParams["login"],$this->requestParams["password"]);

        return $res;
    }

    /**
     * Метод GET
     * Просмотр отдельной записи (по id)
     * http://ДОМЕН/users/1
     * @return string
     */
    public function registration()
    {
        $db = new Db();
        $user = $db->get_user_data($this->requestParams['login']);


        if(empty($user)){
            $data = $db->add_user($this->requestParams["login"],$this->requestParams["password"],$this->requestParams["nickname"]);
            $user = $db->login($this->requestParams["login"],$this->requestParams["password"]);
        }else{
        }
        return json_encode($user);
    }

    /**
     * Метод POST
     * Создание новой записи
     * http://ДОМЕН/users + параметры запроса name, email
     * @return string
     */
    public function remember_password()
    {
        $db = new Db();
        $user = $db->get_user_data($this->requestParams["login"]);
        $file = fopen("logger.txt", "a");
        fwrite($file, " проверено токен ".json_encode($user)."\n");
        fclose($file);
        return $user["password"];
    }

    /**
     * Метод PUT
     * Обновление отдельной записи (по ее id)
     * http://ДОМЕН/users/1 + параметры запроса name, email
     * @return string
     */
    public function get_posts()
    {
        $db=new Db();
        if($db->check_user($this->requestParams["login"],$this->requestParams["hash"])) {
            return json_encode($db->get_post_list());
        }else{
            return "ошибка пользователь не зарегистрирован";
        }
    }

    /**
     * Метод DELETE
     * Удаление отдельной записи (по ее id)
     * http://ДОМЕН/users/1
     * @return string
     */
    public function add_post()
    {
        $db = new Db();
        if($db->check_user($this->requestParams["login"],$this->requestParams["hash"])) {
            return $db->add_post($this->requestParams["login"],$this->requestParams["msg"]);
        }else{
            return "ошибка пользователь не зарегистрирован";
        }
    }
    public function logout()
    {
        $db=new Db();
        return $db->logout($this->requestParams["login"]);
    }

}