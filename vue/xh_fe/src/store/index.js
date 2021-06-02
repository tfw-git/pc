import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
Vue.use(Vuex)

export default new Vuex.Store({
  // 保存公共变量
  state: {
    uid: 0,
    uname:''
  },
  mutations: {
    // 定义修改name函数
    setUid(state, uid) {
      state.uid = uid;
    },
    setUname(state, uname) {
      state.uname = uname;
    }
  },
  actions: {
    // obj可以是一个数组，一个对象，context之后只能传一个新参
    vlogin(context, obj) {
      return new Promise((resolve, reject) => {
        axios.post(
          "/v1/users/login",
          `uname=${obj.uname}&upwd=${obj.upwd}`
        ).then(result => {
          if (result.data.code == 200) {
            //则调用mutations中对应函数，更新state中的变量为本次请求回来的新值
            context.commit(
              "setUname",
              result.data.data[0].uname
            );
            context.commit(
              "setUid",
              result.data.data[0].uid
            );
            resolve();
          } else {
            reject('用户名或密码错误')
          }
        })
      })
    }
  },
  modules: {}
})