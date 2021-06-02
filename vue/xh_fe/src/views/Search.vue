<template>
  <div class="search">
    <div class="top">
      <span>首页>></span>
      <span>商品搜索>></span>
      <span>{{name}}</span>
    </div>
    <div class="main">
      <div class="left">
        <dl v-for="(value,i) of ejshop" :key="i">
          <dt>{{value.title}}</dt>
          <dd v-for="(zhi,index) of JSON.parse(value.stitle)" :key="index">{{zhi}}</dd>
        </dl>
      </div>
      <!-- 没有搜索到商品就显示该区域 -->
      <div class="not" v-show="shopings.length==0">
        <div>没有该商品，试试搜索鲜花、蛋糕？</div>
      </div>
      <!-- 没有搜索到商品就不显示该区域 -->
      <div class="ri" v-show="shopings.length!=0">
        <div class="ritop">
          <div class="num">
            <span>共有</span>
            <span>{{shopings.length}}</span>
            <span>个商品</span>
            <div class="back" @click="back"></div>
            <span class="page">{{page}}</span>
            <span class="pages">/{{pages}}</span>
            <div class="frond" @click="frond"></div>
          </div>
        </div>
        <ul class="shop">
          <li v-for="(value,i) of shopingspage" :key="i">
            <!-- 点击每个商品图片跳转到对应详情页 -->
            <img :src="JSON.parse(value.magnifier)[0]" alt @click="details(value.lid)" />
            <div class="pr">
              <span>¥{{value.pic}}元</span>
              <div>
                <span>{{value.sold_count}}</span>
                <span>人付款</span>
              </div>
            </div>
            <div class="title">{{value.title}}</div>
            <div class="count">
              <!-- 动态绑定每个商品的数量 -->
              <input type="text" v-model="value.counts" />
              <div>
                <button class="jia" @click="add(i)">+</button>
                <button class="jian" @click="jj(i)">-</button>
              </div>
              <div class="gw">加入购物车</div>
            </div>
          </li>
        </ul>
        <div class="bottom_page">
          <ul>
            <li @click="back" v-show="page!=1">上一页</li>
            <li :class="page==value?'active':''" v-for="(value,i) of pages" :key="i" @click="changepage(value)">
              {{value}}</li>
            <li @click="frond" v-show="page!=pages">下一页</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    // 获取地址栏传过来的值
    props: ["name"],
    data() {
      return {
        ejshop: "",
        page: 1,
        shopings: [],
        shopingspage: [],
      };
    },
    methods: {
      all() {
        // 获取搜索到的所有商品
        this.axios.get(`/v1/laptop/search/${this.name}`).then((result) => {
          if (result.data.code == 200) {
            this.shopings = result.data.data;
          } else {
            this.shopings = [];
          }
        });
      },

      shop() {
        // 分页模糊查询
        this.axios
          .get(`/v1/laptop/search/${this.name}/${this.page}`)
          .then((result) => {
            if (result.data.code == 200) {
              this.shopingspage = result.data.data;
            } else {
              this.shopingspage = [];
            }
            //   console.log(result.data);
          });
      },
      //修改给个商品的数量
      jj(i) {
        if (this.shopingspage[i].counts > 1) {
          this.shopingspage[i].counts--
        }
      },
      add(i) {
        this.shopingspage[i].counts++
      },
      changepage(value) {
        this.page = value;
      },
      //当前页前进或后退
      back() {
        if (this.page > 1) {
          this.page--;
        }
      },
      frond() {
        if (this.page == this.pages) {
          this.page = 3;
        } else {
          this.page++;
        }
      },
      // 点击图片跳转
      details(lid) {
        this.$router.push(`/details/${lid}`);
      },
    },
    created() {
      //获取二级菜单数据
      this.axios.get("/v1/class/").then((result) => {
        this.ejshop = result.data;
      });
      this.all();
      this.shop();
    },
    computed: {
      //计算有多少页
      pages() {
        return Math.ceil(this.shopings.length / 6);
      },
    },
    watch: {
      // 监控搜索框中的变化，变化一次就重新发送一下数据
      name() {
        this.page = 1;
        this.all();
        this.shop();
      },
      page() {
        this.shop();
      },
    },
  };
</script>
<style lang="scss">
  @import "../assets/search.scss";
</style>