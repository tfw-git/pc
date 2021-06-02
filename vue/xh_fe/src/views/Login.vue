<template>
    <div class="login">
        <waike>
            <template #tz>
                <span>如未注册，点此</span>
                <router-link to="/register">注册</router-link>
            </template>
            <template #zt>
                <ul class="zt">
                    <li @click="change(1)" :style="{'border-bottom-color':active==1?'#ff6a00':'#8a8a8a8a'}">
                        <img src="/img/login/user2.png" alt="" v-show="active==2">
                        <img src="/img/login/user.png" alt="" v-show="active==1">
                        <span :style="{color:active==1?'#ff6a00':'#8a8a8a8a'}">会员登录</span>
                    </li>
                    <li @click="change(2)" :style="{'border-bottom-color':active==2?'#ff6a00':'#8a8a8a8a'}">
                        <img src="/img/login/phone2.png" alt="" v-show="active==1">
                        <img src="/img/login/phone.png" alt="" v-show="active==2">
                        <span :style="{color:active==2?'#ff6a00':'#8a8a8a8a'}">手机号登录</span>
                    </li>
                </ul>
                <div class="phone" v-show="active==2">
                    <span>
                        功能尚未开放，请选择用用户名和密码登录！
                    </span>
                </div>
                <div class="user" v-show="active==1">
                    <input type="text" placeholder="用户名、手机号、邮箱" v-model="user"
                        :style="{'border-color':usershow?'red':'#cccccc'}">
                    <div class="err"><span v-show="usershow">用户名不能为空</span></div>
                    <input type="password" placeholder="密码" v-model="pwd"
                        :style="{'border-color':pwdshow?'red':'#cccccc'}">
                    <div class="err"><span v-show="pwdshow">密码不能为空</span></div>
                    <div class="btns">
                        <button @click="login">登录</button>
                        <button @click="close">取消</button>
                    </div>
                    <!-- <div>{{uname}}</div> -->
                </div>
            </template>
        </waike>
    </div>
</template>
<script>
    import Waike from "../components/waike"
    import {
        mapActions
    } from 'vuex'
    // import { mapState } from "vuex"
    export default {
        components: {
            Waike
        },
        data() {
            return {
                active: 1,
                user: "",
                pwd: "",
                usershow: false,
                pwdshow: false,
            }
        },
        methods: {
            ...mapActions(["vlogin"]),
            change(n) {
                this.active = n;
            },
            login() {
                // 由于在重置时user返回undefined所以需要判断一下
                if (this.user == "" || this.user == undefined) {
                    this.usershow = true;
                }
                if (this.pwd == "" || this.pwd == undefined) {
                    this.pwdshow = true;
                }
                  console.log(this.usershow,this.pwdshow)
                if (this.usershow == false && this.pwdshow == false) {
                  
                    //调用actions中的vlogin方法，并传入由用户名和密码组成的一个对象。
                    this.vlogin({
                        uname: this.user,
                        upwd: this.pwd
                    }).then(() => {
                        alert("登录成功！");
                        this.$router.push('/')
                    }).catch(err => {
                        alert(err);
                    });
                }

            },
            close() {
                // 返回初始状态只需要返回undefined即可
                this.user = undefined;
                this.pwd = undefined;
            }
        },
        watch: {
            user() {
                // 判断是否为空即可，避免与重置冲突
                this.user == '' ? this.usershow = true : this.usershow = false;
            },
            pwd() {
                this.pwd == '' ? this.pwdshow = true : this.pwdshow = false
            }
        },
        // computed:{
        //     ...mapState(["uname"])
        // }
    }
</script>
<style lang="scss">
    @import '../assets/login.scss'
</style>