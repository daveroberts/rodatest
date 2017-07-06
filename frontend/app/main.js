import Vue from 'vue'
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import App from './App.vue'
import UserList from './UserList.vue'
import Info from './Info.vue'
const routes = [
  { path: '/users', component: UserList },
  { path: '/info', component: Info },
];
const router = new VueRouter({routes});

var app = new Vue({
  el: '#app',
  render: h=>h(App),
  router: router
})
