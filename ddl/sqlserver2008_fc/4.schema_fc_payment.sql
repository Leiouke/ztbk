/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2023/1/17 9:06:44                            */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_factory_balance')
            and   type = 'U')
   drop table fc_db_factory_balance
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_factory_balance_item')
            and   type = 'U')
   drop table fc_db_factory_balance_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_advance')
            and   type = 'U')
   drop table fc_payment_advance
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_application')
            and   type = 'U')
   drop table fc_payment_application
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_application_cw_classify')
            and   type = 'U')
   drop table fc_payment_application_cw_classify
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_application_item')
            and   type = 'U')
   drop table fc_payment_application_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_application_item_temp')
            and   type = 'U')
   drop table fc_payment_application_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_application_overseas')
            and   type = 'U')
   drop table fc_payment_application_overseas
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_application_pay_comfirm')
            and   type = 'U')
   drop table fc_payment_application_pay_comfirm
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_discount_adjustment')
            and   type = 'U')
   drop table fc_payment_discount_adjustment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_discount_adjustment_item')
            and   type = 'U')
   drop table fc_payment_discount_adjustment_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_factory_pay')
            and   type = 'U')
   drop table fc_payment_factory_pay
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_factory_pay_item')
            and   type = 'U')
   drop table fc_payment_factory_pay_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_factory_pay_item_temp')
            and   type = 'U')
   drop table fc_payment_factory_pay_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_invoice')
            and   type = 'U')
   drop table fc_payment_invoice
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_invoice_item')
            and   type = 'U')
   drop table fc_payment_invoice_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_invoice_item_temp')
            and   type = 'U')
   drop table fc_payment_invoice_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_statement')
            and   type = 'U')
   drop table fc_payment_statement
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_statement_item')
            and   type = 'U')
   drop table fc_payment_statement_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_payment_statement_item_temp')
            and   type = 'U')
   drop table fc_payment_statement_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_purchase_report')
            and   type = 'U')
   drop table fc_purchase_report
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_purchase_report_item_to_file')
            and   type = 'U')
   drop table fc_purchase_report_item_to_file
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_purchase_report_item_to_file_temp')
            and   type = 'U')
   drop table fc_purchase_report_item_to_file_temp
go

/*==============================================================*/
/* Table: fc_db_factory_balance                                 */
/*==============================================================*/
create table fc_db_factory_balance (
   f_id                 varchar(12)          null,
   currency             varchar(50)          null,
   balance_c_real_money money                null,
   balance_real_money   money                null
)
go

/*==============================================================*/
/* Table: fc_db_factory_balance_item                            */
/*==============================================================*/
create table fc_db_factory_balance_item (
   ID                   int                  identity,
   f_id                 varchar(12)          null,
   budget_type          varchar(50)          null,
   bill_id              varchar(12)          null,
   currency             varchar(50)          null,
   c_real_money         money                null,
   real_money           money                null,
   memo                 varchar(200)         null,
   input_time           datetime             null,
   o_id_operator        varchar(50)          null,
   constraint PK_FC_DB_FACTORY_BALANCE_ITEM primary key (ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('fc_db_factory_balance_item') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'fc_db_factory_balance_item' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '包含余额支出冻结的那部分', 
   'user', @CurrentUser, 'table', 'fc_db_factory_balance_item'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_db_factory_balance_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'budget_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_db_factory_balance_item', 'column', 'budget_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-收入
   1-支出',
   'user', @CurrentUser, 'table', 'fc_db_factory_balance_item', 'column', 'budget_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_db_factory_balance_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'bill_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_db_factory_balance_item', 'column', 'bill_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收入来源于预付付款申请
   支出来源于货源余额支出单',
   'user', @CurrentUser, 'table', 'fc_db_factory_balance_item', 'column', 'bill_id'
go

/*==============================================================*/
/* Table: fc_payment_advance                                    */
/*==============================================================*/
create table fc_payment_advance (
   pv_id                varchar(12)          not null,
   f_id                 varchar(12)          null,
   currency             varchar(50)          null,
   c_real_money         money                null,
   rmb_real_money       money                null,
   real_money           money                null,
   input_code           varchar(50)          null,
   input_time           datetime             null,
   sales_code           varchar(50)          null,
   memo                 varchar(200)         null,
   status               varchar(50)          null,
   is_destroy           bit                  null default 0,
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   org_code             varchar(10)          null,
   unit_code            varchar(50)          null,
   export_invoice_no    varchar(50)          null,
   cost_form            varchar(50)          null,
   pv_cw_type           varchar(50)          null,
   constraint PK_FC_PAYMENT_ADVANCE primary key (pv_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_advance')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_advance', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-制单中
   1-付款申请中
   2-已付款',
   'user', @CurrentUser, 'table', 'fc_payment_advance', 'column', 'status'
go

/*==============================================================*/
/* Table: fc_payment_application                                */
/*==============================================================*/
create table fc_payment_application (
   ap_id                varchar(12)          null,
   f_id                 varchar(12)          null,
   fc_apply_type        varchar(50)          null,
   application_target   varchar(50)          null default '0',
   o_id_operator        varchar(50)          null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   currency             varchar(50)          null,
   item_count           int                  null,
   apply_c_real_money   money                null,
   apply_real_money     money                null,
   bank_id              int                  null,
   status               varchar(50)          null,
   memo                 varchar(200)         null,
   is_destroy           bit                  null default 0,
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   org_code             varchar(10)          null,
   flow_id              int                  null,
   approval_result      varchar(50)          null,
   unit_code            varchar(50)          null,
   is_agent             bit                  null default 0,
   agent_c_id           varchar(12)          null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_apply_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application', 'column', 'fc_apply_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-预付申请
   1-发票申请',
   'user', @CurrentUser, 'table', 'fc_payment_application', 'column', 'fc_apply_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'application_target')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application', 'column', 'application_target'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-外部付款
   1-内部转账',
   'user', @CurrentUser, 'table', 'fc_payment_application', 'column', 'application_target'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-制单中
   1-审批中
   2-审批不过
   3-待付款
   4-已付款
   5-财务终止',
   'user', @CurrentUser, 'table', 'fc_payment_application', 'column', 'status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'approval_result')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application', 'column', 'approval_result'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0- 未提交
   1- 审批中
   2- 已通过
   3- 未通过',
   'user', @CurrentUser, 'table', 'fc_payment_application', 'column', 'approval_result'
go

/*==============================================================*/
/* Table: fc_payment_application_cw_classify                    */
/*==============================================================*/
create table fc_payment_application_cw_classify (
   id                   int                  identity,
   ap_id                varchar(12)          null,
   cost_form            varchar(50)          null,
   cw_type              varchar(50)          null,
   subject_code         varchar(20)          null,
   subject_name         varchar(50)          null,
   c_real_money         money                null
)
go

/*==============================================================*/
/* Table: fc_payment_application_item                           */
/*==============================================================*/
create table fc_payment_application_item (
   inc_no               int                  identity,
   ap_id                varchar(12)          null,
   bill_id              varchar(12)          null,
   c_real_money         money                null,
   real_money           money                null
)
go

/*==============================================================*/
/* Table: fc_payment_application_item_temp                      */
/*==============================================================*/
create table fc_payment_application_item_temp (
   inc_no               int                  identity,
   guid                 varchar(32)          null,
   ap_id                varchar(12)          null,
   bill_id              varchar(12)          null,
   c_real_money         money                null,
   real_money           money                null
)
go

/*==============================================================*/
/* Table: fc_payment_application_overseas                       */
/*==============================================================*/
create table fc_payment_application_overseas (
   ap_id                varchar(12)          null,
   fc_remittance_method varchar(50)          null,
   fc_payment_currency  varchar(50)          null,
   fx_amount            money                null,
   purchase_amount      money                null,
   fc_fx_account        varchar(50)          null,
   fc_purchase_account  varchar(50)          null,
   fc_submit_bank       varchar(50)          null,
   fc_submit_method     varchar(50)          null,
   fc_remittance_type   varchar(50)          null,
   fc_remittance_nature varchar(50)          null,
   fc_remittance_category varchar(50)          null,
   remittance_information varchar(500)         null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_remittance_method')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_remittance_method'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_remittance_method'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_payment_currency')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_payment_currency'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_payment_currency'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_fx_account')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_fx_account'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_fx_account'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_purchase_account')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_purchase_account'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_purchase_account'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_submit_bank')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_submit_bank'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_submit_bank'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_submit_method')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_submit_method'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_submit_method'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_remittance_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_remittance_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_remittance_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_remittance_nature')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_remittance_nature'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_remittance_nature'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_application_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_remittance_category')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_remittance_category'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_application_overseas', 'column', 'fc_remittance_category'
go

/*==============================================================*/
/* Table: fc_payment_application_pay_comfirm                    */
/*==============================================================*/
create table fc_payment_application_pay_comfirm (
   id                   int                  identity,
   ap_id                varchar(12)          null,
   pay_date             datetime             null,
   o_id_input           varchar(50)          null,
   input_date           datetime             null,
   pay_money            money                null
)
go

/*==============================================================*/
/* Table: fc_payment_discount_adjustment                        */
/*==============================================================*/
create table fc_payment_discount_adjustment (
   bill_id              varchar(12)          null,
   is_account           bit                  null default 0,
   account_time         datetime             null,
   account_month        varchar(20)          null,
   account_person       varchar(50)          null,
   f_id                 varchar(12)          null,
   currency             varchar(50)          null,
   rebate_money         money                null,
   input_time           datetime             null,
   o_id_operator        varchar(50)          null,
   unit_code            varchar(50)          null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('fc_payment_discount_adjustment') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'fc_payment_discount_adjustment' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '本来想加所属组织字段的, 但是货源信息里面已经有组织信息了, 所以不加了实时取吧', 
   'user', @CurrentUser, 'table', 'fc_payment_discount_adjustment'
go

/*==============================================================*/
/* Table: fc_payment_discount_adjustment_item                   */
/*==============================================================*/
create table fc_payment_discount_adjustment_item (
   inc_no               int                  identity,
   bill_id              varchar(12)          null,
   f_id                 varchar(12)          null,
   currency             varchar(50)          null,
   cw_type              varchar(50)          null,
   rebate_money         money                null
)
go

/*==============================================================*/
/* Table: fc_payment_factory_pay                                */
/*==============================================================*/
create table fc_payment_factory_pay (
   fb_id                varchar(12)          null,
   f_id                 varchar(12)          null,
   currency             varchar(50)          null,
   pay_c_real_money     money                null,
   pay_real_money       money                null,
   memo                 varchar(200)         null,
   input_time           datetime             null,
   o_id_operator        varchar(50)          null,
   audit_status         varchar(50)          null,
   o_id_audit           varchar(50)          null,
   audit_time           datetime             null,
   is_destroy           bit                  null default 'false',
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_factory_pay')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'audit_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_factory_pay', 'column', 'audit_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-未审核
   1-审核通过
   2-审核不过',
   'user', @CurrentUser, 'table', 'fc_payment_factory_pay', 'column', 'audit_status'
go

/*==============================================================*/
/* Table: fc_payment_factory_pay_item                           */
/*==============================================================*/
create table fc_payment_factory_pay_item (
   inc_no               int                  identity,
   fb_id                varchar(12)          null,
   inv_id               varchar(12)          null,
   against_c_real_money money                null,
   against_real_money   money                null
)
go

/*==============================================================*/
/* Table: fc_payment_factory_pay_item_temp                      */
/*==============================================================*/
create table fc_payment_factory_pay_item_temp (
   inc_no               int                  identity,
   guid                 varchar(32)          null,
   fb_id                varchar(12)          null,
   inv_id               varchar(12)          null,
   against_c_real_money money                null,
   against_real_money   money                null,
   can_c_real_money     money                null
)
go

/*==============================================================*/
/* Table: fc_payment_invoice                                    */
/*==============================================================*/
create table fc_payment_invoice (
   inv_id               varchar(12)          not null,
   inv_no               varchar(100)         null,
   f_id                 varchar(12)          null,
   fc_invoice_class     varchar(50)          null,
   is_red               bit                  null default 'false',
   inv_date             datetime             null,
   currency             varchar(50)          null,
   c_real_money         money                null,
   real_money           money                null,
   against_c_real_money money                null default 0,
   against_real_money   money                null default 0,
   memo                 varchar(1000)        null,
   status               varchar(50)          null,
   o_id_operator        varchar(50)          null,
   o_id_input           varchar(50)          null,
   input_date           datetime             null,
   o_id_modify          varchar(50)          null,
   last_mod_date        datetime             null,
   is_destroy           bit                  null default 'false',
   o_id_destroy         varchar(50)          null,
   destroy_date         datetime             null,
   fw_money             money                null,
   org_code             varchar(10)          null,
   unit_code            varchar(50)          null,
   file_address         varchar(255)         null,
   constraint PK_FC_PAYMENT_INVOICE primary key (inv_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_invoice')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_invoice_class')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_invoice', 'column', 'fc_invoice_class'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_payment_invoice', 'column', 'fc_invoice_class'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_invoice')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_invoice', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-制单中
   1-付款申请中
   2-已付款',
   'user', @CurrentUser, 'table', 'fc_payment_invoice', 'column', 'status'
go

/*==============================================================*/
/* Table: fc_payment_invoice_item                               */
/*==============================================================*/
create table fc_payment_invoice_item (
   inc_no               int                  identity,
   inv_id               varchar(12)          null,
   ps_id                varchar(12)          null,
   c_real_money         money                null,
   real_money           money                null
)
go

/*==============================================================*/
/* Table: fc_payment_invoice_item_temp                          */
/*==============================================================*/
create table fc_payment_invoice_item_temp (
   inc_no               int                  identity,
   guid                 varchar(32)          null,
   inv_id               varchar(12)          null,
   ps_id                varchar(12)          null,
   c_real_money         money                null,
   real_money           money                null,
   can_c_real_money     money                null,
   can_real_money       money                null
)
go

/*==============================================================*/
/* Table: fc_payment_statement                                  */
/*==============================================================*/
create table fc_payment_statement (
   ps_id                varchar(12)          not null,
   f_id                 varchar(12)          null,
   source_no            varchar(50)          null,
   ps_type              varchar(50)          null,
   currency             varchar(50)          null,
   c_real_money         money                null,
   total_money          money                null,
   real_money           money                null,
   inv_money            money                null,
   inv_real_money       money                null default 0,
   input_code           varchar(50)          null,
   input_time           datetime             null,
   sales_code           varchar(50)          null,
   memo                 varchar(200)         null,
   is_account           bit                  null default 0,
   account_time         datetime             null,
   account_month        varchar(20)          null,
   account_person       varchar(50)          null,
   op_code              varchar(50)          null,
   op_date              datetime             null,
   org_code             varchar(10)          null,
   unit_code            varchar(50)          null,
   cost_classification  varchar(50)          null,
   cost_form            varchar(50)          null,
   money_arrear         bit                  null,
   pici                 varchar(100)         null,
   export_invoice_no    varchar(50)          null,
   constraint PK_FC_PAYMENT_STATEMENT primary key (ps_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_statement')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ps_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_statement', 'column', 'ps_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-普通结算单
   1-其他结算单',
   'user', @CurrentUser, 'table', 'fc_payment_statement', 'column', 'ps_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_payment_statement')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'cost_classification')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_payment_statement', 'column', 'cost_classification'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-实物成本
   1-非实物成本',
   'user', @CurrentUser, 'table', 'fc_payment_statement', 'column', 'cost_classification'
go

/*==============================================================*/
/* Table: fc_payment_statement_item                             */
/*==============================================================*/
create table fc_payment_statement_item (
   inc_no               int                  identity,
   ps_id                varchar(12)          null,
   ps_cw_type           varchar(50)          null,
   c_real_money         money                null,
   total_money          money                null,
   real_money           money                null,
   "related_bill(暂时未知)" varchar(50)          null,
   taxback_rate         money                null,
   constraint PK_FC_PAYMENT_STATEMENT_ITEM primary key (inc_no)
)
go

/*==============================================================*/
/* Table: fc_payment_statement_item_temp                        */
/*==============================================================*/
create table fc_payment_statement_item_temp (
   guid                 varchar(32)          null,
   inc_no               int                  identity,
   ps_id                varchar(12)          null,
   ps_cw_type           varchar(50)          null,
   c_real_money         money                null,
   total_money          money                null,
   real_money           money                null,
   "related_bill(暂时未知)" varchar(50)          null,
   taxback_rate         money                null
)
go

/*==============================================================*/
/* Table: fc_purchase_report                                    */
/*==============================================================*/
create table fc_purchase_report (
   report_id            varchar(12)          not null,
   report_type          varchar(50)          null,
   report_description   varchar(100)         null,
   account_month        varchar(20)          null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   status               varchar(50)          null,
   o_id_commit          varchar(50)          null,
   commit_time          datetime             null,
   o_id_file            varchar(50)          null,
   file_time            datetime             null,
   dep_org_code         varchar(10)          null,
   unit_code            varchar(50)          null,
   constraint PK_FC_PURCHASE_REPORT primary key (report_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_purchase_report')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_purchase_report', 'column', 'report_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典, 跟结算单类型对应起来的
   0-业务进货报表
   1-其他支付报表',
   'user', @CurrentUser, 'table', 'fc_purchase_report', 'column', 'report_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_purchase_report')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_purchase_report', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典, 跟销售报表一致
   0-制单中
   1-已提交
   2-已退回
   3-已归档',
   'user', @CurrentUser, 'table', 'fc_purchase_report', 'column', 'status'
go

/*==============================================================*/
/* Table: fc_purchase_report_item_to_file                       */
/*==============================================================*/
create table fc_purchase_report_item_to_file (
   report_id            varchar(12)          not null,
   report_type          varchar(50)          null,
   dep_org_code         varchar(10)          null,
   account_month        varchar(20)          null,
   f_id                 varchar(12)          null,
   currency             varchar(50)          null,
   cw_type              varchar(50)          null,
   unit_code            varchar(50)          null,
   cost_classification  varchar(50)          null,
   c_real_money         money                null,
   total_money          money                null,
   predict_real_money   money                null,
   rebate_money         money                null,
   real_money           money                null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('fc_purchase_report_item_to_file') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '这个在提交后将进货报表明细数据生成, 后续可能会被财务调整', 
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_purchase_report_item_to_file')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file', 'column', 'report_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典, 跟结算单类型对应起来的
   0-业务进货报表
   1-其他支付报表',
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file', 'column', 'report_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_purchase_report_item_to_file')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'cost_classification')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file', 'column', 'cost_classification'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-实物成本
   1-非实物成本',
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file', 'column', 'cost_classification'
go

/*==============================================================*/
/* Table: fc_purchase_report_item_to_file_temp                  */
/*==============================================================*/
create table fc_purchase_report_item_to_file_temp (
   id                   int                  identity,
   report_id            varchar(12)          not null,
   report_type          varchar(50)          null,
   dep_org_code         varchar(10)          null,
   account_month        varchar(20)          null,
   f_id                 varchar(12)          null,
   currency             varchar(50)          null,
   cw_type              varchar(50)          null,
   unit_code            varchar(50)          null,
   cost_classification  varchar(50)          null,
   c_real_money         money                null,
   total_money          money                null,
   predict_real_money   money                null,
   rebate_money         money                null,
   real_money           money                null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('fc_purchase_report_item_to_file_temp') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file_temp' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '每次保证只有1个人在用, 所以这张表每次只会引入一个报表、一个货源、一个币种的数据, 让用户自己维护, 暂时不用guid了', 
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file_temp'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_purchase_report_item_to_file_temp')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file_temp', 'column', 'report_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典, 跟结算单类型对应起来的
   0-业务进货报表
   1-其他支付报表',
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file_temp', 'column', 'report_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_purchase_report_item_to_file_temp')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'cost_classification')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file_temp', 'column', 'cost_classification'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-实物成本
   1-非实物成本',
   'user', @CurrentUser, 'table', 'fc_purchase_report_item_to_file_temp', 'column', 'cost_classification'
go

