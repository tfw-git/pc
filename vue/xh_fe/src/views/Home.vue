<template>
  <div class="home">
    <my-header></my-header>
    <!-- 路由嵌套 -->
    <router-view></router-view>
    <myfooter></myfooter>
  </div>
</template>

<script>
import Myfooter from '../components/Footer'
import MyHeader from '../components/Header'
export default {
  components: {
    Myfooter,
    MyHeader
  }
}
</script>
