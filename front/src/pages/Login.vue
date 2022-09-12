/* eslint-disable */
<template>
  <base-template>
    <div class="w-form">
      <form id="email-form" name="email-form" data-name="Email Form" method="get" class="form-6">
        <label for="name">логин</label>
        <input v-model="login" type="text" class="w-input-hp" maxlength="256" name="name" data-name="Name" placeholder="" id="name">
        <label for="email">пароль</label>
        <input v-model="password" type="text" class="w-input-hp" maxlength="256" name="email" data-name="Email" placeholder="" id="email" required="">
        <div class="w-row">
          <div v-on:click.prevent="authorization()" class="column-20 w-col w-col-4">
            <a href="/Login" class="button-2 w-button">войти</a>
          </div>
          <div class="w-col  w-col-4">
            <a href="/Registration" class="button-2 w-button">зарегистрироваться</a>
          </div>
          <div v-on:click.prevent="mem_pass()" class="column-19 w-col w-col-4">
            <a href="#" class="button-2 w-button">вспомнить пароль</a>
          </div>
        </div>
      </form>
    </div>
  </base-template>
</template>

<script>
//import axios from "axios";
//import { HTTP } from "@/http_common";
export default {
  name: "Login",
  components: {
  },
  data() {
    return {
      login:"",
      password:"",
    };
  },
  methods: {
    mem_pass: function(){
      var param = new FormData();
      param.append("function","remember_password");
      param.append("login", this.login);
      var xhr = new XMLHttpRequest();
      xhr.open('POST', "http://localhost/api/", false);
      xhr.send(param);
      var data;
      if (xhr.status != 200) {
        data = ( xhr.status + ': ' + xhr.statusText );
      } else {
        data = xhr.responseText;
      }
      this.password=data;
      return data;
    },

    authorization: function(){

      var param = new FormData();
      param.append("function","Login");
      param.append("login", this.login);
      param.append("password", this.password);
      var xhr = new XMLHttpRequest();
      xhr.open('POST', "http://localhost/api/", false);
      xhr.send(param);
      var data;
      if (xhr.status != 200) {
        data = ( xhr.status + ': ' + xhr.statusText );
      } else {
        data = xhr.responseText;
        document.cookie = "hash=" + data;
        document.cookie = "login=" + this.login;
        document.cookie = "password=" + this.password;
      }
      if (data != ""){
      this.$router.push('/');
      }else{
        alert("данные введены некоректно");
      }
      return data;
    },
    }
};
</script>

<style>
.w-form {
  margin: 0 0 15px
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold
}

.w-input-hp{
  display: block;
  width: 98%;
  height: 15px;
  padding: 8px 12px;
  margin-bottom: 10px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #333333;
  vertical-align: middle;
  background-color: #ffffff;
  border: 1px solid #cccccc
}
.button-2 {
  left: 0px;
  display: block;
  min-width: 200px;
  clear: none;
  text-align: center;
  float:left;
  margin-left:12%;
  margin-right: 12%;
}

.w-button {
  margin-left: 10px;
  display:inline-block;
  padding:9px 15px;
  background-color:#00ff00;
  color:black;
  border:2px;
  line-height:inherit;
  text-decoration:none;
  cursor:pointer;
  border-radius:10px;
}
.w-row {
  margin-left: 10%;
  margin-right: 5%;
}
.w-row:after {
  content: " ";
  display: table;
  grid-column-start: 1;
  grid-row-start: 1;
  grid-column-end: 2;
  grid-row-end: 2
}
</style>