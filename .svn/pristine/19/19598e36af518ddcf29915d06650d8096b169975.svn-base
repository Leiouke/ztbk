/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2022/12/15 9:24:18                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('fc_collection_against_item')
            and   type = 'U')
   drop table fc_collection_against_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_collection_against_item_temp')
            and   type = 'U')
   drop table fc_collection_against_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_collection_client_pay')
            and   type = 'U')
   drop table fc_collection_client_pay
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_collection_discount_adjustment')
            and   type = 'U')
   drop table fc_collection_discount_adjustment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_collection_discount_adjustment_item')
            and   type = 'U')
   drop table fc_collection_discount_adjustment_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_collection_incoming')
            and   type = 'U')
   drop table fc_collection_incoming
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_collection_incoming_claim')
            and   type = 'U')
   drop table fc_collection_incoming_claim
go

/*==============================================================*/
/* Table: fc_collection_against_item                            */
/*==============================================================*/
create table fc_collection_against_item (
   inc_no               int                  identity,
   bill_id              varchar(12)          null,
   kp_id                varchar(12)          null,
   kp_money             money                null,
   rebate_money         money                null
)
go

/*==============================================================*/
/* Table: fc_collection_against_item_temp                       */
/*==============================================================*/
create table fc_collection_against_item_temp (
   inc_no               int                  identity,
   guid                 varchar(32)          null,
   bill_id              varchar(12)          null,
   kp_id                varchar(12)          null,
   kp_money             money                null,
   rebate_money         money                null
)
go

/*==============================================================*/
/* Table: fc_collection_client_pay                              */
/*==============================================================*/
create table fc_collection_client_pay (
   pa_id                varchar(12)          null,
   c_id                 varchar(12)          null,
   pay_money            money                null,
   kp_money             money                null,
   rebate_money         money                null,
   memo                 varchar(200)         null,
   input_time           datetime             null,
   o_id_operator        varchar(50)          null,
   is_audit             bit                  null default 'false',
   is_audit_pass        bit                  null default 0,
   o_id_audit           varchar(50)          null,
   audit_time           datetime             null,
   is_destroy           bit                  null default 'false',
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   is_account           bit                  null default 0,
   o_id_account         varchar(50)          null,
   account_time         datetime             null
)
go

/*==============================================================*/
/* Table: fc_collection_discount_adjustment                     */
/*==============================================================*/
create table fc_collection_discount_adjustment (
   bill_id              varchar(12)          null,
   is_account           bit                  null default 0,
   account_time         datetime             null,
   account_month        varchar(20)          null,
   account_person       varchar(50)          null,
   c_id                 varchar(12)          null,
   ci_id                varchar(12)          null,
   claim_money          money                null,
   kp_money             money                null,
   rebate_money         money                null,
   input_time           datetime             null,
   o_id_operator        varchar(50)          null,
   unit_code            varchar(50)          null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('fc_collection_discount_adjustment') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'fc_collection_discount_adjustment' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '本来想加所属组织字段的, 但是客户信息里面已经有组织信息了, 所以不加了实时取吧', 
   'user', @CurrentUser, 'table', 'fc_collection_discount_adjustment'
go

/*==============================================================*/
/* Table: fc_collection_discount_adjustment_item                */
/*==============================================================*/
create table fc_collection_discount_adjustment_item (
   inc_no               int                  identity,
   bill_id              varchar(12)          null,
   c_id                 varchar(12)          null,
   cw_type              varchar(50)          null,
   rebate_money         money                null
)
go

/*==============================================================*/
/* Table: fc_collection_incoming                                */
/*==============================================================*/
create table fc_collection_incoming (
   ci_id                varchar(12)          null,
   company              varchar(100)         null,
   account              varchar(100)         null,
   receive_date         datetime             null,
   receive_money        money                null,
   pay_type             varchar(50)          null,
   pay_certificate      varchar(50)          null,
   surplus_money        money                null,
   summary              varchar(200)         null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   is_confirm           bit                  null default 0,
   o_id_confirm         varchar(50)          null,
   confirm_time         datetime             null,
   receive_bank         varchar(50)          null,
   receive_account      varchar(50)          null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_collection_incoming')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'pay_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_collection_incoming', 'column', 'pay_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_collection_incoming', 'column', 'pay_type'
go

/*==============================================================*/
/* Table: fc_collection_incoming_claim                          */
/*==============================================================*/
create table fc_collection_incoming_claim (
   ca_id                varchar(12)          null,
   c_id                 varchar(12)          null,
   ci_id                varchar(12)          null,
   claim_source         varchar(50)          null default '0',
   claim_money          money                null,
   kp_money             money                null,
   rebate_money         money                null,
   switch_to_balance    money                null,
   memo                 varchar(200)         null,
   input_time           datetime             null,
   o_id_operator        varchar(50)          null,
   is_audit             bit                  null default 'false',
   is_audit_pass        bit                  null default 0,
   o_id_audit           varchar(50)          null,
   audit_time           datetime             null,
   is_destroy           bit                  null default 'false',
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_collection_incoming_claim')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'claim_source')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_collection_incoming_claim', 'column', 'claim_source'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-外部来款
   1-内部转账',
   'user', @CurrentUser, 'table', 'fc_collection_incoming_claim', 'column', 'claim_source'
go

