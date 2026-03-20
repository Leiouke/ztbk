/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2021/3/3 10:08:04                            */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('foi_delivery_received')
            and   type = 'U')
   drop table foi_delivery_received
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_dh')
            and   type = 'U')
   drop table foi_dh
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_dh_item')
            and   type = 'U')
   drop table foi_dh_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_dh_record')
            and   type = 'U')
   drop table foi_dh_record
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_dh_record_item')
            and   type = 'U')
   drop table foi_dh_record_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_goods_return')
            and   type = 'U')
   drop table foi_goods_return
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_goods_return_item')
            and   type = 'U')
   drop table foi_goods_return_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_goods_return_pool')
            and   type = 'U')
   drop table foi_goods_return_pool
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_inventory')
            and   type = 'U')
   drop table foi_inventory
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_inventory_count')
            and   type = 'U')
   drop table foi_inventory_count
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_inventory_temp')
            and   type = 'U')
   drop table foi_inventory_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('foi_invoice_dh_received')
            and   type = 'U')
   drop table foi_invoice_dh_received
go

/*==============================================================*/
/* Table: foi_delivery_received                                 */
/*==============================================================*/
create table foi_delivery_received (
   px_id                varchar(20)          null,
   transportCompany     varchar(100)         null,
   trackNo              varchar(50)          null,
   shippingTime         datetime             null,
   box_qty              int                  null,
   h_isbn               varchar(15)          null,
   h_amount             int                  null,
   input_time           datetime             null
)
go

/*==============================================================*/
/* Table: foi_dh                                                */
/*==============================================================*/
create table foi_dh (
   dh_id                varchar(20)          null,
   o_input_id           varchar(10)          null,
   input_time           datetime             null,
   status               varchar(50)          null,
   is_send              bit                  null,
   send_time            datetime             null,
   is_receive           bit                  null,
   receive_time         datetime             null,
   memo                 varchar(100)         null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('foi_dh')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'foi_dh', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-制单中
   1-已完成',
   'user', @CurrentUser, 'table', 'foi_dh', 'column', 'status'
go

/*==============================================================*/
/* Table: foi_dh_item                                           */
/*==============================================================*/
create table foi_dh_item (
   dh_id                varchar(20)          null,
   inv_id               varchar(15)          null,
   inv_no               varchar(100)         null
)
go

/*==============================================================*/
/* Table: foi_dh_record                                         */
/*==============================================================*/
create table foi_dh_record (
   hr_id                varchar(20)          null,
   o_input_id           varchar(10)          null,
   input_time           datetime             null,
   status               varchar(50)          null,
   memo                 varchar(100)         null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('foi_dh_record')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'foi_dh_record', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-制单中
   1-已完成',
   'user', @CurrentUser, 'table', 'foi_dh_record', 'column', 'status'
go

/*==============================================================*/
/* Table: foi_dh_record_item                                    */
/*==============================================================*/
create table foi_dh_record_item (
   hr_id                varchar(20)          null,
   inv_id               varchar(15)          null,
   inv_no               varchar(100)         null
)
go

/*==============================================================*/
/* Table: foi_goods_return                                      */
/*==============================================================*/
create table foi_goods_return (
   rg_id                varchar(15)          null,
   total_count          int                  null,
   total_amount         int                  null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   o_name_input         varchar(50)          null
)
go

/*==============================================================*/
/* Table: foi_goods_return_item                                 */
/*==============================================================*/
create table foi_goods_return_item (
   item_id              varchar(32)          null,
   rg_id                varchar(15)          null,
   order_id             varchar(32)          null,
   web_order_id         varchar(60)          null,
   h_id                 varchar(20)          null,
   h_isbn               varchar(15)          null,
   h_name               varchar(200)         null,
   amount               int                  null
)
go

/*==============================================================*/
/* Table: foi_goods_return_pool                                 */
/*==============================================================*/
create table foi_goods_return_pool (
   id                   int                  identity,
   order_id             varchar(32)          null,
   web_order_id         varchar(60)          null,
   input_time           datetime             null,
   h_id                 varchar(20)          null,
   h_isbn               varchar(15)          null,
   h_name               varchar(200)         null,
   to_exam_amount       int                  null,
   this_return_amount   int                  null default 0,
   is_exam              bit                  null default 'false',
   o_id_exam            varchar(50)          null,
   exam_time            datetime             null,
   o_name_exam          varchar(50)          null,
   constraint PK_FOI_GOODS_RETURN_POOL primary key (id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('foi_goods_return_pool')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_exam')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'foi_goods_return_pool', 'column', 'is_exam'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否已验',
   'user', @CurrentUser, 'table', 'foi_goods_return_pool', 'column', 'is_exam'
go

/*==============================================================*/
/* Table: foi_inventory                                         */
/*==============================================================*/
create table foi_inventory (
   batch_no             varchar(20)          null,
   h_isbn               varchar(15)          null,
   h_name               varchar(200)         null,
   h_amount             int                  null,
   yh_amount            int                  null,
   input_time           datetime             null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('foi_inventory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'batch_no')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'foi_inventory', 'column', 'batch_no'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '每天的日期作为批次号',
   'user', @CurrentUser, 'table', 'foi_inventory', 'column', 'batch_no'
go

/*==============================================================*/
/* Table: foi_inventory_count                                   */
/*==============================================================*/
create table foi_inventory_count (
   count_no             varchar(20)          null,
   h_isbn               varchar(15)          null,
   h_name               varchar(200)         null,
   inventory_amount     int                  null,
   count_amount         int                  null
)
go

/*==============================================================*/
/* Table: foi_inventory_temp                                    */
/*==============================================================*/
create table foi_inventory_temp (
   h_isbn               varchar(15)          null,
   h_name               varchar(200)         null,
   h_amount             int                  null
)
go

/*==============================================================*/
/* Table: foi_invoice_dh_received                               */
/*==============================================================*/
create table foi_invoice_dh_received (
   jh_id                varchar(20)          null,
   h_isbn               varchar(15)          null,
   h_amount             int                  null,
   input_time           datetime             null
)
go

