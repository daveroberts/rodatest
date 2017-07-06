<template>
  <div>
    <router-link to="/users" exact>User List</router-link>
    <router-link to="/info" exact>Info</router-link>
    <router-view></router-view>
  </div>
</template>
<script>
export default {
  data: function(){
    return {
    }
  }
}
</script>
