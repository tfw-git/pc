<template>
  <div class="main">
    <div class="bot">
      <div class="le">
        <img :src="img" alt />
        <div>
          <span>{{main[0].category}}专区>></span>
        </div>
      </div>
      <div class="ri">
        <ul>
          <li v-for="(value, i) of main" :key="i" @click="tz(value.lid)">
            <img :src="value.img" alt />
            <p>{{ value.title }}</p>
            <p>￥{{ value.price }}元</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ["img", "main"],
  methods: {
    tz(lid) {
      this.$router.push(`/details/${lid}`);
    },
  },
};
</script>