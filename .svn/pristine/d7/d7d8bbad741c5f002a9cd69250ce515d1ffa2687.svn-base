/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2023/1/5 10:12:24                            */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('np_account_month')
            and   type = 'U')
   drop table np_account_month
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_agency_advance_payment')
            and   type = 'U')
   drop table np_agency_advance_payment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_agency_cw_type_mapping')
            and   type = 'U')
   drop table np_agency_cw_type_mapping
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_agency_sale_classify')
            and   type = 'U')
   drop table np_agency_sale_classify
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_client_budget_item')
            and   type = 'U')
   drop table np_client_budget_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_cw_sale_classify')
            and   type = 'U')
   drop table np_cw_sale_classify
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_cw_type_mapping')
            and   type = 'U')
   drop table np_cw_type_mapping
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_fhsh')
            and   type = 'U')
   drop table np_fhsh
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_fhsh_charge_against')
            and   type = 'U')
   drop table np_fhsh_charge_against
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_fhsh_item')
            and   type = 'U')
   drop table np_fhsh_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_fhsh_item_temp')
            and   type = 'U')
   drop table np_fhsh_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_fhsh_overseas')
            and   type = 'U')
   drop table np_fhsh_overseas
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_invoice_dh')
            and   type = 'U')
   drop table np_invoice_dh
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_invoice_dh_item')
            and   type = 'U')
   drop table np_invoice_dh_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_invoice_dh_item_temp')
            and   type = 'U')
   drop table np_invoice_dh_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_invoice_kp')
            and   type = 'U')
   drop table np_invoice_kp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_invoice_kp_item')
            and   type = 'U')
   drop table np_invoice_kp_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_invoice_kp_item_content')
            and   type = 'U')
   drop table np_invoice_kp_item_content
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_invoice_kp_item_temp')
            and   type = 'U')
   drop table np_invoice_kp_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_item_classify')
            and   type = 'U')
   drop table np_item_classify
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_pay_comfirm')
            and   type = 'U')
   drop table np_pay_comfirm
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_payment_charge')
            and   type = 'U')
   drop table np_payment_charge
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_receive_payment')
            and   type = 'U')
   drop table np_receive_payment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_receive_payment_invoice')
            and   type = 'U')
   drop table np_receive_payment_invoice
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_sale_report')
            and   type = 'U')
   drop table np_sale_report
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_statement_cw_sale_classify')
            and   type = 'U')
   drop table np_statement_cw_sale_classify
go

/*==============================================================*/
/* Table: np_account_month                                      */
/*==============================================================*/
create table np_account_month (
   month_code           varchar(50)          null,
   month_name           varchar(50)          null,
   is_close             bit                  null default 'false',
   close_memo           varchar(200)         null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_account_month')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'month_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_account_month', 'column', 'month_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '如 2017.09',
   'user', @CurrentUser, 'table', 'np_account_month', 'column', 'month_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_account_month')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'month_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_account_month', 'column', 'month_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '如 2017年09月',
   'user', @CurrentUser, 'table', 'np_account_month', 'column', 'month_name'
go

/*==============================================================*/
/* Table: np_agency_advance_payment                             */
/*==============================================================*/
create table np_agency_advance_payment (
   ap_id                varchar(15)          null,
   month_code           varchar(50)          null,
   f_id                 varchar(10)          null,
   currency             varchar(50)          null,
   advance_money        money                null,
   exchange_rate        decimal(16,5)        null,
   rmb_advance_money    money                null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   is_confirm           bit                  null default 0,
   o_id_confirm         varchar(50)          null,
   confirm_time         datetime             null,
   memo                 varchar(200)         null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_agency_advance_payment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'month_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_agency_advance_payment', 'column', 'month_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '如 2017.09',
   'user', @CurrentUser, 'table', 'np_agency_advance_payment', 'column', 'month_code'
go

/*==============================================================*/
/* Table: np_agency_cw_type_mapping                             */
/*==============================================================*/
create table np_agency_cw_type_mapping (
   cw_type              varchar(50)          null,
   new_cw_type          varchar(50)          null,
   statement_type       varchar(50)          null
)
go

/*==============================================================*/
/* Table: np_agency_sale_classify                               */
/*==============================================================*/
create table np_agency_sale_classify (
   id                   int                  identity,
   account_month        varchar(20)          null,
   statement_no         varchar(10)          null,
   jx_total_money       money                null,
   dx_total_money       money                null,
   ds_total_money       money                null,
   dz_total_money       money                null,
   qt_total_money       money                null,
   zw_total_money       money                null,
   rw_total_money       money                null,
   xw_total_money       money                null,
   gh_total_money       money                null,
   yf_total_money       money                null,
   jx_real_money        money                null,
   dx_real_money        money                null,
   ds_real_money        money                null,
   dz_real_money        money                null,
   qt_real_money        money                null,
   zw_real_money        money                null,
   rw_real_money        money                null,
   xw_real_money        money                null,
   gh_real_money        money                null,
   yf_real_money        money                null,
   n_dx_total_money     money                null,
   n_px_total_money     money                null,
   n_qt_total_money     money                null,
   n_sz_total_money     money                null,
   n_dx_real_money      money                null,
   n_px_real_money      money                null,
   n_qt_real_money      money                null,
   n_sz_real_money      money                null,
   constraint PK_NP_AGENCY_SALE_CLASSIFY primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('np_agency_sale_classify') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'np_agency_sale_classify' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '以后不会有这张表了 弃掉', 
   'user', @CurrentUser, 'table', 'np_agency_sale_classify'
go

/*==============================================================*/
/* Table: np_client_budget_item                                 */
/*==============================================================*/
create table np_client_budget_item (
   id                   int                  identity,
   c_id                 varchar(10)          null,
   budget_type          varchar(50)          null,
   rp_id                varchar(15)          null,
   source               varchar(50)          null,
   source_id            varchar(15)          null,
   money_amount         money                null,
   agent_money          money                null,
   memo                 varchar(200)         null,
   input_time           datetime             null,
   o_id_operator        varchar(50)          null,
   audit_status         bit                  null default 'false',
   audit_pass           bit                  null default 0,
   o_id_audit           varchar(50)          null,
   audit_time           datetime             null,
   constraint PK_NP_CLIENT_BUDGET_ITEM primary key (id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_client_budget_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'budget_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'budget_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-收入
   1-支出',
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'budget_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_client_budget_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'source')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'source'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0- 来款单(收入来源,其他为支出来源)
   1- 销售发票
   2- 申汇单
   3- 运输费
   4- 包装费
   5- 其他支出
   6- 转入代理',
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'source'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_client_budget_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'source_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'source_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收入来源于来款单
   支出来源于销售发票、申汇单、其他（运输费、包装费）为空',
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'source_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_client_budget_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'audit_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'audit_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '默认都是审核过',
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'audit_status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_client_budget_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'audit_pass')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'audit_pass'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '都是默认审核通过的
   也就是跳过审核流程了',
   'user', @CurrentUser, 'table', 'np_client_budget_item', 'column', 'audit_pass'
go

/*==============================================================*/
/* Table: np_cw_sale_classify                                   */
/*==============================================================*/
create table np_cw_sale_classify (
   id                   int                  identity,
   report_id            varchar(10)          not null,
   account_month        varchar(20)          null,
   cw_type              varchar(50)          null,
   real_money           money                null,
   sort_number          int                  null
)
go

/*==============================================================*/
/* Table: np_cw_type_mapping                                    */
/*==============================================================*/
create table np_cw_type_mapping (
   qk_no                varchar(50)          null,
   qk_name              varchar(500)         null,
   cw_type              varchar(50)          null
)
go

/*==============================================================*/
/* Table: np_fhsh                                               */
/*==============================================================*/
create table np_fhsh (
   fh_id                varchar(15)          null,
   f_id                 varchar(10)          null,
   fh_no                varchar(100)         null,
   jh_no                varchar(10)          null,
   o_id_operator        varchar(50)          null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   fh_date              datetime             null,
   currency             varchar(50)          null,
   fh_money             money                null,
   invoice_amount       int                  null,
   total_money          money                null,
   region_catagory      varchar(50)          null,
   bank_id              int                  null,
   status               varchar(50)          null,
   is_advance           bit                  null default 'false',
   is_bail              bit                  null default 'false',
   memo                 varchar(200)         null,
   fw_mode              varchar(50)          null,
   fhsh_family          varchar(50)          null default '0',
   c_id                 varchar(10)          null,
   o_id_first_auditor   varchar(50)          null,
   o_id_second_auditor  varchar(50)          null,
   first_audit_time     datetime             null,
   second_audit_time    datetime             null,
   audit_memo           varchar(200)         null,
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   is_account           bit                  null default 'false',
   account_date         datetime             null,
   account_month        varchar(20)          null,
   account_person       varchar(50)          null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'region_catagory')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh', 'column', 'region_catagory'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-国外
   1-国内',
   'user', @CurrentUser, 'table', 'np_fhsh', 'column', 'region_catagory'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-制单中
   1-待一级审核
   2-待二级审核
   3-审核退回
   4-待付汇
   5-已付汇
   6-已作废',
   'user', @CurrentUser, 'table', 'np_fhsh', 'column', 'status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fhsh_family')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh', 'column', 'fhsh_family'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-常规
   1-代理',
   'user', @CurrentUser, 'table', 'np_fhsh', 'column', 'fhsh_family'
go

/*==============================================================*/
/* Table: np_fhsh_charge_against                                */
/*==============================================================*/
create table np_fhsh_charge_against (
   fh_id                varchar(15)          null,
   ap_id                varchar(15)          null,
   against_money        money                null,
   rmb_against_money    money                null,
   input_time           datetime             null
)
go

/*==============================================================*/
/* Table: np_fhsh_item                                          */
/*==============================================================*/
create table np_fhsh_item (
   item_id              varchar(32)          null,
   fh_id                varchar(15)          null,
   inv_id               varchar(15)          null,
   fh_money             money                null
)
go

/*==============================================================*/
/* Table: np_fhsh_item_temp                                     */
/*==============================================================*/
create table np_fhsh_item_temp (
   guid                 varchar(32)          null,
   item_id              varchar(32)          null,
   fh_id                varchar(15)          null,
   inv_id               varchar(15)          null,
   fh_money             money                null,
   can_fh_money         money                null
)
go

/*==============================================================*/
/* Table: np_fhsh_overseas                                      */
/*==============================================================*/
create table np_fhsh_overseas (
   fh_id                varchar(15)          null,
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
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_remittance_method')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_remittance_method'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_remittance_method'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_payment_currency')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_payment_currency'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_payment_currency'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_fx_account')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_fx_account'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_fx_account'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_purchase_account')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_purchase_account'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_purchase_account'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_submit_bank')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_submit_bank'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_submit_bank'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_submit_method')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_submit_method'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_submit_method'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_remittance_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_remittance_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_remittance_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_remittance_nature')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_remittance_nature'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_remittance_nature'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_fhsh_overseas')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_remittance_category')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_remittance_category'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_fhsh_overseas', 'column', 'fc_remittance_category'
go

/*==============================================================*/
/* Table: np_invoice_dh                                         */
/*==============================================================*/
create table np_invoice_dh (
   inv_id               varchar(15)          not null,
   inv_no               varchar(100)         null,
   f_id                 varchar(10)          null,
   invoice_class        varchar(50)          null,
   is_red               bit                  null default 'false',
   inv_date             datetime             null,
   currency             varchar(50)          null,
   total_money          money                null,
   fee_traffic          money                null,
   fee_handling         money                null,
   traffic_share        bit                  null default 'false',
   handling_share       bit                  null default 'false',
   total_amount         int                  null,
   sum_money            money                null,
   memo                 varchar(1000)        null,
   status               varchar(50)          null,
   o_id_operator        varchar(50)          null,
   o_id_input           varchar(50)          null,
   input_date           datetime             null,
   o_id_modify          varchar(50)          null,
   last_mod_date        datetime             null,
   o_id_destroy         varchar(50)          null,
   destroy_date         datetime             null,
   verify_time          datetime             null,
   o_id_verify          varchar(50)          null,
   total_money_diff     money                null default 0,
   real_money_diff      money                null default 0,
   sw_money             money                null,
   fw_money             money                null,
   is_in_storegoods     bit                  null default 'false',
   invoice_family       varchar(50)          null,
   is_db                bit                  null default 0,
   agent_c_id           varchar(10)          null,
   agent_real_money     money                null,
   constraint PK_NP_INVOICE_DH primary key (inv_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_invoice_dh')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_invoice_dh', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-制单中
   1-申汇中
   4-已申汇
   5-已付汇
   2-已记账
   3-已作废',
   'user', @CurrentUser, 'table', 'np_invoice_dh', 'column', 'status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_invoice_dh')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'invoice_family')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_invoice_dh', 'column', 'invoice_family'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-常规
   1-代理',
   'user', @CurrentUser, 'table', 'np_invoice_dh', 'column', 'invoice_family'
go

/*==============================================================*/
/* Table: np_invoice_dh_item                                    */
/*==============================================================*/
create table np_invoice_dh_item (
   inv_id               varchar(15)          not null,
   cw_type              varchar(50)          null,
   item_money           money                null,
   sort_number          int                  null,
   is_purchase_classify bit                  null default 0
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_invoice_dh_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_purchase_classify')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_invoice_dh_item', 'column', 'is_purchase_classify'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '这个字段以后都是0了',
   'user', @CurrentUser, 'table', 'np_invoice_dh_item', 'column', 'is_purchase_classify'
go

/*==============================================================*/
/* Table: np_invoice_dh_item_temp                               */
/*==============================================================*/
create table np_invoice_dh_item_temp (
   guid                 varchar(32)          null,
   inv_id               varchar(15)          null,
   cw_type              varchar(50)          null,
   item_money           money                null,
   sort_number          int                  null
)
go

/*==============================================================*/
/* Table: np_invoice_kp                                         */
/*==============================================================*/
create table np_invoice_kp (
   kp_id                varchar(15)          null,
   kp_no                varchar(100)         null,
   c_id                 varchar(10)          null,
   is_duty_free         bit                  null default 'false',
   invoice_type         varchar(50)          null,
   tax_rate             decimal(16,5)        null,
   amount               int                  null,
   tax_money            money                null,
   total_money          money                null,
   receive_money        money                null default 0,
   kp_date              datetime             null,
   memo                 varchar(200)         null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   o_id_receiver        varchar(50)          null,
   is_relate_delivery   bit                  null default 'false',
   is_destroy           bit                  null default 'false',
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   status               varchar(50)          null,
   is_db                bit                  null default 'false',
   is_item_kp           bit                  null default 0,
   sale_class           varchar(50)          null,
   is_to_finance        bit                  null default 0,
   is_claim_kp          bit                  null default 0,
   is_commit_claim      bit                  null default 0,
   kp_batch_id          varchar(15)          null,
   kp_content           varchar(50)          null,
   kp_amount            varchar(10)          null,
   kp_unit              varchar(10)          null,
   kp_memo              varchar(100)         null,
   bank_id              int                  null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_invoice_kp')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_invoice_kp', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典项目
   0 - 开票中
   1 - 已开票
   2 - 已收款',
   'user', @CurrentUser, 'table', 'np_invoice_kp', 'column', 'status'
go

/*==============================================================*/
/* Table: np_invoice_kp_item                                    */
/*==============================================================*/
create table np_invoice_kp_item (
   item_id              varchar(50)          null,
   kp_id                varchar(15)          null,
   statement_no         varchar(10)          null,
   real_money           money                null,
   kp_money             money                null,
   sort_number          int                  null,
   receive_money        money                null
)
go

/*==============================================================*/
/* Table: np_invoice_kp_item_content                            */
/*==============================================================*/
create table np_invoice_kp_item_content (
   id                   int                  identity,
   kp_id                varchar(15)          null,
   kp_content           varchar(200)         null,
   kp_amount            varchar(10)          null,
   kp_unit              varchar(10)          null,
   kp_memo              varchar(100)         null,
   kp_money             money                null,
   total_money          money                null,
   sale_style_id        varchar(10)          null,
   discount             decimal(16,5)        null,
   tax_class_code       varchar(50)          null default '10602010199'
)
go

/*==============================================================*/
/* Table: np_invoice_kp_item_temp                               */
/*==============================================================*/
create table np_invoice_kp_item_temp (
   guid                 varchar(32)          null,
   item_id              varchar(50)          null,
   kp_id                varchar(15)          null,
   statement_no         varchar(10)          null,
   real_money           money                null,
   kp_money             money                null,
   can_kp_money         money                null,
   sort_number          int                  null
)
go

/*==============================================================*/
/* Table: np_item_classify                                      */
/*==============================================================*/
create table np_item_classify (
   id                   int                  identity,
   fh_id                varchar(15)          null,
   cw_type              varchar(50)          null,
   proportion           decimal(16,8)        null,
   sw_money             money                null,
   fw_money             money                null,
   against_rmb_money    money                null default 0,
   constraint PK_NP_ITEM_CLASSIFY primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('np_item_classify') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'np_item_classify' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '目前只有申汇单的进货报表', 
   'user', @CurrentUser, 'table', 'np_item_classify'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_item_classify')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fh_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_item_classify', 'column', 'fh_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '申汇单内码',
   'user', @CurrentUser, 'table', 'np_item_classify', 'column', 'fh_id'
go

/*==============================================================*/
/* Table: np_pay_comfirm                                        */
/*==============================================================*/
create table np_pay_comfirm (
   id                   int                  identity,
   fh_id                varchar(15)          null,
   pay_date             datetime             null,
   o_id_input           varchar(50)          null,
   input_date           datetime             null,
   pay_money            money                null
)
go

/*==============================================================*/
/* Table: np_payment_charge                                     */
/*==============================================================*/
create table np_payment_charge (
   pc_id                varchar(15)          null,
   c_id                 varchar(10)          null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   payment_type         varchar(50)          null,
   payment_money        money                null,
   status               varchar(50)          null,
   invoice_nos          varchar(200)         null,
   memo                 varchar(200)         null,
   bank_id              int                  null,
   o_id_auditor         varchar(50)          null,
   audit_time           datetime             null,
   audit_memo           varchar(200)         null,
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   is_pay               bit                  null default 'false',
   pay_date             datetime             null,
   pay_person           varchar(50)          null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_payment_charge')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'payment_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_payment_charge', 'column', 'payment_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_payment_charge', 'column', 'payment_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_payment_charge')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_payment_charge', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-制单中
   1-待审核
   2-审核退回
   3-待支付
   4-已支付
   5-已作废',
   'user', @CurrentUser, 'table', 'np_payment_charge', 'column', 'status'
go

/*==============================================================*/
/* Table: np_receive_payment                                    */
/*==============================================================*/
create table np_receive_payment (
   rp_id                varchar(15)          null,
   company              varchar(100)         null,
   account              varchar(100)         null,
   receive_date         datetime             null,
   receive_money        money                null,
   pay_type             varchar(50)          null,
   pay_certificate      varchar(50)          null,
   surplus_money        money                null,
   summary              varchar(200)         null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null
)
go

/*==============================================================*/
/* Table: np_receive_payment_invoice                            */
/*==============================================================*/
create table np_receive_payment_invoice (
   rp_id                varchar(15)          null,
   kp_id                varchar(15)          null,
   income_id            int                  null,
   pay_id               int                  null,
   input_time           datetime             null
)
go

/*==============================================================*/
/* Table: np_sale_report                                        */
/*==============================================================*/
create table np_sale_report (
   report_id            varchar(10)          not null,
   report_description   varchar(100)         null,
   account_month        varchar(20)          null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   report_type          varchar(50)          null,
   is_filed             bit                  null default 0,
   item_memo            varchar(1000)        null,
   constraint PK_NP_SALE_REPORT primary key (report_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_sale_report')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_sale_report', 'column', 'report_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0- 代销报表
   1- 收订报表
   2- 费用报表
   3- 代理报表',
   'user', @CurrentUser, 'table', 'np_sale_report', 'column', 'report_type'
go

/*==============================================================*/
/* Table: np_statement_cw_sale_classify                         */
/*==============================================================*/
create table np_statement_cw_sale_classify (
   id                   int                  identity,
   statement_no         varchar(10)          null,
   cw_type              varchar(50)          null,
   real_money           money                null,
   total_money          money                null,
   sort_number          int                  null,
   constraint PK_NP_STATEMENT_CW_SALE_CLASSI primary key (id)
)
go

