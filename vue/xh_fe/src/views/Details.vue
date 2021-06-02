<template>
  <div class="details">
    <div class="top">
      <span>您当前的位置：</span>
      <span>{{shop.lcategory}}>></span>
      <span>{{shop.title}}</span>
    </div>
    <div class="main">
      <div class="le">
        <div class="fd">
          <!-- 中图片处 -->
          <div class="md" @mouseover="jr" @mouseout="cq" @mousemove="move">
            <img :src="magnifier[active]" />
            <!-- 放大1.6 -->
            <div :class="{move:show}" :style="{top:top+'px',left:left+'px'}"></div>
          </div>
          <div class="bot">
            <div class="left" @click="moveleft"></div>
            <div class="xm">
              <ul :style="{width:magnifier.length*87.5+'px','margin-left':-87.5*times+'px'}">
                <li
                  :class="{active:active==i?true:false}"
                  v-for="(value,i) of magnifier"
                  :key="i"
                  @click="change(i)"
                >
                  <img :src="value" />
                </li>
              </ul>
            </div>

            <div class="right" @click="moveright"></div>
          </div>
          <!-- class="lg" -->
          <div
            class="lg"
            :style="{display:show==true?'block':'none','background-image':`url(${magnifier[active]})`,'background-position':`${parseInt(-left*1.6)}px ${parseInt(-top*1.6)}px`}"
          >
            <!-- <img :src="magnifier[active]"  :style="{ transform:`translate(200px,200px)`}"/> -->
          </div>
        </div>
        <div class="xq">
          <h3>{{shop.title}}</h3>
          <p>{{shop.subtitle}}</p>
          <div class="cont">
            <div>
              <span>市场价</span>
              <span>
                <del>{{(price*1.25).toFixed(2)}}元</del>
              </span>
            </div>
            <div>
              <span>本店价</span>
              <span>{{(price).toFixed(2)}}元</span>
            </div>
            <div>
              <pre>促　销</pre>
              <span v-text="shop.is_onsale==1?'[优惠活动]下单享受免费配送':'抱歉不打折'"></span>
            </div>
            <div>
              <pre>销　量</pre>
              <span class="zj">
                最近售出
                <span>{{shop.sold_count}}件</span>
                (
                <span>已有{{shop.pcount}}人评价</span>
                )
              </span>
            </div>
          </div>
          <div class="ccun" v-show="shop.lcategory=='蛋糕'?true:false">
            <span>尺寸</span>
            <div class="butts">
              <button :class="{active:dgactive==1?true:false}" @click="cc(1)">8寸 (2-5人食用)</button>
              <button :class="{active:dgactive==1.4?true:false}" @click="cc(1.4)">10寸 (5-8人食用)</button>
              <button :class="{active:dgactive==1.6?true:false}" @click="cc(1.6)">12寸 (8-10人食用)</button>
              <button :class="{active:dgactive==1.8?true:false}" @click="cc(1.8)">14寸 (10-15人食用)</button>
              <button :class="{active:dgactive==2?true:false}" @click="cc(2)">16寸 (15-20人食用)</button>
              <button :class="{active:dgactive==2.2?true:false}" @click="cc(2.2)">18寸 (20-25人食用)</button>
            </div>
          </div>
          <div class="js">
            <pre>数　量</pre>
            <div class="count">
              <button class="jian" @click="jj">-</button>
              <input type="text" class="show" v-model="count" />
              <button class="jia" @click="add">+</button>
            </div>
            <span>件</span>
            <span>({{shop.Inventory}}件)</span>
          </div>
          <div class="gm">
            <ul>
              <li>
                <button>立即购买</button>
              </li>
              <li>
                <button>加入购物车</button>
              </li>
              <li>
                <div>
                  <img src="/img/details/xx.png" alt />
                  收藏
                </div>
              </li>
              <li>
                <div class="phone">去手机购买</div>
                <div class="ew">
                  <img src="/img/details/1.png" alt />
                  <div class="jian"></div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="ri">
        <h3>
          <span>看了又看</span>
          <img src="/img/details/show.png" alt />
        </h3>
        <ul>
          <li>
            <img src="/img/details/1.jpg" alt />
          </li>
          <li>
            <img src="/img/details/2.jpg" alt />
          </li>
          <li>
            <img src="/img/details/3.jpg" alt />
          </li>
        </ul>
      </div>
    </div>
    <div class="botton">
      <div class="lee">
        <div class="head">
          <ul>
            <li>商品详情</li>
            <li>
              商品评价(
              <span>0</span>)
            </li>
          </ul>
        </div>
        <div class="xia">
          <div class="ttp">
            <div class="name">产品名称：</div>
            <div class="title">{{shop.title}}</div>
          </div>
          <img :src="value" v-for="(value,i) of detailmap" :key="i" />
        </div>
      </div>
      <div class="rii">
        <div class="hh">热卖商品</div>
        <div class="rm">
          <ul>
            <li>
              <img src="/img/details/4.jpg" alt />
              <p>天鹅皇冠蛋糕|爱女神</p>
              <p>¥238元</p>
            </li>
            <li>
              <img src="/img/details/5.jpg" alt />
              <p>深情的爱-网红双层蛋糕</p>
              <p>¥358元</p>
            </li>
            <li>
              <img src="/img/details/6.jpg" alt />
              <p>羽毛告白-网红鲜奶蛋糕</p>
              <p>¥238元</p>
            </li>
            <li>
              <img src="/img/details/7.jpg" alt />
              <p>小猪佩奇-网红款式</p>
              <p>¥228元</p>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ["lid"],
  data() {
    return {
      //   判断是否为蛋糕，是就显示尺寸
      dg: "",
      shop: {
        //  定义初始值为空，防止未加载时报错
        lid: "",
        title: "",
        subtitle: "",
        pic: 0,
        is_onsale: "",
        sold_count: "",
        pcount: "",
        lcategory: "",
        Inventory: "",
        magnifier: "",
        detailmap: "",
      },
      magnifier: [],
      detailmap: [],
      count: 1,
      dgactive: 0,
      dgpic: 0,
      // 定义变量表示选中放大镜哪张图
      active: 0,
      //控制小图移动
      times: 0,
      //设置变量控制放大镜显示或隐藏
      show: false,
      left: 0,
      top: 0,
    };
  },
  methods: {
    shopping(lid) {
      this.axios.get(`/v1/laptop/${lid}`).then((result) => {
        [this.shop] = result.data;
        this.magnifier = JSON.parse(this.shop.magnifier);
        this.detailmap = JSON.parse(this.shop.detailmap);
        // 用于保存价格初始值，当点击蛋糕价格变化时再次点击好拿到初始值
        this.dgpic = this.shop.pic;
      });
    },
    jj() {
      if (this.count > 1) {
        this.count--;
      }
    },
    add() {
      this.count++;
    },
    // 放大镜图片改变
    change(i) {
      this.active = i;
    },
    // 选尺寸计算蛋糕价格
    cc(n) {
      //第二次点击时返回蛋糕第一次获取的初始值
      this.shop.pic = this.dgpic;
      this.dgactive = n;
      this.shop.pic *= n;
    },
    // 控制图片移动
    moveleft() {
      if (this.times != 0) {
        this.times--;
      }
    },
    moveright() {
      // 超出原来多少个就可以点多少次
      if (this.times < this.magnifier.length - 4) {
        this.times++;
      }
    },
    // 放大镜进入
    jr() {
      this.show = true;
    },
    // 放大镜移除
    cq() {
      this.show = false;
    },
    // 放大鼠标跟随
    move(e) {
      var left = e.offsetX - 118.75;
      var top = e.offsetY - 118.75;
      if (left < 0) left = 0;
      else if (left > 142.5) left = 142.5;
      if (top < 0) top = 0;
      else if (top > 142.5) top = 142.5;
      this.left = left;
      this.top = top;
    },
  },
  mounted() {
    this.shopping(this.lid);
  },
  computed: {
    price() {
      var result = 0;
      if (this.count > 0) {
        result = this.shop.pic * this.count;
      }
      return result;
    },
  },
  //监视地址栏变化
  watch: {
    lid() {
      //   一旦发生变化马上就重新发送请求
      this.shopping(this.lid);
    },
    //监视数量类型
    count() {
      var str = /^\d{1,5}$/;
      if (!str.test(this.count)) {
        alert("请输入合法的数字");
        this.count = 1;
      }
    },
  },
};
</script>
<style lang="scss">
@import "../assets/details.scss";
</style>