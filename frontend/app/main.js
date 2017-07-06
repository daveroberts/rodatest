import Vue from 'vue'
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import App from './App.vue'
import UserList from './UserList.vue'
import NewUser from './NewUser.vue'
const routes = [
  { path: '/users', component: UserList },
  { path: '/new-user', component: NewUser },
];
const router = new VueRouter({routes});

var app = new Vue({
  el: '#app',
  render: h=>h(App),
  router: router
})
