//引入mysql模块
const mysql=require('mysql');
//创建链接池对象
let pool=mysql.createPool({
    host:'127.0.0.1',
    port:3306,
    user:'root',
    password:'',
    database:'xh',
    connectionLimit:15
})
//导出mysql模块
module.exports=pool;