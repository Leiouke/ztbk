/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2022/10/12 15:49:36                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('np_backissue_inbound')
            and   type = 'U')
   drop table np_backissue_inbound
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_backissue_inbound_item')
            and   type = 'U')
   drop table np_backissue_inbound_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_backissue_inbound_item_pool')
            and   type = 'U')
   drop table np_backissue_inbound_item_pool
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_backissue_inventory')
            and   type = 'U')
   drop table np_backissue_inventory
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_backissue_inventory_log')
            and   type = 'U')
   drop table np_backissue_inventory_log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_backissue_outbound')
            and   type = 'U')
   drop table np_backissue_outbound
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_backissue_outbound_item')
            and   type = 'U')
   drop table np_backissue_outbound_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_backissue_outbound_item_pool')
            and   type = 'U')
   drop table np_backissue_outbound_item_pool
go

/*==============================================================*/
/* Table: np_backissue_inbound                                  */
/*==============================================================*/
create table np_backissue_inbound (
   bi_id                varchar(10)          null,
   inventory            varchar(50)          null,
   inbound_time         datetime             null,
   o_id_operator        varchar(50)          null,
   total_count          int                  null,
   total_amount         int                  null,
   memo                 varchar(100)         null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_backissue_inbound')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'inventory')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_backissue_inbound', 'column', 'inventory'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-广济路库房
   1-广中路库房
   2-政审库房
   ',
   'user', @CurrentUser, 'table', 'np_backissue_inbound', 'column', 'inventory'
go

/*==============================================================*/
/* Table: np_backissue_inbound_item                             */
/*==============================================================*/
create table np_backissue_inbound_item (
   id                   int                  identity,
   bi_id                varchar(10)          null,
   amount               int                  null,
   rack_no              varchar(50)          null,
   qk_id                varchar(50)          null,
   mail_code            varchar(50)          null,
   qk_issn              varchar(50)          null,
   qk_name              varchar(200)         null,
   period_name          varchar(200)         null,
   subscribe_date       datetime             null,
   h_price              money                null,
   is_onshelves         bit                  null default 'false',
   onshelves_time       datetime             null,
   o_id_onshelves       varchar(50)          null
)
go

/*==============================================================*/
/* Table: np_backissue_inbound_item_pool                        */
/*==============================================================*/
create table np_backissue_inbound_item_pool (
   id                   int                  identity,
   o_id_exam            varchar(50)          null,
   qk_id                varchar(50)          null,
   mail_code            varchar(50)          null,
   qk_issn              varchar(50)          null,
   qk_name              varchar(200)         null,
   period_name          varchar(200)         null,
   subscribe_date       datetime             null,
   h_price              money                null,
   inventory            varchar(50)          null,
   amount               int                  null,
   rack_no              varchar(50)          null,
   constraint PK_NP_BACKISSUE_INBOUND_ITEM_P primary key (id)
)
go

/*==============================================================*/
/* Table: np_backissue_inventory                                */
/*==============================================================*/
create table np_backissue_inventory (
   inventory            varchar(50)          null,
   amount               int                  null,
   rack_no              varchar(50)          null,
   qk_id                varchar(50)          null,
   mail_code            varchar(50)          null,
   qk_issn              varchar(50)          null,
   qk_name              varchar(200)         null,
   period_name          varchar(200)         null,
   subscribe_date       datetime             null,
   h_price              money                null,
   modify_time          datetime             null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_backissue_inventory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'inventory')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_backissue_inventory', 'column', 'inventory'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-广济路库房
   1-广中路库房
   2-政审库房
   ',
   'user', @CurrentUser, 'table', 'np_backissue_inventory', 'column', 'inventory'
go

/*==============================================================*/
/* Table: np_backissue_inventory_log                            */
/*==============================================================*/
create table np_backissue_inventory_log (
   inventory            varchar(50)          null,
   stock_in_out_type    varchar(50)          null,
   bill_id              varchar(15)          null,
   in_amount            int                  null,
   out_amount           int                  null,
   qk_id                varchar(50)          null,
   mail_code            varchar(50)          null,
   qk_issn              varchar(50)          null,
   qk_name              varchar(200)         null,
   period_name          varchar(200)         null,
   subscribe_date       datetime             null,
   h_price              money                null,
   rack_no              varchar(50)          null,
   remain_amount        int                  null,
   operate_time         datetime             null,
   o_id_operate         varchar(50)          null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_backissue_inventory_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'inventory')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_backissue_inventory_log', 'column', 'inventory'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-广济路库房
   1-广中路库房
   2-政审库房
   ',
   'user', @CurrentUser, 'table', 'np_backissue_inventory_log', 'column', 'inventory'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_backissue_inventory_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'stock_in_out_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_backissue_inventory_log', 'column', 'stock_in_out_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-出库
   1-入库',
   'user', @CurrentUser, 'table', 'np_backissue_inventory_log', 'column', 'stock_in_out_type'
go

/*==============================================================*/
/* Table: np_backissue_outbound                                 */
/*==============================================================*/
create table np_backissue_outbound (
   bo_id                varchar(10)          null,
   inventory            varchar(50)          null,
   outbound_time        datetime             null,
   o_id_operator        varchar(50)          null,
   total_count          int                  null,
   total_amount         int                  null,
   total_real_amount    int                  null,
   memo                 varchar(100)         null,
   outbound_type        varchar(50)          null default '0',
   mai_bo_id            varchar(10)          null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_backissue_outbound')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'inventory')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_backissue_outbound', 'column', 'inventory'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-广济路库房
   1-广中路库房
   2-政审库房
   ',
   'user', @CurrentUser, 'table', 'np_backissue_outbound', 'column', 'inventory'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_backissue_outbound')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'outbound_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_backissue_outbound', 'column', 'outbound_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-销售出库
   1-盘点出库',
   'user', @CurrentUser, 'table', 'np_backissue_outbound', 'column', 'outbound_type'
go

/*==============================================================*/
/* Table: np_backissue_outbound_item                            */
/*==============================================================*/
create table np_backissue_outbound_item (
   id                   int                  identity,
   bo_id                varchar(10)          null,
   qk_id                varchar(50)          null,
   mail_code            varchar(50)          null,
   qk_issn              varchar(50)          null,
   qk_name              varchar(200)         null,
   period_name          varchar(200)         null,
   subscribe_date       datetime             null,
   h_price              money                null,
   amount               int                  null,
   real_amount          int                  null,
   rack_no              varchar(50)          null,
   is_offshelves        bit                  null default 'false',
   offshelves_time      datetime             null,
   o_id_offshelves      varchar(50)          null
)
go

/*==============================================================*/
/* Table: np_backissue_outbound_item_pool                       */
/*==============================================================*/
create table np_backissue_outbound_item_pool (
   id                   int                  identity,
   o_id_exam            varchar(50)          null,
   qk_id                varchar(50)          null,
   mail_code            varchar(50)          null,
   qk_issn              varchar(50)          null,
   qk_name              varchar(200)         null,
   period_name          varchar(200)         null,
   subscribe_date       datetime             null,
   h_price              money                null,
   inventory            varchar(50)          null,
   amount               int                  null,
   rack_no              varchar(50)          null,
   constraint PK_NP_BACKISSUE_OUTBOUND_ITEM_ primary key (id)
)
go

