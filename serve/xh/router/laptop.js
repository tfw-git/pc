//引入express模块
const express=require('express');
// 引入连接池模块
const pool=require('../pool.js');
//创建路由服务器
let router=express.Router();
//创建路由
// 查找对应单个商品
router.get('/:lid',(req,res,next)=>{
    let sql='SELECT * FROM xh_laptop WHERE lid=?';
    pool.query(sql,[req.params.lid],(err,result)=>{
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
//模糊查询，根据输入条件找出对应商品，主要为了确认商品数量以便确定页数
router.get('/search/:name',(req,res,next)=>{
    var lcategory="%"+req.params.name+"%";
    var title="%"+req.params.name+"%";
    if(req.params.name=="鲜花"){
        title=null
    };
    let sql='SELECT * FROM xh_laptop WHERE lcategory like ? or title like ?';
    pool.query(sql,[lcategory,title],(err,result)=>{
        if(err){
            //将错误交给下一个中间件
            next(err);
            //阻止往后执行
            return;
        }
        if(result.length>0){
            res.send({code:200,msg:'查询成功',data:result});
        }else{
            res.send({code:201,msg:'查询失败'});
        }
    })
})
// 模糊查询+分页(传递对应搜索条件和页码即可)
router.get('/search/:name/:page',(req,res,next)=>{
    // 这里限制每页数据为6条
    var count=6;
    //每页起始下标=（页码-1）*每页数量
	var start=(req.params.page-1)*count;
    var lcategory="%"+req.params.name+"%";
    var title="%"+req.params.name+"%";
    if(req.params.name=="鲜花"){
        title=null
    };
    let sql='SELECT * FROM xh_laptop WHERE lcategory like ? or title like ? limit ?,?';
    pool.query(sql,[lcategory,title,start,count],(err,result)=>{
        if(err){
            //将错误交给下一个中间件
            next(err);
            //阻止往后执行
            return;
        }
        if(result.length>0){
            res.send({code:200,msg:'查询成功',data:result});
        }else{
            res.send({code:201,msg:'查询失败'});
        }
    })
})
//导出路由
module.exports=router;