//引入express模块
const express=require('express');
// 引入连接池模块
const pool=require('../pool.js');
//创建路由服务器
let router=express.Router();
//创建路由
router.get('/:category',(req,res,next)=>{
    let sql='SELECT * FROM xh_index_product WHERE category=?';
    pool.query(sql,[req.params.category],(err,result)=>{
        if(err){
            //将错误交给下一个中间件
            next(err);
            //阻止往后执行
            return;
        }
        if(result.length>0){
            res.send(result);
        }else{
            res.send({code:201,msg:'查询失败'});
        }
    })
})
//导出路由
module.exports=router;