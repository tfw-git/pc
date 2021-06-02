SET NAMES UTF8;
DROP DATABASE IF EXISTS xh;
CREATE DATABASE xh CHARSET=UTF8;
USE xh;
#用户表
CREATE TABLE xh_user(
    uid INT PRIMARY KEY AUTO_INCREMENT, #主键
    uname VARCHAR(32) NOT null UNIQUE,  #用户名
    upwd VARCHAR(32)  #密码
);
#轮播图表
CREATE TABLE xh_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128) #图片地址
);
#首页商品
CREATE TABLE xh_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32), #展示标题
    img VARCHAR(128), #图片
    price INT, #价格
    category VARCHAR(32), #商品类别
    lid INT #关联商品ID
);
#展示图片
CREATE TABLE xh_index_img(
    gid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128), #图片地址
    gcategory VARCHAR(32), #图片类别，用于哪个区域
    lid INT
);
#商品表
CREATE TABLE xh_laptop(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128),   #主标题
    subtitle VARCHAR(128), #副标题
    pic INT, #价格
    is_onsale BOOLEAN,  #是否促销中
    sold_count INT,     #已售出的数量
    pcount INT, #评论人数
    lcategory VARCHAR(32), #类别名称，根据类别去查找
    Inventory INT, #库存量
    magnifier VARCHAR(500), #放大镜图
    detailmap VARCHAR(700), #详情图
    counts INT
    
);

#商品分类
CREATE TABLE xh_class(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32), #商品类别
    stitle VARCHAR(128) #二级标题
);
#向用户表添加数据
INSERT INTO xh_user VALUES(null,'admin',md5('123')); #使用md5加密保护密码
INSERT INTO xh_user VALUES(null,'dongdong',md5('123'));
INSERT INTO xh_user VALUES(null,'张三',md5('123'));

#分类表
INSERT INTO xh_class VALUES(null,'圣诞节','["圣诞节花","圣诞节礼品","平安夜花盒","圣诞节蛋糕"]');
INSERT INTO xh_class VALUES(null,'鲜花','["按花材","按类别","鲜花枝数","按颜色","按节日"]');
INSERT INTO xh_class VALUES(null,'蛋糕','["按对象","按石材","按造型"]');
INSERT INTO xh_class VALUES(null,'开业花篮','["开业","乔迁","庆典","活动","会议","祝贺"]');
INSERT INTO xh_class VALUES(null,'鲜花用途','["爱情鲜花","友情鲜花","生日鲜花","问候长辈","回报老师","探病慰问","鲜花道歉","婚庆鲜花","祝贺鲜花","哀思鲜花","商务鲜花","开业花篮"]');
INSERT INTO xh_class VALUES(null,'绿植','["发财树","绿萝","其他"]');
#轮播图
INSERT INTO xh_index_carousel VALUES(null,"http://127.0.0.1:3000/img/carousel/1.jpg");
INSERT INTO xh_index_carousel VALUES(null,"http://127.0.0.1:3000/img/carousel/2.jpg");
#首页商品
INSERT INTO xh_index_product  VALUES(null,"爱的星星-19朵粉玫瑰加满天星","http://127.0.0.1:3000/img/index_product/1.jpg",388,"花材",1);
INSERT INTO xh_index_product  VALUES(null,"红色康乃馨29枝、粉色百合3枝、黄色","http://127.0.0.1:3000/img/index_product/2.jpg",428,"花材",2);
INSERT INTO xh_index_product  VALUES(null,"粉色康乃馨16枝、浅粉满天星3枝、尤加利10枝","http://127.0.0.1:3000/img/index_product/3.jpg",298,"花材",3);
INSERT INTO xh_index_product  VALUES(null,"红色康乃馨11枝，粉色勿忘我3枝、尤加利10枝","http://127.0.0.1:3000/img/index_product/4.jpg",248,"花材",4);
INSERT INTO xh_index_product  VALUES(null,"执手相依-11朵红玫瑰 尤加利搭配","http://127.0.0.1:3000/img/index_product/5.jpg",268,"花材",5);
INSERT INTO xh_index_product  VALUES(null,"皇冠恋人-33朵精品玫瑰搭配皇冠，黑色英文缎带搭配","http://127.0.0.1:3000/img/index_product/6.jpg",469,"花材",6);
INSERT INTO xh_index_product  VALUES(null,"爱的心光-99朵红玫瑰，黑色英文缎带搭配","http://127.0.0.1:3000/img/index_product/7.jpg",1699,"花材",7);
INSERT INTO xh_index_product  VALUES(null,"仙气腾腾-11朵粉玫瑰","http://127.0.0.1:3000/img/index_product/8.jpg",249,"花材",8);

INSERT INTO xh_index_product  VALUES(null,"爱的星星-19朵粉玫瑰加满天星","http://127.0.0.1:3000/img/index_product/1.jpg",388,"鲜花",9);
INSERT INTO xh_index_product  VALUES(null,"红色康乃馨29枝、粉色百合3枝、黄色","http://127.0.0.1:3000/img/index_product/2.jpg",428,"鲜花",10);
INSERT INTO xh_index_product  VALUES(null,"粉色康乃馨16枝、浅粉满天星3枝、尤加利10枝","http://127.0.0.1:3000/img/index_product/3.jpg",298,"鲜花",11);
INSERT INTO xh_index_product  VALUES(null,"红色康乃馨11枝，粉色勿忘我3枝、尤加利10枝","http://127.0.0.1:3000/img/index_product/4.jpg",248,"鲜花",12);
INSERT INTO xh_index_product  VALUES(null,"执手相依-11朵红玫瑰 尤加利搭配","http://127.0.0.1:3000/img/index_product/5.jpg",268,"鲜花",13);
INSERT INTO xh_index_product  VALUES(null,"秘密花园-19朵精品蓝妖姬","http://127.0.0.1:3000/img/index_product/9.jpg",428,"鲜花",14);
INSERT INTO xh_index_product  VALUES(null,"皇冠恋人-33朵精品玫瑰搭配皇冠，黑色英文缎带搭配","http://127.0.0.1:3000/img/index_product/6.jpg",469,"鲜花",15);
INSERT INTO xh_index_product  VALUES(null,"爱的心光-99朵红玫瑰，黑色英文缎带搭配","http://127.0.0.1:3000/img/index_product/7.jpg",1699,"鲜花",16);

INSERT INTO xh_index_product  VALUES(null,"祝您身体健康-33支精品红康乃馨，搭配适量绿叶、情人草","http://127.0.0.1:3000/img/index_product/10.jpg",569,"花盒",17);
INSERT INTO xh_index_product  VALUES(null,"最思恋-红色康乃馨19枝，勿忘我0.3扎","http://127.0.0.1:3000/img/index_product/11.jpg",329,"花盒",18);
INSERT INTO xh_index_product  VALUES(null,"窈窕淑女/高档礼盒装鲜花:戴安娜粉玫瑰11枝，勿忘我适量","http://127.0.0.1:3000/img/index_product/12.jpg",229,"花盒",19);
INSERT INTO xh_index_product  VALUES(null,"和青春跳舞-高档礼盒装鲜花:33枝戴安娜玫瑰，少量绿叶","http://127.0.0.1:3000/img/index_product/13.jpg",419,"花盒",20);
INSERT INTO xh_index_product  VALUES(null,"恰似你的温柔-高档礼盒装鲜花:香槟玫瑰11枝、深紫色勿忘我0.3扎","http://127.0.0.1:3000/img/index_product/14.jpg",246,"花盒",21);
INSERT INTO xh_index_product  VALUES(null,"秘密花园-高档礼盒装鲜花:33枝红玫瑰，少量绿叶","http://127.0.0.1:3000/img/index_product/15.jpg",456,"花盒",22);
INSERT INTO xh_index_product  VALUES(null,"一往情深-19枝红玫瑰，勿忘我0.1扎","http://127.0.0.1:3000/img/index_product/16.jpg",389,"花盒",23);
INSERT INTO xh_index_product  VALUES(null,"天使之祁-粉色康乃馨19枝，勿忘我0.3扎","http://127.0.0.1:3000/img/index_product/17.jpg",389,"花盒",24);

INSERT INTO xh_index_product  VALUES(null,"寿比天齐-祝寿蛋糕","http://127.0.0.1:3000/img/index_product/18.jpg",228,"蛋糕",25);
INSERT INTO xh_index_product  VALUES(null,"经典蛋糕水果传奇（特价）","http://127.0.0.1:3000/img/index_product/19.jpg",178,"蛋糕",26);
INSERT INTO xh_index_product  VALUES(null,"定制款式","http://127.0.0.1:3000/img/index_product/20.jpg",269,"蛋糕",27);
INSERT INTO xh_index_product  VALUES(null,"一生的爱-巧克力蛋糕","http://127.0.0.1:3000/img/index_product/21.jpg",238,"蛋糕",28);
INSERT INTO xh_index_product  VALUES(null,"爱的礼物","http://127.0.0.1:3000/img/index_product/22.jpg",238,"蛋糕",29);
INSERT INTO xh_index_product  VALUES(null,"一帆风顺-网红创意蛋糕","http://127.0.0.1:3000/img/index_product/23.jpg",259,"蛋糕",30);
INSERT INTO xh_index_product  VALUES(null,"圣诞节专款芒果草莓双拼生日蛋糕","http://127.0.0.1:3000/img/index_product/24.jpg",259,"蛋糕",31);
INSERT INTO xh_index_product  VALUES(null,"圣诞新年草莓塔蛋糕","http://127.0.0.1:3000/img/index_product/25.jpg",329,"蛋糕",32);
#展示图片
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/logo.gif","logo",null);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/1.png","小图",1);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/2.jpg","导航",1);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/3.jpg","导航",1);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/4.jpg","导航",1);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/5.jpg","导航",1);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/6.jpg","左边",null);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/7.jpg","左边",null);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/8.jpg","左边",null);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/9.jpg","左边",null);
INSERT INTO xh_index_img VALUES(null,"http://127.0.0.1:3000/img/index_img/footer.png","页尾",null);
#商品表
INSERT INTO xh_laptop VALUES(null,"爱的星星-19朵粉玫瑰加满天星","19朵粉玫瑰加满天星",388,true,6888,4,"鲜花",9992,'["http://127.0.0.1:3000/img/laptop/1/fd_1.jpg","http://127.0.0.1:3000/img/laptop/1/fd_2.jpg","http://127.0.0.1:3000/img/laptop/1/fd_3.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_2.jpg","http://127.0.0.1:3000/img/laptop/1/xq_3.jpg","http://127.0.0.1:3000/img/laptop/1/xq_4.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"红色康乃馨29枝、粉色百合3枝、黄色勿忘我3枝","红色康乃馨29枝、粉色百合3枝、黄色勿忘我3枝",428,true,13491,3,"鲜花",9997,'["http://127.0.0.1:3000/img/laptop/2/fd_1.jpg","http://127.0.0.1:3000/img/laptop/2/fd_2.jpg","http://127.0.0.1:3000/img/laptop/2/fd_3.jpg","http://127.0.0.1:3000/img/laptop/2/fd_4.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/2/xq_1.jpg","http://127.0.0.1:3000/img/laptop/2/xq_2.jpg","http://127.0.0.1:3000/img/laptop/2/xq_3.jpg","http://127.0.0.1:3000/img/laptop/2/xq_4.jpg","http://127.0.0.1:3000/img/laptop/2/xq_5.jpg","http://127.0.0.1:3000/img/laptop/2/xq_6.jpg","http://127.0.0.1:3000/img/laptop/2/xq_8.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"粉色康乃馨16枝、浅粉满天星3枝、尤加利10枝","粉色康乃馨16枝、浅粉满天星3枝、尤加利10枝",654,true,13490,2,"鲜花",9997,'["http://127.0.0.1:3000/img/laptop/3/fd_1.jpg","http://127.0.0.1:3000/img/laptop/3/fd_2.jpg","http://127.0.0.1:3000/img/laptop/3/fd_3.jpg","http://127.0.0.1:3000/img/laptop/3/fd_4.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/3/xq_1.jpg","http://127.0.0.1:3000/img/laptop/3/xq_2.jpg","http://127.0.0.1:3000/img/laptop/3/xq_3.jpg","http://127.0.0.1:3000/img/laptop/3/xq_4.jpg","http://127.0.0.1:3000/img/laptop/3/xq_5.jpg","http://127.0.0.1:3000/img/laptop/3/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"红色康乃馨11枝，粉色勿忘我3枝、尤加利10枝","红色康乃馨11枝，粉色勿忘我3枝、尤加利10枝",604,true,13491,1,"鲜花",9997,'["http://127.0.0.1:3000/img/laptop/4/fd_1.jpg","http://127.0.0.1:3000/img/laptop/4/fd_2.jpg","http://127.0.0.1:3000/img/laptop/4/fd_3.jpg","http://127.0.0.1:3000/img/laptop/4/fd_4.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/4/xq_1.jpg","http://127.0.0.1:3000/img/laptop/4/xq_2.jpg","http://127.0.0.1:3000/img/laptop/4/xq_3.jpg","http://127.0.0.1:3000/img/laptop/4/xq_4.jpg","http://127.0.0.1:3000/img/laptop/4/xq_5.jpg","http://127.0.0.1:3000/img/laptop/4/xq_6.jpg","http://127.0.0.1:3000/img/laptop/4/xq_7.jpg","http://127.0.0.1:3000/img/laptop/4/xq_8.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"执手相依-11朵红玫瑰 尤加利搭配",null,268,true,135899,12,"鲜花",9946,'["http://127.0.0.1:3000/img/laptop/5/fd_1.jpg","http://127.0.0.1:3000/img/laptop/5/fd_2.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/5/xq_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"皇冠恋人-33朵精品玫瑰搭配皇冠，黑色英文缎带搭配","新鲜制作，同城配送，最快两小时送达!",469,true,67413,10,"鲜花",9997,'["http://127.0.0.1:3000/img/laptop/6/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/6/fd_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"爱的心光-99朵红玫瑰，黑色英文缎带搭配","新鲜制作，同城配送，最快两小时送达!",1699,true,6939,2,"鲜花",9996,'["http://127.0.0.1:3000/img/laptop/7/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/7/fd_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"仙气腾腾-11朵粉玫瑰","11朵粉玫瑰",249,true,11881,3,"鲜花",9996,'["http://127.0.0.1:3000/img/laptop/8/fd_1.jpg","http://127.0.0.1:3000/img/laptop/8/fd_2.jpg","http://127.0.0.1:3000/img/laptop/8/fd_3.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/8/xq_1.jpg","http://127.0.0.1:3000/img/laptop/8/xq_2.jpg","http://127.0.0.1:3000/img/laptop/8/xq_3.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
#9
INSERT INTO xh_laptop VALUES(null,"爱的星星-19朵粉玫瑰加满天星","19朵粉玫瑰加满天星",388,true,6888,4,"鲜花",9992,'["http://127.0.0.1:3000/img/laptop/1/fd_1.jpg","http://127.0.0.1:3000/img/laptop/1/fd_2.jpg","http://127.0.0.1:3000/img/laptop/1/fd_3.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_2.jpg","http://127.0.0.1:3000/img/laptop/1/xq_3.jpg","http://127.0.0.1:3000/img/laptop/1/xq_4.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"红色康乃馨29枝、粉色百合3枝、黄色勿忘我3枝","红色康乃馨29枝、粉色百合3枝、黄色勿忘我3枝",428,true,13491,3,"鲜花",9997,'["http://127.0.0.1:3000/img/laptop/2/fd_1.jpg","http://127.0.0.1:3000/img/laptop/2/fd_2.jpg","http://127.0.0.1:3000/img/laptop/2/fd_3.jpg","http://127.0.0.1:3000/img/laptop/2/fd_4.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/2/xq_1.jpg","http://127.0.0.1:3000/img/laptop/2/xq_2.jpg","http://127.0.0.1:3000/img/laptop/2/xq_3.jpg","http://127.0.0.1:3000/img/laptop/2/xq_4.jpg","http://127.0.0.1:3000/img/laptop/2/xq_5.jpg","http://127.0.0.1:3000/img/laptop/2/xq_6.jpg","http://127.0.0.1:3000/img/laptop/2/xq_8.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"粉色康乃馨16枝、浅粉满天星3枝、尤加利10枝","粉色康乃馨16枝、浅粉满天星3枝、尤加利10枝",654,true,13490,2,"鲜花",9997,'["http://127.0.0.1:3000/img/laptop/3/fd_1.jpg","http://127.0.0.1:3000/img/laptop/3/fd_2.jpg","http://127.0.0.1:3000/img/laptop/3/fd_3.jpg","http://127.0.0.1:3000/img/laptop/3/fd_4.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/3/xq_1.jpg","http://127.0.0.1:3000/img/laptop/3/xq_2.jpg","http://127.0.0.1:3000/img/laptop/3/xq_3.jpg","http://127.0.0.1:3000/img/laptop/3/xq_4.jpg","http://127.0.0.1:3000/img/laptop/3/xq_5.jpg","http://127.0.0.1:3000/img/laptop/3/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"红色康乃馨11枝，粉色勿忘我3枝、尤加利10枝","红色康乃馨11枝，粉色勿忘我3枝、尤加利10枝",604,true,13491,1,"鲜花",9997,'["http://127.0.0.1:3000/img/laptop/4/fd_1.jpg","http://127.0.0.1:3000/img/laptop/4/fd_2.jpg","http://127.0.0.1:3000/img/laptop/4/fd_3.jpg","http://127.0.0.1:3000/img/laptop/4/fd_4.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/4/xq_1.jpg","http://127.0.0.1:3000/img/laptop/4/xq_2.jpg","http://127.0.0.1:3000/img/laptop/4/xq_3.jpg","http://127.0.0.1:3000/img/laptop/4/xq_4.jpg","http://127.0.0.1:3000/img/laptop/4/xq_5.jpg","http://127.0.0.1:3000/img/laptop/4/xq_6.jpg","http://127.0.0.1:3000/img/laptop/4/xq_7.jpg","http://127.0.0.1:3000/img/laptop/4/xq_8.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"执手相依-11朵红玫瑰 尤加利搭配",null,268,true,135899,12,"鲜花",9946,'["http://127.0.0.1:3000/img/laptop/5/fd_1.jpg","http://127.0.0.1:3000/img/laptop/5/fd_2.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/5/xq_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"秘密花园-19朵精品蓝妖姬","精美黑色雾面纸，外裹黑色网纱包装，搭配黑色丝带束扎",428,true,41129,3,"鲜花",9995,'["http://127.0.0.1:3000/img/laptop/14/fd_1.jpg","http://127.0.0.1:3000/img/laptop/14/fd_2.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/14/xq_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"皇冠恋人-33朵精品玫瑰搭配皇冠，黑色英文缎带搭配","新鲜制作，同城配送，最快两小时送达!",469,true,67413,10,"鲜花",9997,'["http://127.0.0.1:3000/img/laptop/6/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/6/fd_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"爱的心光-99朵红玫瑰，黑色英文缎带搭配","新鲜制作，同城配送，最快两小时送达!",1699,true,6939,2,"鲜花",9996,'["http://127.0.0.1:3000/img/laptop/7/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/7/fd_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
#17
INSERT INTO xh_laptop VALUES(null,"祝您身体健康-33支精品红康乃馨，搭配适量绿叶、情人草","包装：精美礼盒装",569,true,3698,0,"花盒",9999,'["http://127.0.0.1:3000/img/laptop/17/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/17/fd_1.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"最思恋-红色康乃馨19枝，勿忘我0.3扎","包 装：浅灰色素染纸2张，紫色缎带1.2米,魔力铁山灰花盒1个",329,true,8701,2,"花盒",9998,'["http://127.0.0.1:3000/img/laptop/18/fd_1.jpg","http://127.0.0.1:3000/img/laptop/18/fd_2.jpg","http://127.0.0.1:3000/img/laptop/18/fd_3.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/18/xq_1.jpg","http://127.0.0.1:3000/img/laptop/18/xq_2.jpg","http://127.0.0.1:3000/img/laptop/18/xq_3.jpg","http://127.0.0.1:3000/img/laptop/18/xq_4.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"窈窕淑女/高档礼盒装鲜花:戴安娜粉玫瑰11枝，勿忘我适量","包 装：中灰色人造纸3张，白色雪梨纸0.5张，银灰色LOGO缎带1米",299,true,4938,2,"花盒",9998,'["http://127.0.0.1:3000/img/laptop/19/fd_1.jpg","http://127.0.0.1:3000/img/laptop/19/fd_2.jpg","http://127.0.0.1:3000/img/laptop/19/fd_3.jpg","http://127.0.0.1:3000/img/laptop/19/fd_4.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/19/fd_1.jpg","http://127.0.0.1:3000/img/laptop/19/fd_2.jpg","http://127.0.0.1:3000/img/laptop/19/fd_3.jpg","http://127.0.0.1:3000/img/laptop/19/fd_4.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"和青春跳舞-高档礼盒装鲜花:33枝戴安娜玫瑰，少量绿叶","包 装：牛皮纸和深咖啡色条纹纸，银色缎带花结，魔力铁山灰包装盒",419,true,6733,2,"花盒",9998,'["http://127.0.0.1:3000/img/laptop/20/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/20/xq_1.jpg","http://127.0.0.1:3000/img/laptop/20/xq_2.jpg","http://127.0.0.1:3000/img/laptop/20/xq_3.jpg","http://127.0.0.1:3000/img/laptop/20/xq_4.jpg","http://127.0.0.1:3000/img/laptop/20/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"恰似你的温柔-高档礼盒装鲜花:香槟玫瑰11枝、深紫色勿忘我0.3扎","包 装：中灰色人造纸3张，白色雪梨纸0.5张，银灰色LOGO缎带1米",246,true,5947,2,"花盒",9997,'["http://127.0.0.1:3000/img/laptop/21/fd_1.jpg","http://127.0.0.1:3000/img/laptop/21/fd_2.jpg","http://127.0.0.1:3000/img/laptop/21/fd_3.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/21/xq_1.jpg","http://127.0.0.1:3000/img/laptop/21/xq_2.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"秘密花园-高档礼盒装鲜花:33枝红玫瑰，少量绿叶","包 装：牛皮纸和深咖啡色条纹纸，银色缎带花结，魔力铁山灰包装盒",456,true,2550,2,"花盒",9997,'["http://127.0.0.1:3000/img/laptop/22/fd_1.jpg","http://127.0.0.1:3000/img/laptop/22/fd_2.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/22/xq_1.jpg","http://127.0.0.1:3000/img/laptop/22/xq_2.jpg","http://127.0.0.1:3000/img/laptop/22/xq_3.jpg","http://127.0.0.1:3000/img/laptop/22/xq_4.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"一往情深-19枝红玫瑰，勿忘我0.1扎","包 装：牛皮纸和深咖啡色条纹纸，银色缎带花结，魔力铁山灰包装盒",389,true,33487,9,"花盒",9981,'["http://127.0.0.1:3000/img/laptop/23/fd_1.jpg","http://127.0.0.1:3000/img/laptop/23/fd_2.jpg","http://127.0.0.1:3000/img/laptop/23/fd_3.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/23/xq_1.jpg","http://127.0.0.1:3000/img/laptop/23/xq_2.jpg","http://127.0.0.1:3000/img/laptop/23/xq_3.jpg","http://127.0.0.1:3000/img/laptop/23/xq_4.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"天使之祁-粉色康乃馨19枝，勿忘我0.3扎","包 装：浅灰色素染纸2张，紫色缎带1.2米,魔力铁山灰花盒1个",389,true,6698,2,"花盒",9999,'["http://127.0.0.1:3000/img/laptop/24/fd_1.jpg","http://127.0.0.1:3000/img/laptop/24/fd_2.jpg","http://127.0.0.1:3000/img/laptop/24/fd_3.jpg"]','["http://127.0.0.1:3000/img/laptop/1/xq_1.jpg","http://127.0.0.1:3000/img/laptop/24/xq_1.jpg","http://127.0.0.1:3000/img/laptop/24/xq_2.jpg","http://127.0.0.1:3000/img/laptop/24/xq_3.jpg","http://127.0.0.1:3000/img/laptop/24/xq_4.jpg","http://127.0.0.1:3000/img/laptop/1/xq_5.jpg","http://127.0.0.1:3000/img/laptop/1/xq_6.jpg","http://127.0.0.1:3000/img/laptop/1/xq_7.jpg","http://127.0.0.1:3000/img/laptop/1/xq_8.jpg"]',1);
#25
INSERT INTO xh_laptop VALUES(null,"寿比天齐-祝寿蛋糕",null,228,true,26516,2,"蛋糕",9999,'["http://127.0.0.1:3000/img/laptop/25/fd_1.jpg","http://127.0.0.1:3000/img/laptop/25/fd_2.jpg"]','["http://127.0.0.1:3000/img/laptop/25/xq_1.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_3.jpg","http://127.0.0.1:3000/img/laptop/25/xq_4.jpg","http://127.0.0.1:3000/img/laptop/25/xq_5.jpg","http://127.0.0.1:3000/img/laptop/25/xq_6.jpg","http://127.0.0.1:3000/img/laptop/25/xq_7.jpg","http://127.0.0.1:3000/img/laptop/25/xq_8.jpg","http://127.0.0.1:3000/img/laptop/25/xq_9.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"经典蛋糕水果传奇（特价）","新鲜制作，同城配送，最快两小时送达!",178,true,18854,2,"蛋糕",9999,'["http://127.0.0.1:3000/img/laptop/26/fd_1.jpg","http://127.0.0.1:3000/img/laptop/26/fd_2.jpg","http://127.0.0.1:3000/img/laptop/26/fd_3.jpg","http://127.0.0.1:3000/img/laptop/26/fd_4.jpg"]','["http://127.0.0.1:3000/img/laptop/25/xq_1.jpg","http://127.0.0.1:3000/img/laptop/26/xq_1.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_3.jpg","http://127.0.0.1:3000/img/laptop/25/xq_4.jpg","http://127.0.0.1:3000/img/laptop/25/xq_5.jpg","http://127.0.0.1:3000/img/laptop/25/xq_6.jpg","http://127.0.0.1:3000/img/laptop/25/xq_7.jpg","http://127.0.0.1:3000/img/laptop/25/xq_8.jpg","http://127.0.0.1:3000/img/laptop/25/xq_9.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"定制款式","新鲜制作，同城配送，最快两小时送达!",269,true,0,0,"蛋糕",9999,'["http://127.0.0.1:3000/img/laptop/27/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/25/xq_1.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_3.jpg","http://127.0.0.1:3000/img/laptop/25/xq_4.jpg","http://127.0.0.1:3000/img/laptop/25/xq_5.jpg","http://127.0.0.1:3000/img/laptop/25/xq_6.jpg","http://127.0.0.1:3000/img/laptop/25/xq_7.jpg","http://127.0.0.1:3000/img/laptop/25/xq_8.jpg","http://127.0.0.1:3000/img/laptop/25/xq_9.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"一生的爱-巧克力蛋糕",null,238,true,45159,1,"蛋糕",9995,'["http://127.0.0.1:3000/img/laptop/28/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/25/xq_1.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_3.jpg","http://127.0.0.1:3000/img/laptop/25/xq_4.jpg","http://127.0.0.1:3000/img/laptop/25/xq_5.jpg","http://127.0.0.1:3000/img/laptop/25/xq_6.jpg","http://127.0.0.1:3000/img/laptop/25/xq_7.jpg","http://127.0.0.1:3000/img/laptop/25/xq_8.jpg","http://127.0.0.1:3000/img/laptop/25/xq_9.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"爱的礼物","新鲜制作，同城配送，最快两小时送达!",238,true,6990,1,"蛋糕",9995,'["http://127.0.0.1:3000/img/laptop/29/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/25/xq_1.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_3.jpg","http://127.0.0.1:3000/img/laptop/25/xq_4.jpg","http://127.0.0.1:3000/img/laptop/25/xq_5.jpg","http://127.0.0.1:3000/img/laptop/25/xq_6.jpg","http://127.0.0.1:3000/img/laptop/25/xq_7.jpg","http://127.0.0.1:3000/img/laptop/25/xq_8.jpg","http://127.0.0.1:3000/img/laptop/25/xq_9.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"一番风顺-创意蛋糕","新鲜制作，同城配送，最快两小时送达!",259,true,6990,1,"蛋糕",9995,'["http://127.0.0.1:3000/img/laptop/30/fd_1.jpg","http://127.0.0.1:3000/img/laptop/30/fd_2.jpg","http://127.0.0.1:3000/img/laptop/30/fd_3.jpg","http://127.0.0.1:3000/img/laptop/30/fd_4.jpg","http://127.0.0.1:3000/img/laptop/30/fd_5.jpg","http://127.0.0.1:3000/img/laptop/30/fd_6.jpg"]','["http://127.0.0.1:3000/img/laptop/25/xq_1.jpg","http://127.0.0.1:3000/img/laptop/30/xq_1.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_3.jpg","http://127.0.0.1:3000/img/laptop/25/xq_4.jpg","http://127.0.0.1:3000/img/laptop/25/xq_5.jpg","http://127.0.0.1:3000/img/laptop/25/xq_6.jpg","http://127.0.0.1:3000/img/laptop/25/xq_7.jpg","http://127.0.0.1:3000/img/laptop/25/xq_8.jpg","http://127.0.0.1:3000/img/laptop/25/xq_9.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"圣诞节专款芒果草莓双拼生日蛋糕","新鲜制作，同城配送，最快两小时送达!",319,true,7958,0,"蛋糕",9995,'["http://127.0.0.1:3000/img/laptop/31/fd_1.jpg","http://127.0.0.1:3000/img/laptop/31/fd_2.jpg"]','["http://127.0.0.1:3000/img/laptop/25/xq_1.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_3.jpg","http://127.0.0.1:3000/img/laptop/25/xq_4.jpg","http://127.0.0.1:3000/img/laptop/25/xq_5.jpg","http://127.0.0.1:3000/img/laptop/25/xq_6.jpg","http://127.0.0.1:3000/img/laptop/25/xq_7.jpg","http://127.0.0.1:3000/img/laptop/25/xq_8.jpg","http://127.0.0.1:3000/img/laptop/25/xq_9.jpg"]',1);
INSERT INTO xh_laptop VALUES(null,"圣诞新年草莓塔蛋糕","新鲜制作，同城配送，最快两小时送达!",329,true,8635,0,"蛋糕",9995,'["http://127.0.0.1:3000/img/laptop/32/fd_1.jpg"]','["http://127.0.0.1:3000/img/laptop/25/xq_1.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_2_2.jpg","http://127.0.0.1:3000/img/laptop/25/xq_3.jpg","http://127.0.0.1:3000/img/laptop/25/xq_4.jpg","http://127.0.0.1:3000/img/laptop/25/xq_5.jpg","http://127.0.0.1:3000/img/laptop/25/xq_6.jpg","http://127.0.0.1:3000/img/laptop/25/xq_7.jpg","http://127.0.0.1:3000/img/laptop/25/xq_8.jpg","http://127.0.0.1:3000/img/laptop/25/xq_9.jpg"]',1);

