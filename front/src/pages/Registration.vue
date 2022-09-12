<template>
  <base-template>
    <div class="w-form">
      <form v-on:submit.prevent="registration()" id="email-form" name="email-form" data-name="Email Form" method="get" class="form-6">
        <label for="name">придумайте логин</label>
        <input v-model="login" type="text" class="w-input-hp" maxlength="256" name="name" data-name="Name" placeholder="" id="name">
        <label for="email">придумайте пароль</label>
        <input v-model="password" type="text" class="w-input-hp" maxlength="256" name="email" data-name="Email" placeholder="" id="email" required="">
        <label for="email">придумайте ник</label>
        <input v-model="nickname" type="text" class="w-input-hp" maxlength="256" name="email" data-name="Email" placeholder="" id="nick" required="">
        <input type="submit" value="зарегистрироваться" data-wait="Please wait..." class="w-button">
        <a href="/login" class="w-button">на страницу авторизации</a>
      </form>
    </div>
  </base-template>
</template>

<script>
import Vue from "vue";
import VueMask from "v-mask";

Vue.use(VueMask);

export default {
  name: "Registration",
  components: {
  },
  data() {
    return {
      login: "",
      password: "",
      nickname: ""
    };
  },
  methods: {
    registration: function () {
      var param = new FormData();
      param.append("function", "registration");
      param.append("login", this.login);
      param.append("password", this.password);
      param.append("nickname", this.nickname);
      var xhr = new XMLHttpRequest();
      xhr.open('POST', "http://localhost/api/", false);
      xhr.send(param);
      var data;
      if (xhr.status != 200) {
        data = (xhr.status + ': ' + xhr.statusText);
      } else {
        data = JSON.parse(xhr.responseText);
        document.cookie = "hash=" + data;
        document.cookie = "login=" + this.login;
        document.cookie = "password=" + this.password;
        this.$router.push('/');
      }
    return data;
  },
    logout: function() {
    },
  },
};

</script>

<style lang="scss" scoped>
@import "../styles/helpers/variables";
@import "../styles/helpers/form";
form.login {
  display: flex;
  &.code {
    .right-col {
      div {
        position: relative;
        .error {
          top: 125px;
          font-size: 12px;
          line-height: 12px;
          color: red;
        }
      }
    }
  }

  @media #{$xl} {
    flex-direction: column;
    min-height: calc(100vh - 335px);
  }
  p {
    font-weight: 500;
    font-size: 30px;
    line-height: 29px;
    color: $border-black;
    max-width: 760px;
    margin-bottom: 80px;
    @media #{$lm} {
      font-size: 22px;
      line-height: 21px;
    }
    &.mb-40 {
      margin-bottom: 40px !important;
      min-height: auto !important;
    }
  }
  .role {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    cursor: pointer;
    &.active {
      background: $border-black;
      color: #fff;
      h3 {
        color: #fff;
        margin-bottom: 40px;
      }
      p.mini {
        font-weight: 300;
        font-size: 20px;
        line-height: 22px;
        color: #fff;
        margin-bottom: 25px;
      }
      .arrow {
        border-color: #fff;
        background: url("data:image/svg+xml,%3Csvg width='24' height='24' viewBox='0 0 24 24' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cg clip-path='url(%23clip0)'%3E%3Crect x='23.04' y='24' width='24' height='0.96' transform='rotate(-90 23.04 24)' fill='white'/%3E%3Crect width='24' height='0.96' fill='white'/%3E%3Crect x='-0.788452' y='23.999' width='33.261' height='0.96' transform='rotate(-45 -0.788452 23.999)' fill='white'/%3E%3C/g%3E%3Cdefs%3E%3CclipPath id='clip0'%3E%3Crect width='24' height='24' fill='white'/%3E%3C/clipPath%3E%3C/defs%3E%3C/svg%3E")
        no-repeat 98% center;
        color: #fff;
        width: 100%;
        max-width: 760px;
      }
      select {
        height: 50px;
        width: 100%;
        max-width: 760px;
        margin-bottom: 30px;
        font-size: 25px;
        line-height: 24px;
        color: $border-black;
      }
    }
    h3 {
      font-weight: 500;
      font-size: 50px;
      line-height: 48px;
      text-align: center;
      width: 100%;
      @media #{$xs} {
        font-size: 38px;
      }
    }
  }
  .left-col {
    width: calc(50% - 20px);
    border-right: 2px solid $border-black;
    padding: 120px 100px;
    min-height: calc(100vh - 425px);
    margin-left: 20px;
    .error {
      margin-top: -40px;
      margin-bottom: 28px;
    }
    .labels{
      font-size: 28px;
      margin-top: 5px;
      margin-bottom: 5px;

    }
    input.text {
      width: 70%;
      max-width: 760px;
      height: 50px;
      margin-bottom: 40px;
      @media #{$lm} {
        width: calc(100% - 145px);
      }
      @media #{$xl} {
        width: 100%;
        max-width: 540px;
      }
    }
    @media #{$ll} {
      padding: 60px 20px;
      p {
        min-height: 70px;
        margin-bottom: 5px;
        @media #{$xl} {
          margin-bottom: 25px;
          min-height: auto;
        }
      }
    }
    @media #{$lm} {
      min-height: calc(100vh - 313px);
    }
    @media #{$xl} {
      width: 100%;
      border-right: 0;
      min-height: 200px;
      border-bottom: 2px solid $border-black;
      padding: 40px 20px;
    }

    .block-btn {
      display: flex;
      flex-wrap: wrap;
      justify-content: flex-start;
      align-items: flex-end;
      .arrow {
        width: 70%;
        max-width: 760px;
        margin-right: 30px;
        @media #{$lm} {
          width: calc(100% - 145px);
        }
        @media #{$xl} {
          width: 100%;
          max-width: 540px;
        }
        @media #{$xs} {
          margin-bottom: 25px;
          margin-right: 0;
        }
      }
    }
  }

  .right-col {
    width: 50%;
    padding: 120px 100px;
    &.pr-0 {
      padding-right: 0;
      @media #{$lm} {
        padding-right: 20px;
      }
    }
    &.h-100 {
      min-height: calc(100vh - 385px);
      @media #{$lm} {
        min-height: calc(100vh - 337px);
      }
    }
    .error {
      width: 100%;
      position: absolute;
      top: 30px;
      left: 0;
      @media #{$xl} {
        margin-bottom: 0;
        top: auto;
        bottom: -10px;
        min-height: 10px;
        display: block;
      }
    }
    input.text {
      width: 100%;
      max-width: 850px;
      height: 50px;
      margin-bottom: 30px;
    }
    .arrow {
      width: 100%;
      max-width: 850px;

      @media #{$xs} {
        margin-bottom: 25px;
      }
    }
    @media #{$ll} {
      padding: 60px 20px;
      p {
        min-height: 90px;
        margin-bottom: 70px;
        @media #{$xl} {
          min-height: auto;
          margin-bottom: 25px;
        }
      }
    }
    @media #{$xl} {
      width: 100%;
      min-height: 358px;
      padding: 40px 20px;
    }
    div {
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: flex-start;
      flex-wrap: wrap;
      max-width: 760px;
      margin-bottom: 70px;
      min-height: 50px;
      position: relative;
      @media #{$lm} {
        margin-bottom: 20px;
      }
      @media #{$xs} {
        align-items: flex-start;
      }
      label {
        margin-right: 10px;
      }
      span {
        font-weight: 300;
        font-size: 14px;
        line-height: 14px;
        color: #161712;
        max-width: calc(100% - 40px);
      }
    }
    .time {
      width: 100%;
      max-width: 850px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: 300;
      font-size: 20px;
      line-height: 22px;
      .timer {
        margin-right: 20px;
      }
    }
  }
}
</style>
