<template>
  <base-template>
    <div class="section">
      <h1 class="heading">Список постов</h1>
      <div v-on:click="logout()">
      <button class="button w-button">выйти из аккаунта</button>
      </div>
    </div>

    <div class="w-form">
      <form v-on:submit="add_post()" id="email-form" name="email-form" data-name="Email Form" method="get">
        <label for="name">добавить запись</label>
        <textarea v-model="msg" type="text" class="w-input" name="name" data-name="Name" placeholder="" id="name"></textarea>
        <input type="submit" value="отправить" data-wait="Please wait..." class="w-button"></form>
    </div>
    <div v-for="item in posts" :key="item" class="post">
      <h1 class="post-author">{{item["nickname"]}}:</h1>
      <p class="post-text">{{item["post"]}}</p>
    </div>
    <home-menu />
  </base-template>
</template>



<script>

import Vue from "vue";
import VueMask from "v-mask";

Vue.use(VueMask);

export default {
  name: "HomePage",
  components: {},
  data() {
    return {
      msg: "",
      hash:this.get_cookie("hash"),
      login:this.get_cookie("login"),
      posts: this.get_posts("http://localhost/api/?function=get_posts&hash=" + this.hash+"&login=" + this.login),
      num_posts_on_page:0,
    };
  },
  methods: {
    get_cookie: function(name){
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
          var c = ca[i];
          while (c.charAt(0)==' ') c = c.substring(1,c.length);
          if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return null;
      },
    deleteAllCookies:function() {
      var cookies = document.cookie.split(";");
      for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
      }
    },
    get_posts: function () {
      var param = new FormData();
      param.append("function", "get_posts");
      param.append("login", this.get_cookie("login"));
      param.append("hash", this.get_cookie("hash"));
      var xhr = new XMLHttpRequest();
      xhr.open('POST', "http://localhost/api/", false);
      xhr.send(param);
      var data;
      if (xhr.status != 200) {
        data = (xhr.status + ': ' + xhr.statusText);
      } else {
        data = JSON.parse(xhr.responseText);
      }
      this.num_posts_on_page=data["numPostOnPage"];
      delete data["numPostOnPage"];
      //this.get_posts_on_page(data);
      this.num_posts = Object.keys(data).length - 1;
      return data;
    },
    add_post: function () {
      var param = new FormData();
      param.append("function", "add_post");
      param.append("login", this.get_cookie("login"));
      param.append("hash", this.get_cookie("hash"));
      param.append("msg", this.msg);
      var xhr = new XMLHttpRequest();
      xhr.open('POST', "http://localhost/api/", false);
      xhr.send(param);
      var data;
      if (xhr.status != 200) {
        data = (xhr.status + ': ' + xhr.statusText);
      } else {
        data = JSON.parse(xhr.responseText);
      }
      return data;
    },
    logout: function () {
      var param = new FormData();
      param.append("function", "logout");
      param.append("login", this.get_cookie("login"));
      var xhr = new XMLHttpRequest();
      xhr.open('POST', "http://localhost/api/", false);
      xhr.send(param);
      var data;

      if (xhr.status != 200) {
        data = (xhr.status + ': ' + xhr.statusText);
      } else {
        data = xhr.responseText;
      }
      this.posts=[];
      document.cookie = "hash=";
      document.cookie = "login=";
      document.cookie = "password=";
      this.$router.push('/Login');
      return data;
    }
  },
};
</script>

<style>
.base{
  background-color: #00ffff;
}
.section {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  clear: none;
  -webkit-box-pack: end;
  -webkit-justify-content: flex-end;
  -ms-flex-pack: end;
  justify-content: flex-end;
}
.label{

}
.w-form {
  margin: 0 0 15px
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold
}

.w-input{
  display: block;
  width: 98%;
  height: 150px;
  padding: 8px 12px;
  margin-bottom: 10px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #333333;
  vertical-align: middle;
  background-color: #ffffff;
  border: 1px solid #cccccc
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold
}
.heading {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
  -ms-flex: 1;
  flex: 1;
  text-align: center;
}
.button {
  margin-top: 27px;
  -webkit-align-self: center;
  -ms-flex-item-align: center;
  -ms-grid-row-align: center;
  align-self: center;
}
.button-2 {
   left: 0px;
   display: block;
   min-width: 200px;
   clear: none;
   text-align: center;
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
.post{
  margin-top: 10px;
  border: 1px solid black;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  border-color: #0b0b0b;
  border-radius: 10px;
  background:#aaffaa;
}
.post-author{
margin: 10px;
  margin-bottom: 0px;
}
.post-text{
  margin: 10px;
}
</style>
