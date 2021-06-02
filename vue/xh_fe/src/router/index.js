import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Index from '../views/Index'

Vue.use(VueRouter)
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}//解决路由重复报错问题
const routes = [
  {
    path: '/',
    component: Home,
    children:[
      {path: "/",component: Index},
      {
        path: '/details/:lid',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "details" */ '../views/Details.vue'),
        props:true
      },
      {
        path: '/search/:name',
        component: () => import(/* webpackChunkName: "search" */ '../views/Search.vue'),
        props:true
      }
    ]
  },
  {
    path: '/login',
    component: () => import(/* webpackChunkName: "login" */ '../views/Login.vue')
  },
  {
    path: '/register',
    component: () => import(/* webpackChunkName: "register" */ '../views/Register.vue')
  }
]


const router = new VueRouter({
  routes
})



export default router
