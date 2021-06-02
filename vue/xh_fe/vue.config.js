module.exports={
    //配置彻底懒加载
    chainWebpack:config=>{
      config.plugins.delete("prefetch")
      //删除index.html开头的带有prefetch属性的link，不要异步下载暂时不需要的页面组件文件
    },
    // http代理跨域
    devServer:{
      proxy:{
        '/':{//相对路径必须以/开头
          target:`http://127.0.0.1:3000`,
          changeOrigin:true
        }
      }
    }
}  