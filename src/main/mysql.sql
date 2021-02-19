create table user (
  id int primary key auto_increment,
  name varchar(30)
);
create table miaoshauser (
  id int auto_increment primary key,
  phoneno varchar(20),
  nickname varchar(20),
  password varchar(64),
  salt varchar(16),
  head varchar(120),
  registerDate datetime,
  lastLoginDate datetime
) charset=utf8;

create table goods (
  id bigint(20) not null auto_increment comment '商品ID',
  goods_name varchar(16) default null comment '商品名称',
  goods_title varchar(64) default null comment '商品标题',
  goods_img varchar(128) default null comment '商品图片',
  detail longtext comment '商品的详情介绍',
  goods_price decimal(10, 2) default '0.00' comment '商品单价',
  stock int(11) default '0' comment '商品库存',
  primary key(id)
) engine=InnoDB auto_increment=3 charset=utf8mb4;

create table miaosha_goods (
  id bigint(20) not null auto_increment comment '秒杀的商品列表',
  goods_id bigint(20) default null comment '商品Id',
  miaosha_price decimal(10, 2) default '0.00' comment '秒杀价',
  stock_count int(11) default null comment '库存数量',
  start_date datetime default null comment '秒杀开始时间',
  end_date datetime default null comment '秒杀结束时间',
  primary key (id)
) engine=InnoDB auto_increment=12 default charset=utf8mb4;

create table order_info (
  id bigint(20) not null auto_increment,
  user_id int default null comment '用户ID',
  goods_id bigint(20) default null comment '商品ID',
  delivery_addr_id bigint(20) default null comment '收货地址ID',
  goods_name varchar(20) default null comment '冗余的商品名称',
  goods_count int(11) default '0' comment '商品数量',
  goods_price decimal(10, 2) default '0.0' comment '商品单价',
  order_channel tinyint(4) default '0' comment '1PC, 2Android, 3iOS',
  status tinyint(4) default '0' comment '订单状态, 0新建未支付, 1已支付, 2已发货, 3已收货, 4已退款, 5已完成',
  create_date datetime default null comment '订单的创建时间',
  primary key (id)
) engine=InnoDB auto_increment=12 default charset=utf8mb4;

create table miaosha_order (
  id bigint(20) not null auto_increment,
  user_id  int default null comment '用户ID',
  order_id bigint(20) default null comment '订单ID',
  goods_id bigint(20) comment '商品ID',
  primary key(id)
) engine=InnoDB auto_increment=3 default charset=utf8mb4;