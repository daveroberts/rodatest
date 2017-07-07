<template>
  <div>
    <h1>Users</h1>
    <div v-if="users">
      <table class="table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Age</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in users">
            <td>{{user.name}}</td>
            <td>{{user.age}}</td>
            <td><a class="btn btn-icon" href="#" v-on:click.prevent="remove(user)"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
          </tr>
        </tbody>
      </table>
    </div>
    <div>
      <form v-on:submit.prevent="create_user">
        <table>
          <tbody>
            <tr>
              <th><label for="username">Username</label></th>
              <td><input type="text" id="username" v-model="new_user.name" /></td>
            </tr>
            <tr>
              <th><label for="age">Age</label></th>
              <td><input type="number" id="age" v-model="new_user.age" /></td>
            </tr>
            <tr>
              <th></th>
              <td><button class="btn" type="submit"><i class="fa fa-plus-circle" aria-hidden="true"></i> Create User</button></td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  created: function(){
    var self = this
    axios.get('/api/users').then(function(res){
      self.users = res.data
    }).catch(function(err){
      console.log(err)
    })
  },
  data: function(){
    return {
      users: null,
      new_user: {name: '', age: ''}
    }
  },
  methods: {
    "remove": function(user){
      var self = this
      axios.delete(`/api/users/${user.id}`).then(function(res){
        var idx = self.users.findIndex((u)=>u.id==user.id)
        if (idx > -1){
          self.users.splice(idx,1)
        }
      }).catch(function(err){
        console.log(err)
      })
    },
    "create_user": function(){
      var self = this
      axios.post(`/api/users`, self.new_user).then(function(res){
        var user = res.data
        self.users.push(user)
        self.new_user = {name: '', age: ''}
      }).catch(function(err){
        console.log(err)
      })
    }
  }
}
</script>
<style>
tbody tr{ line-height: 2em; }
</style>
