/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2022/1/26 10:54:00                           */
/*==============================================================*/


drop table "it_bd" cascade constraints;

drop table "it_bd_item" cascade constraints;

/*==============================================================*/
/* Table: "it_bd"                                               */
/*==============================================================*/
create table "it_bd" 
(
   "id"                 VARCHAR2(50),
   "description"        VARCHAR2(100),
   "input_account"      VARCHAR2(50),
   "input_account_name" VARCHAR2(50),
   "input_date"         DATE,
   "status"             VARCHAR2(50),
   "b2b_bd_id"          VARCHAR2(50)
);

comment on column "it_bd"."status" is
'不用字典了 直接用中文
制单中
已报订
已作废';

/*==============================================================*/
/* Table: "it_bd_item"                                          */
/*==============================================================*/
create table "it_bd_item" 
(
   "bd_id"              VARCHAR2(50),
   "isbn"               VARCHAR2(20),
   "name"               VARCHAR2(200),
   "amount"             INTEGER,
   "publisher"          VARCHAR2(200),
   "author"             VARCHAR2(200),
   "currency"           VARCHAR2(50),
   "currency_value"     NUMBER(8,2),
   "price"              NUMBER(8,2),
   "b2b_name"           VARCHAR2(200),
   "b2b_publisher"      VARCHAR2(200),
   "b2b_author"         VARCHAR2(200),
   "b2b_currency"       VARCHAR2(50),
   "b2b_currency_value" NUMBER(8,2),
   "b2b_discount"       VARCHAR2(50),
   "b2b_real_value"     NUMBER(8,2),
   "b2b_stock"          INTEGER,
   "b2b_factory_count"  INTEGER,
   "b2b_f_id"           VARCHAR2(60),
   "b2b_f_department"   VARCHAR2(100),
   "b2b_zs_status"      VARCHAR2(50),
   "bas_h_id"           VARCHAR2(50),
   "bas_product_count"  INTEGER,
   "bas_name"           VARCHAR2(2000),
   "bas_publisher"      VARCHAR2(200),
   "bas_author"         VARCHAR2(200),
   "bas_currency"       VARCHAR2(50),
   "bas_currency_value" NUMBER(8,2),
   "bas_price"          NUMBER(8,2),
   "status"             VARCHAR2(50),
   "is_b2b_match"       SMALLINT,
   "is_bas_match"       SMALLINT,
   "sort_no"            INTEGER,
   "bas_h_type"         VARCHAR2(10)
);

comment on column "it_bd_item"."status" is
'未报订
不可报
已报订';

