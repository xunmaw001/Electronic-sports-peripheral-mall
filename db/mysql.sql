DROP DATABASE IF EXISTS ssm2f3db;

CREATE DATABASE ssm2f3db default character set utf8mb4 collate utf8mb4_general_ci;

USE ssm2f3db;


DROP TABLE IF EXISTS `config`;

CREATE TABLE `config`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL COMMENT '配置参数名称',
	`value` varchar(100) COMMENT '配置参数值',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

DROP TABLE IF EXISTS `shangpinleixing`;

CREATE TABLE `shangpinleixing` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shangpinfenlei` varchar(200)    COMMENT '商品分类',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型';

INSERT INTO shangpinleixing(shangpinfenlei) VALUES('商品分类1');
INSERT INTO shangpinleixing(shangpinfenlei) VALUES('商品分类2');
INSERT INTO shangpinleixing(shangpinfenlei) VALUES('商品分类3');


DROP TABLE IF EXISTS `shangpinxinxi`;

CREATE TABLE `shangpinxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shangpinbianhao` varchar(200)  UNIQUE   COMMENT '商品编号',
	`shangpinfenlei` varchar(200)    COMMENT '商品分类',
	`tupian` varchar(200)    COMMENT '图片',
	`jianjie` longtext    COMMENT '简介',
	`shuliang` varchar(200)    COMMENT '数量',
	`youximingcheng` varchar(200)    COMMENT '游戏名称',
	`price` float NOT NULL   COMMENT '价格',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息';

INSERT INTO shangpinxinxi(shangpinbianhao,shangpinfenlei,tupian,jianjie,shuliang,youximingcheng,price) VALUES('商品编号1','商品分类1','http://localhost:8080/ssm2f3db/upload/shangpinxinxi_tupian1.jpg','简介1','数量1','游戏名称1',1);
INSERT INTO shangpinxinxi(shangpinbianhao,shangpinfenlei,tupian,jianjie,shuliang,youximingcheng,price) VALUES('商品编号2','商品分类2','http://localhost:8080/ssm2f3db/upload/shangpinxinxi_tupian2.jpg','简介2','数量2','游戏名称2',2);
INSERT INTO shangpinxinxi(shangpinbianhao,shangpinfenlei,tupian,jianjie,shuliang,youximingcheng,price) VALUES('商品编号3','商品分类3','http://localhost:8080/ssm2f3db/upload/shangpinxinxi_tupian3.jpg','简介3','数量3','游戏名称3',3);


DROP TABLE IF EXISTS `huodonggonggao`;

CREATE TABLE `huodonggonggao` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`biaoti` varchar(200)    COMMENT '标题',
	`neirong` longtext    COMMENT '内容',
	`tupian` varchar(200)    COMMENT '图片',
	`fabushijian` date    COMMENT '发布时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动公告';

INSERT INTO huodonggonggao(biaoti,neirong,tupian,fabushijian) VALUES('标题1','内容1','http://localhost:8080/ssm2f3db/upload/huodonggonggao_tupian1.jpg',CURRENT_TIMESTAMP);
INSERT INTO huodonggonggao(biaoti,neirong,tupian,fabushijian) VALUES('标题2','内容2','http://localhost:8080/ssm2f3db/upload/huodonggonggao_tupian2.jpg',CURRENT_TIMESTAMP);
INSERT INTO huodonggonggao(biaoti,neirong,tupian,fabushijian) VALUES('标题3','内容3','http://localhost:8080/ssm2f3db/upload/huodonggonggao_tupian3.jpg',CURRENT_TIMESTAMP);


DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`yonghuming` varchar(200)  UNIQUE   COMMENT '用户名',
	`yonghuxingming` varchar(200)    COMMENT '用户姓名',
	`mima` varchar(200)    COMMENT '密码',
	`xingbie` varchar(200)    COMMENT '性别',
	`nianling` varchar(200)    COMMENT '年龄',
	`lianxidianhua` varchar(200)    COMMENT '联系电话',
	`money` float   default '0' COMMENT '余额',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

INSERT INTO yonghu(yonghuming,yonghuxingming,mima,xingbie,nianling,lianxidianhua,money) VALUES('用户1','用户姓名1','123456','男','年龄1','020-89819991',1);
INSERT INTO yonghu(yonghuming,yonghuxingming,mima,xingbie,nianling,lianxidianhua,money) VALUES('用户2','用户姓名2','123456','男','年龄2','020-89819992',2);
INSERT INTO yonghu(yonghuming,yonghuxingming,mima,xingbie,nianling,lianxidianhua,money) VALUES('用户3','用户姓名3','123456','男','年龄3','020-89819993',3);


DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`userid` bigint NOT NULL   COMMENT '用户id',
	`adminid` bigint    COMMENT '管理员id',
	`ask` longtext    COMMENT '提问',
	`reply` longtext    COMMENT '回复',
	`isreply` int    COMMENT '是否回复',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客服聊天表';

INSERT INTO chat(userid,adminid,ask,reply,isreply) VALUES(1,1,'提问1','回复1',1);
INSERT INTO chat(userid,adminid,ask,reply,isreply) VALUES(2,2,'提问2','回复2',2);
INSERT INTO chat(userid,adminid,ask,reply,isreply) VALUES(3,3,'提问3','回复3',3);


DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`title` varchar(200)    COMMENT '帖子标题',
	`content` longtext NOT NULL   COMMENT '帖子内容',
	`parentid` bigint    COMMENT '父节点id',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`username` varchar(200)    COMMENT '用户名',
	`isdone` varchar(200)    COMMENT '状态',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛表';

INSERT INTO forum(title,content,parentid,userid,username,isdone) VALUES('帖子标题1','帖子内容1',1,1,'用户名1','开放');
INSERT INTO forum(title,content,parentid,userid,username,isdone) VALUES('帖子标题2','帖子内容2',2,2,'用户名2','开放');
INSERT INTO forum(title,content,parentid,userid,username,isdone) VALUES('帖子标题3','帖子内容3',3,3,'用户名3','开放');


DROP TABLE IF EXISTS `defaultuser`;

CREATE TABLE `defaultuser` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`username` varchar(200) NOT NULL UNIQUE   COMMENT '用户名',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`name` varchar(200)    COMMENT '姓名',
	`sex` varchar(200)    COMMENT '性别',
	`age` int    COMMENT '年龄',
	`phone` varchar(200)    COMMENT '电话',
	`picture` varchar(200)    COMMENT '照片',
	`email` varchar(200)    COMMENT '邮箱',
	`money` float   default '0' COMMENT '余额',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='注册用户';

INSERT INTO defaultuser(username,mima,name,sex,age,phone,picture,email,money) VALUES('用户名1','123456','姓名1','男',1,'020-89819991','http://localhost:8080/ssm2f3db/upload/defaultuser_picture1.jpg','773890001@qq.com',1);
INSERT INTO defaultuser(username,mima,name,sex,age,phone,picture,email,money) VALUES('用户名2','123456','姓名2','男',2,'020-89819992','http://localhost:8080/ssm2f3db/upload/defaultuser_picture2.jpg','773890002@qq.com',2);
INSERT INTO defaultuser(username,mima,name,sex,age,phone,picture,email,money) VALUES('用户名3','123456','姓名3','男',3,'020-89819993','http://localhost:8080/ssm2f3db/upload/defaultuser_picture3.jpg','773890003@qq.com',3);


DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`tablename` varchar(200)   default 'shangpinxinxi' COMMENT '商品表名',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`goodid` bigint NOT NULL   COMMENT '商品id',
	`goodname` varchar(200)    COMMENT '商品名称',
	`picture` varchar(200)    COMMENT '图片',
	`buynumber` int NOT NULL   COMMENT '购买数量',
	`price` float    COMMENT '单价',
	`discountprice` float    COMMENT '会员价',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

INSERT INTO cart(tablename,userid,goodid,goodname,picture,buynumber,price,discountprice) VALUES('商品表名1',1,1,'商品名称1','http://localhost:8080/ssm2f3db/upload/cart_picture1.jpg',1,1,1);
INSERT INTO cart(tablename,userid,goodid,goodname,picture,buynumber,price,discountprice) VALUES('商品表名2',2,2,'商品名称2','http://localhost:8080/ssm2f3db/upload/cart_picture2.jpg',2,2,2);
INSERT INTO cart(tablename,userid,goodid,goodname,picture,buynumber,price,discountprice) VALUES('商品表名3',3,3,'商品名称3','http://localhost:8080/ssm2f3db/upload/cart_picture3.jpg',3,3,3);


DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`orderid` varchar(200) NOT NULL UNIQUE   COMMENT '订单id',
	`tablename` varchar(200)   default 'shangpinxinxi' COMMENT '商品表名',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`goodid` bigint NOT NULL   COMMENT '商品id',
	`goodname` varchar(200)    COMMENT '商品名称',
	`picture` varchar(200)    COMMENT '商品图片',
	`buynumber` int NOT NULL   COMMENT '购买数量',
	`price` float NOT NULL  default '0' COMMENT '价格/积分',
	`discountprice` float   default '0' COMMENT '折扣价格',
	`total` float NOT NULL  default '0' COMMENT '总价格/总积分',
	`discounttotal` float   default '0' COMMENT '折扣总价格',
	`type` int    COMMENT '支付类型（1：现金 2：积分）',
	`status` varchar(200)    COMMENT '状态',
	`address` varchar(200)    COMMENT '地址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

INSERT INTO orders(orderid,tablename,userid,goodid,goodname,picture,buynumber,price,discountprice,total,discounttotal,type,status,address) VALUES('订单id1','商品表名1',1,1,'商品名称1','http://localhost:8080/ssm2f3db/upload/orders_picture1.jpg',1,1,1,1,1,1,'状态1','地址1');
INSERT INTO orders(orderid,tablename,userid,goodid,goodname,picture,buynumber,price,discountprice,total,discounttotal,type,status,address) VALUES('订单id2','商品表名2',2,2,'商品名称2','http://localhost:8080/ssm2f3db/upload/orders_picture2.jpg',2,2,2,2,2,2,'状态2','地址2');
INSERT INTO orders(orderid,tablename,userid,goodid,goodname,picture,buynumber,price,discountprice,total,discounttotal,type,status,address) VALUES('订单id3','商品表名3',3,3,'商品名称3','http://localhost:8080/ssm2f3db/upload/orders_picture3.jpg',3,3,3,3,3,3,'状态3','地址3');


DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`userid` bigint NOT NULL   COMMENT '用户id',
	`address` varchar(200) NOT NULL   COMMENT '地址',
	`name` varchar(200) NOT NULL   COMMENT '收货人',
	`phone` varchar(200) NOT NULL   COMMENT '电话',
	`isdefault` varchar(200) NOT NULL   COMMENT '是否默认地址[是/否]',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地址';

INSERT INTO address(userid,address,name,phone,isdefault) VALUES(1,'地址1','收货人1','电话1','是否默认地址[是/否]1');
INSERT INTO address(userid,address,name,phone,isdefault) VALUES(2,'地址2','收货人2','电话2','是否默认地址[是/否]2');
INSERT INTO address(userid,address,name,phone,isdefault) VALUES(3,'地址3','收货人3','电话3','是否默认地址[是/否]3');


DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`userid` bigint NOT NULL   COMMENT '用户id',
	`refid` bigint    COMMENT '收藏id',
	`tablename` varchar(200)    COMMENT '表名',
	`name` varchar(200) NOT NULL   COMMENT '收藏名称',
	`picture` varchar(200) NOT NULL   COMMENT '收藏图片',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

INSERT INTO storeup(userid,refid,tablename,name,picture) VALUES(1,1,'表名1','收藏名称1','http://localhost:8080/ssm2f3db/upload/storeup_picture1.jpg');
INSERT INTO storeup(userid,refid,tablename,name,picture) VALUES(2,2,'表名2','收藏名称2','http://localhost:8080/ssm2f3db/upload/storeup_picture2.jpg');
INSERT INTO storeup(userid,refid,tablename,name,picture) VALUES(3,3,'表名3','收藏名称3','http://localhost:8080/ssm2f3db/upload/storeup_picture3.jpg');


DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`title` varchar(200) NOT NULL   COMMENT '标题',
	`picture` varchar(200) NOT NULL   COMMENT '图片',
	`content` longtext NOT NULL   COMMENT '内容',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻资讯';

INSERT INTO news(title,picture,content) VALUES('标题1','http://localhost:8080/ssm2f3db/upload/news_picture1.jpg','内容1');
INSERT INTO news(title,picture,content) VALUES('标题2','http://localhost:8080/ssm2f3db/upload/news_picture2.jpg','内容2');
INSERT INTO news(title,picture,content) VALUES('标题3','http://localhost:8080/ssm2f3db/upload/news_picture3.jpg','内容3');


DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`name` varchar(200) NOT NULL   COMMENT '名称',
	`value` varchar(200)    COMMENT '值',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图管理';

INSERT INTO config(name,value) VALUES('名称1','http://localhost:8080/ssm2f3db/upload/config_value1.jpg');
INSERT INTO config(name,value) VALUES('名称2','http://localhost:8080/ssm2f3db/upload/config_value2.jpg');
INSERT INTO config(name,value) VALUES('名称3','http://localhost:8080/ssm2f3db/upload/config_value3.jpg');


DROP TABLE IF EXISTS `discussshangpinxinxi`;

CREATE TABLE `discussshangpinxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`refid` bigint NOT NULL   COMMENT '关联表id',
	`content` varchar(200) NOT NULL   COMMENT '评论内容',
	`userid` bigint NOT NULL   COMMENT '用户id',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息评论表';

INSERT INTO discussshangpinxinxi(refid,content,userid) VALUES(1,'评论内容1',1);
INSERT INTO discussshangpinxinxi(refid,content,userid) VALUES(2,'评论内容2',2);
INSERT INTO discussshangpinxinxi(refid,content,userid) VALUES(3,'评论内容3',3);



truncate table config;
insert into config(id,name,value) values(1,'picture1','http://localhost:8080/ssm2f3db/upload/picture1.jpg');
insert into config(id,name,value) values(2,'picture2','http://localhost:8080/ssm2f3db/upload/picture2.jpg');
insert into config(id,name,value) values(3,'picture3','http://localhost:8080/ssm2f3db/upload/picture3.jpg');
insert into config(id,name,value) values(4,'picture4','http://localhost:8080/ssm2f3db/upload/picture4.jpg');
insert into config(id,name,value) values(5,'picture5','http://localhost:8080/ssm2f3db/upload/picture5.jpg');
insert into config(id,name) values(6,'homepage');


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`password` varchar(100) NOT NULL COMMENT '密码',
	`role` varchar(100) default '管理员' COMMENT '角色',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

insert into users(id,username, password) values(1,'abo','abo');

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`userid` bigint NOT NULL COMMENT '用户id',
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`tablename` varchar(100) COMMENT '表名',
	`role` varchar(100) COMMENT '角色',
	`token` varchar(200) NOT NULL COMMENT '密码',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	`expiratedtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '过期时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';

