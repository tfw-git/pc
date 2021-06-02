<template>
  <div class="header">
    <div class="login">
      <div class="mm">
        <router-link to="/login" v-show="uname==''?true:false">会员登录</router-link>
        <router-link to="/register" v-show="uname==''?true:false">会员注册</router-link>
        <div class="login_xx" v-show="uname==''?false:true">
          <p>{{uname}}</p>
          <p class="img"></p>
          <ul>
            <li>个人中心</li>
            <li>我的收藏</li>
            <li>我的评论</li>
            <li>跟踪包裹</li>
            <li @click="tc('')">退出登录</li>
          </ul>
        </div>
        <div class="login_xx">
          <p>我的信息</p>
          <p class="img"></p>
          <ul>
            <li>以买到的宝贝</li>
            <li>我的地址管理</li>
            <li>我收藏的宝贝</li>
          </ul>
        </div>
        <div class="gw">
          <div class="tu"></div>
          <p>购物车(0)</p>
          <div class="ll">
            <span>购物车中还没有商品，赶快去买吧</span>
          </div>
        </div>
      </div>
    </div>
    <div class="login-search">
      <div class="logo"></div>
      <div class="search">
        <div class="top">
          <input type="text" placeholder="请输入关键字" v-model="searchinput" @keyup.13="search" />
          <button @click="search">搜索</button>
        </div>
        <div class="bott">
          <span>热搜榜：</span>
          <a href>蛋糕</a>
          <a href>鲜花</a>
          <a href>红玫瑰</a>
          <a href>高档礼盒</a>
        </div>
      </div>
    </div>
    <div class="navv">
      <div class="nav">
        <div class="ej">
          <p>所有商品分类</p>
          <p class="img"></p>
          <ul>
            <li v-for="(value,i) of ejshopping" :key="i">
              <div class="top">
                <a href="javascript:;">{{value.title}}</a>
                <img src="/img/index_img/right.png" alt />
              </div>
              <p>{{JSON.parse(value.stitle)[0]+","+JSON.parse(value.stitle)[1]}}</p>
              <div class="left">
                <p v-for="(v,ii) in JSON.parse(value.stitle)" :key="ii">{{v}}</p>
              </div>
            </li>
          </ul>
        </div>
        <ul class="tz">
          <li>
            <router-link to="/">首页</router-link>
          </li>
          <li>
            <router-link to="/">鲜花</router-link>
          </li>
          <li>
            <router-link to="/">蛋糕</router-link>
          </li>
          <li>
            <router-link to="/">开业花篮</router-link>
          </li>
          <li>
            <router-link to="/">鲜花蛋糕组合</router-link>
          </li>
          <li>
            <router-link to="/">绿植</router-link>
          </li>
          <li>
            <router-link to="/">圣诞节</router-link>
          </li>
        </ul>
      </div>
    </div>

    <!-- <div class="main"></div> -->
  </div>
</template>
<script>
import { mapState } from "vuex";
import { mapMutations } from "vuex";
export default {
  data() {
    return {
      ejshopping: [],
      searchinput: "",
    };
  },
  methods: {
    //  二级菜单
    ej() {
      this.axios.get("/v1/class/").then((result) => {
        this.ejshopping = result.data;
      });
    },
    ...mapMutations(["setUid", "setUname"]),
    //退出登录
    tc(name) {
      if (window.confirm("你确定要退出登录状态吗？")) {
        this.setUname(name);
      }
      // this.$router.go(0)
    },
    // 模糊搜索
    search() {
      this.$router.push(`/search/${this.searchinput}`);
    },
  },
  mounted() {
    this.ej();
  },
  computed: {
    ...mapState(["uname", "uid"]),
  },
  // 首次加载进入搜索页面时加载地址栏中的参数
  created() {
    this.searchinput = this.$route.params.name;
  },
  watch: {
    //监视地址栏变化，一旦发生变化输入框中就会获得对应参数值
    $route() {
      this.searchinput = this.$route.params.name;
    },
  },
};
</script>
<style lang="scss">
@import "../assets/herder.scss";
</style>