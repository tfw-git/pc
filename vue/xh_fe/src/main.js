import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
Vue.config.productionTip = false
Vue.prototype.axios=axios;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
// 页面每次跳转时都加载到顶部
router.afterEach((to,from,next) => {

  window.scrollTo(0,0);
  
  // 或
  
  // window.scroll(0, 0);
  
});