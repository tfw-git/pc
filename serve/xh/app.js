// 引入express模块
const express=require('express');
// 引入body-parse中间件
const bodyparser=require('body-parser');
// 引入跨域模块cors
var cors=require("cors");
//引入路由
const routerUser=require('./router/user.js');
const routerCarousel=require('./router/carousel.js');
const routerClass=require('./router/class.js');
const routerImg=require('./router/xhImg.js');
const routerProduct=require('./router/product.js');
const routerLaptop=require('./router/laptop.js');
//创建服务器
let app=express();
// 设置端口号
app.listen(3000);
//使用第三方中间件
app.use(bodyparser.urlencoded({extended:false}));
// 跨域请求
app.use(cors({
    origin:[ "http://127.0.0.1:5500"]
}));
// 托管静态资源到public目录
app.use(express.static('public'));
//添加前缀
app.use('/v1/users',routerUser);
app.use('/v1/carousel',routerCarousel);
app.use('/v1/class',routerClass);
app.use('/v1/xhimg',routerImg);
app.use('/v1/product',routerProduct);
app.use('/v1/laptop',routerLaptop);
//要拦截所有产生的错误
app.use((err,req,res,next)=>{
    //接收到的错误
    console.log(err);
    res.send({code:500,msg:'服务器端错误'});
})
//测试服务器是否正常
// app.get('/login',(req,res)=>{
//     res.send('你好')
// })