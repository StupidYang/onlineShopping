drop database if exists zshop;
create database zshop charset utf8;
use zshop;

-- 商品类型表
create table t_product_type(
	id int primary key auto_increment,
	name varchar(200) not null unique, -- 类型名称
	status int -- 类型状态，1表示启用，0表示禁用
)engine=Innodb default charset=utf8;

-- 商品表
create table t_product(
	id int primary key auto_increment,
	name varchar(200) not null unique, -- 商品名称
	price double, -- 价格
	info varchar(200), -- 简介
	image varchar(200), -- 图片
	product_type_id int, -- 类型id
	foreign key(product_type_id) references t_product_type(id)
)engine=Innodb default charset=utf8;

-- 客户表
create table t_customer(
	id int primary key auto_increment,
	name varchar(20),
	login_name varchar(20) not null unique,
	password varchar(50),
	phone varchar(20),
	address varchar(30),
	is_valid int, -- 用户状态
	regist_date datetime -- 注册时间
)engine=Innodb default charset=utf8;


-- 订单表
create table t_order(
	id int primary key auto_increment,
	no varchar(300), -- 订单编号，使用uuid生成
	customer_id int, -- 顾客编号
	price double,-- 订单总价
	create_date datetime,-- 订单创建时间 
	foreign key(customer_id) references t_customer(id)
)engine=Innodb default charset=utf8;

-- 订单明细表
create table t_item(
	id int primary key auto_increment,
	product_id int,-- 商品编号
	num int,-- 商品数量
	price double, -- 商品单价
	order_id int,-- 订单编号，所属订单
	foreign key(product_id) references t_product(id),
	foreign key(order_id) references t_order(id)
)engine=Innodb default charset=utf8;

-- 角色表
create table t_role(
	id int primary key auto_increment,
	role_name varchar(50) not null unique -- 角色：商品专员、营销经理、超级管理员
)engine=Innodb default charset=utf8;

-- 系统用户表
create table t_sysuser (
  id int primary key auto_increment,
  name varchar(50),
  login_name varchar(50) not null unique,
  password varchar(50),
  phone varchar(50),
  email varchar(100),
  is_valid int,-- 1表示有效，0表示无效
  create_date datetime,
  role_id int,
  foreign key(role_id) references t_role(id)
)engine=Innodb default charset=utf8;

-- 卖家申请表
create table t_seller (
  id int primary key auto_increment,
  name varchar(50),
  login_name varchar(50) not null unique,
  password varchar(50),
  phone varchar(50),
  email varchar(100),
  is_valid int default 1,-- 1表示有效，0表示无效
  create_date timestamp default CURRENT_TIMESTAMP,
  apply int default 0
)engine=Innodb default charset=utf8;










