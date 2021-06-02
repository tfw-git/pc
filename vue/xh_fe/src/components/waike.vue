<template>
    <div class="waike">
        <div class="top">
            <div class="main">
                <img src="/img/index_img/logo.gif" alt="">
                <div class="but">
                    <slot name="tz"></slot>
                    <!-- <span>如未注册，点此</span>
                    <a href="">登录</a> -->
                </div>
            </div>
        </div>
        <div class="bottom">
            <slot name="zt"></slot>
        </div>
    </div>
</template>
<style lang='scss'>
   @import '../assets/waike.scss'
</style>