//引入express模块
const express=require('express');
// 引入连接池模块
const pool=require('../pool.js');
//引入node自带的加密模块
const crypto=require('crypto');
//创建路由服务器
let router=express.Router();
//创建路由
//登录
router.post('/login',(req,res,next)=>{
    // 对输入的密码进行md5加密
    var pwd=req.body.upwd;
    var md5 = crypto.createHash('md5')
    var upwd = md5.update(pwd).digest('hex')
    let sql='SELECT * FROM xh_user WHERE uname=? AND upwd=?';
    pool.query(sql,[req.body.uname,upwd],(err,result)=>{
        if(err){
            //将错误交给下一个中间件
            next(err);
            //阻止往后执行
            return;
        }
        if(result.length>0){
            res.send({code:200,msg:'登录成功',data:result});
        }else{
            res.send({code:201,msg:'登陆失败'});
        }
    })
})
//注册
router.post('/reg',(req,res,next)=>{
    // 对输入的密码进行md5加密
    var pwd=req.body.upwd;
    var md5 = crypto.createHash('md5')
    var upwd = md5.update(pwd).digest('hex');
    let sql='INSERT INTO xh_user VALUES(null,?,?)';
    pool.query(sql,[req.body.uname,upwd],(err,result)=>{
        if(err){
			//把错误交给下一个中间件来处理
			next(err);
			//阻止往后执行
			return;
		}
        if(result.affectedRows>0){
			res.send({code:200,msg:'注册成功'});
		}else{
			res.send({code:201,msg:'注册失败'});
		}
    })
})
//删除用户(路由传参请求非空验证交给前台)
router.delete('/:uname',(req,res,next)=>{
	let obj=req.params;
	let sql='DELETE FROM xh_user WHERE uname=?';
	pool.query(sql,[obj.uname],(err,result)=>{
		if(err){
			//把错误交给下一个中间件来处理
			next(err);
			//阻止后续代码执行
			return;
		}
		if(result.affectedRows>0){
			res.send({code:200,msg:'删除成功'});
		}else{
			res.send({code:201,msg:'删除失败'});
		}
	})
});
//验证用户
router.get('/query/:uname',(req,res,next)=>{
    let sql='SELECT * FROM xh_user WHERE uname=?';
    pool.query(sql,[req.params.uname],(err,result)=>{
        if(err){
			//把错误交给下一个中间件来处理
			next(err);
			//阻止后续代码执行
			return;
		}
        if(result.length>0){
            res.send({code:200,msg:'查询成功'});
        }else{
            res.send({code:201,msg:'查询失败'});
        }
    })
})
//导出用户路由
module.exports=router;