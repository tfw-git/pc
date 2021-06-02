<template>
  <div id="banner" :width="innerWidth" @mouseenter="stop" @mouseleave="start">
    <ul id="ul-imgs" :style="ulStyle" :class="ulClass">
      <li :width="innerWidth" v-for="(value,i) of imgs" :key="i">
        <a href>
          <img :src="value.img" :width="innerWidth" />
        </a>
      </li>
      <!-- 最后一张图片就是第一张 -->
      <li :width="innerWidth">
        <a href>
          <img :src="imgs[0].img" :width="innerWidth" />
        </a>
      </li>
    </ul>
    <ul id="ul-idxs">
      <li
        v-for="(img,idx) of imgs.length"
        :key="idx"
        :class="idx==i?'active':''"
        @click="moveTo(idx)"
      ></li>
    </ul>
    <!-- 左右箭头 -->
    <div id="btn-left" @click="move(-1)"></div>
    <div id="btn-right" @click="move(1)"></div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      innerWidth: window.innerWidth,
      imgs: [{ img: "" }],
      i: 0, //当前正在播放的是第几张图片
      canClick: true,
      ulClass: { transition: true },
    };
  },
  created() {
    //监视窗口变化
    window.addEventListener("resize", () => {
      this.innerWidth = window.innerWidth;
    });
    this.axios.get("/v1/carousel").then((result) => {
      this.imgs = result.data;
    });
  },
  computed: {
    //希望网页宽度变化或i变化，则自动重新计算ul的位置和大小
    ulStyle() {
      //修饰所有图片的父元素
      var width = this.innerWidth * (this.imgs.length + 1) + "px";
      var marginLeft = -this.i * this.innerWidth + "px";
      return { width, marginLeft };
    },
  },
  methods: {
    //自动移动和停止
    stop() {
      clearInterval(this.timer);
    },
    start() {
      this.timer = setInterval(() => {
        this.move(1);
      }, 3000);
    },
    move(i) {
      if (this.canClick) {
        this.canClick = false;
        if (i == -1 && this.i == 0) {
          //如果向右移动，且正在显示第1张图片，就要骗
          this.ulClass.transition = false; //去掉父级div上的transition样式类
          setTimeout(() => {
            //等50ms后，再进行后续操作
            this.i = this.imgs.length; //悄悄的将父级div移动到最左边
            setTimeout(() => {
              //等50ms后，再进行后续操作
              this.ulClass.transition = true; //打开父级div上的transition效果
              this.i += i; //正式向右移动一次
              setTimeout(() => {
                //200s后，才允许单击
                this.canClick = true;
              }, 600);
            }, 50);
          }, 50);
        } else if (this.i == 1 && this.imgs.length) {
          //向左移动，且已经是最后一张了
          this.i += i; //可以用过度左移一下
          setTimeout(() => {
            //移动到等于第一张的最后一张，骗用户,等动画先执行完
            this.ulClass.transition = false;
            setTimeout(() => {
              //等动画去完
              this.i = 0; //瞬间切换到第一张
              setTimeout(() => {
                //等50ms后，再次启用transition，为下次提供动画
                this.ulClass.transition = true;
                this.canClick = true; //允许点击
              }, 50);
            }, 50);
          }, 600);
        } else {
          this.i += i;
          setTimeout(() => {
            //防抖和节流
            this.canClick = true;
          }, 600);
        }
      }
    },
    // 指定哪张跳转到哪张
    moveTo(i) {
      if (this.canClick) {
        this.i = i;
        this.canClick = false;
        setTimeout(() => {
          this.canClick = true;
        }, 600);
      }
    },
  },
};
</script>
<style lang="scss" scoped>
@import '../assets/carousel.scss';
</style>
 