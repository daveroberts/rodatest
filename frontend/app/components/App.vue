<template>
  <div>
    <div id="links">
      <router-link v-if="auth.get()" to="/users" exact>User List</router-link>
      <router-link v-if="!auth.get()" to="/login" exact>Login</router-link>
      <router-link to="/info" exact>Info</router-link>
      <a style="float: right" href="#" v-on:click="logout()" v-if="auth.get()">Logout</a>
      <span style="float: right" v-if="auth.get()">{{ auth.get().username }} </span>
    </div>
    <router-view></router-view>
  </div>
</template>
<script>
import auth from '../services/AuthService.js'
export default {
  created: function(){
  },
  data: function(){
    return {
      auth: auth
    }
  },
  methods: {
    "logout": function(){
      auth.logout().then((res)=>{
      }).catch((err)=>{
        console.log("err")
        console.dir(err)
      })
    }
  }
}
</script>
