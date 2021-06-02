<template>
    <div class="register">
        <waike>
            <template #tz>
                <span>如未登录，点此</span>
                <router-link to="/login">登录</router-link>
            </template>
            <template #zt>
                <div class="reg">新用户注册</div>
                <div class="reg_main">
                    <input type="text" placeholder="用户名" v-model="user">
                    <div class="img" v-show="!styleuser"></div>
                    <div class="err"><span v-text="erruser" v-show="styleuser"></span></div>
                    <input type="password" placeholder="密码" v-model="upwd">
                    <div class="img" v-show="!styleupwd"></div>
                    <div class="err"><span v-text="errupwd" v-show="styleupwd"></span></div>
                    <input type="password" placeholder="确认密码" v-model="cpwd">
                    <div class="img" v-show="!stylecpwd"></div>
                    <div class="err"><span v-text='errcpwd' v-show="stylecpwd"></span></div>
                    <div class="btns">
                        <button @click="register">注册</button>
                        <button @click="reset">取消</button>
                    </div>
                </div>
            </template>
        </waike>
    </div>
</template>
<script>
    import Waike from "../components/waike"
    export default {
        components: {
            Waike
        },
        data() {
            return {
                user: '',
                upwd: '',
                cpwd: '',
                erruser: '',
                errcpwd: '',
                errupwd: '',
                styleuser: true,
                styleupwd: true,
                stylecpwd: true
            }
        },
        methods: {
            register() {
                //用户名
                if (this.user == undefined || this.user == '') {
                    this.erruser = '用户名不能为空'
                }
                // 密码
                if (this.upwd == undefined || this.upwd == '') {
                    this.errupwd = '密码不能为空'
                }
                //重复密码框
                if (this.cpwd == undefined || this.cpwd == '') {
                    this.errcpwd = '密码不能为空'
                }
                // 注册用户
                if (this.styleuser == false && this.styleupwd == false && this.stylecpwd == false) {
                    this.axios.post(
                        '/v1/users/reg',
                        `uname=${this.user}&upwd=${this.upwd}`
                    ).then(result => {
                        alert(result.data.msg);
                        this.$router.push('login')
                    });
                }
            },
            reset() {
                // 重置表单内容
                this.user = undefined;
                this.upwd = undefined;
                this.cpwd = undefined;
                this.styleuser = true;
                this.styleupwd = true;
                this.stylecpwd = true;
                this.erruser = '';
                this.errupwd = '';
                this.errcpwd = '';
            }
        },
        watch: {
            user() {
                if (this.user != undefined) {
                    if (this.user.length < 6 || this.user.length > 12 || this.user == '') {
                        this.erruser = '用户名长度为6~12位';
                        this.styleuser = true
                    } else {
                        this.axios.get(`/v1/users/query/${this.user}`).then(result => {
                            if (result.data.code == 200) {
                                this.erruser = '用户名已存在';
                                this.styleuser = true;
                            } else {
                                this.styleuser = false
                                // 防抖节流
                                if(this.user==''){
                                    this.styleuser=true;
                                }
                            }
                        })
                    }
                }
            },
            upwd() {
                if (this.upwd != undefined) {
                    if (this.upwd.length < 6 || this.upwd.length > 8 || this.upwd == '') {
                        this.errupwd = '密码长度为6~8位'
                        this.styleupwd = true
                    } else {
                        this.styleupwd = false
                    }
                }

            },
            cpwd() {
                if (this.cpwd != undefined) {
                    if (this.cpwd.length < 6 || this.cpwd.length > 8 || this.cpwd == '') {
                        this.errcpwd = '密码长度为6~8位'
                        this.stylecpwd = true
                    } else if (this.upwd != this.cpwd) {
                        this.errcpwd = '两次密码输入不一致!'
                        this.stylecpwd = true
                    } else {
                        this.stylecpwd = false
                    }
                }

            }
        }

    }
</script>
<style lang="scss">
    @import '../assets/register.scss'
</style>