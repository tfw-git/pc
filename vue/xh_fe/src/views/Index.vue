<template>
  <div class="index">
    <carousel></carousel>
    <div class="top">
      <ul>
        <li>
          <div class="img"></div>
          <div class="right">
            <p>鲜花电商龙头</p>
            <p>销量领先，权威认证龙头企业</p>
          </div>
        </li>
        <li>
          <div class="img"></div>
          <div class="right">
            <p>10年品牌 真实口碑</p>
            <p>最近评论1764616条</p>
          </div>
        </li>
        <li>
          <div class="img"></div>
          <div class="right">
            <p>鲜花实拍秀展示</p>
            <p>敢展现送前实拍的鲜花网</p>
          </div>
        </li>
        <li>
          <div class="img"></div>
          <div class="right">
            <p>3小时送花</p>
            <p>全国连锁，3小时送1000城市</p>
          </div>
        </li>
        <li>
          <div class="img"></div>
          <div class="right">
            <p>200%退赔承诺</p>
            <p>可靠的售后保障</p>
          </div>
        </li>
      </ul>
    </div>
    <div class="xs">
      <ul>
        <li>
          <div class="img"></div>
          <p>限时推荐</p>
        </li>
        <li v-for="(value, i) of tj" :key="i">
          <img :src="value.img" alt />
        </li>
      </ul>
    </div>
    <div class="mm">
      <h3>
        <span>按花材</span>
        <a href="javascript:;">赠·父母/恩师/长辈</a>
        <a href="javascript:;">更多按花材>></a>
      </h3>
      <index-main :img="img1.img" :main="main[0]"></index-main>
      <h3>
        <span>鲜花</span>
        <a href="javascript:;">送让你怦然心动的人</a>
        <a href="javascript:;">更多鲜花>></a>
      </h3>
      <index-main :img="img2.img" :main="main[1]"></index-main>
      <h3>
        <span>花盒</span>
        <a href="javascript:;"></a>
        <a href="javascript:;">更多花盒>></a>
      </h3>
      <index-main :img="img3.img" :main="main[2]"></index-main>
      <h3>
        <span>蛋糕</span>
        <a href="javascript:;"></a>
        <a href="javascript:;">更多蛋糕>></a>
      </h3>
      <index-main :img="img4.img" :main="main[3]"></index-main>
    </div>
  </div>
</template>

<script>
import indexMain from "../components/IndexMain";
import carousel from "../components/Carousel.vue";
export default {
  components: {indexMain,carousel},
  data() {
    return {
      tj: [],
      img1: { img: "" },
      img2: { img: "" },
      img3: { img: "" },
      img4: { img: "" },
      // 设置初始值，防止请求未赋值时报错
      main: [
        [{ category: "" }],
        [{ category: "" }],
        [{ category: "" }],
        [{ category: "" }],
      ],
    };
  },
  methods: {
    top() {
      this.axios.get(`/v1/xhimg/导航`).then((result) => {
        // console.log(result.data)
        this.tj = result.data;
      });
    },
    mainl() {
      this.axios.get(`/v1/xhimg/左边`).then((result) => {
        [this.img1, this.img2, this.img3, this.img4] = result.data;
      });
    },
    mainr(name) {
      this.axios.get(`/v1/product/${name}`).then((result) => {
        if (name == "花材") {
          this.main.splice(0, 1, result.data);
        } else if (name == "鲜花") {
          this.main.splice(1, 1, result.data);
        } else if (name == "花盒") {
          this.main.splice(2, 1, result.data);
        } else {
          this.main.splice(3, 1, result.data);
        }
      });
    },
  },
  mounted() {
    this.top();
    this.mainl();
    this.mainr("花材");
    this.mainr("鲜花");
    this.mainr("花盒");
    this.mainr("蛋糕");
  },
};
</script>
<style lang='scss'>
@import "../assets/index.scss";
</style>
