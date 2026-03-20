/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2022/3/9 16:07:12                            */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('fc_deposit_business_bids')
            and   type = 'U')
   drop table fc_deposit_business_bids
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_deposit_business_tender')
            and   type = 'U')
   drop table fc_deposit_business_tender
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_deposit_business_tender_competitor')
            and   type = 'U')
   drop table fc_deposit_business_tender_competitor
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_deposit_db_bank')
            and   type = 'U')
   drop table fc_deposit_db_bank
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_deposit_db_company')
            and   type = 'U')
   drop table fc_deposit_db_company
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_deposit_finance_fee')
            and   type = 'U')
   drop table fc_deposit_finance_fee
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_deposit_finance_fee_item')
            and   type = 'U')
   drop table fc_deposit_finance_fee_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_deposit_finance_payment_request')
            and   type = 'U')
   drop table fc_deposit_finance_payment_request
go

/*==============================================================*/
/* Table: fc_deposit_business_bids                              */
/*==============================================================*/
create table fc_deposit_business_bids (
   bd_id                varchar(12)          not null,
   c_id                 varchar(12)          null,
   bail_c_id            varchar(12)          null,
   bids_project         varchar(100)         null,
   budget               varchar(50)          null,
   deposit              money                null,
   service_period_start datetime             null,
   service_period_end   datetime             null,
   project_classify     varchar(50)          null,
   open_date            datetime             null,
   bids_document        varchar(200)         null,
   bids_document1       varchar(200)         null,
   bids_fee             money                null,
   dep_org_code         varchar(10)          null,
   salesman             varchar(50)          null,
   bids_manner          varchar(50)          null,
   reminder_date        datetime             null,
   is_reminder          bit                  null,
   status               varchar(50)          null,
   input_man            varchar(50)          null,
   input_time           datetime             null,
   modify_man           varchar(50)          null,
   modify_time          datetime             null,
   is_file              bit                  null default 0,
   constraint PK_FC_DEPOSIT_BUSINESS_BIDS primary key (bd_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_business_bids')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_classify')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_business_bids', 'column', 'project_classify'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-图书
   1-数据库',
   'user', @CurrentUser, 'table', 'fc_deposit_business_bids', 'column', 'project_classify'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_business_bids')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'bids_manner')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_business_bids', 'column', 'bids_manner'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_deposit_business_bids', 'column', 'bids_manner'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_business_bids')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_business_bids', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-未开标
   1-已中标
   2-不中标
   3-流标',
   'user', @CurrentUser, 'table', 'fc_deposit_business_bids', 'column', 'status'
go

/*==============================================================*/
/* Table: fc_deposit_business_tender                            */
/*==============================================================*/
create table fc_deposit_business_tender (
   td_id                varchar(12)          not null,
   bd_id                varchar(12)          not null,
   bids_producer        varchar(50)          null,
   quote                varchar(200)         null,
   tender_document      varchar(200)         null,
   tender_document1     varchar(200)         null,
   status               varchar(50)          null,
   is_file              bit                  null default 0,
   input_man            varchar(50)          null,
   input_time           datetime             null,
   modify_man           varchar(50)          null,
   modify_time          datetime             null,
   constraint PK_FC_DEPOSIT_BUSINESS_TENDER primary key (td_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_business_tender')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_business_tender', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-未开标
   1-已中标
   2-不中标
   3-流标',
   'user', @CurrentUser, 'table', 'fc_deposit_business_tender', 'column', 'status'
go

/*==============================================================*/
/* Table: fc_deposit_business_tender_competitor                 */
/*==============================================================*/
create table fc_deposit_business_tender_competitor (
   td_id                varchar(12)          null,
   competitor           varchar(50)          null,
   quote                varchar(200)         null,
   is_win_bidding       bit                  null,
   input_man            varchar(50)          null,
   input_time           datetime             null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_business_tender_competitor')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'competitor')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_business_tender_competitor', 'column', 'competitor'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_deposit_business_tender_competitor', 'column', 'competitor'
go

/*==============================================================*/
/* Table: fc_deposit_db_bank                                    */
/*==============================================================*/
create table fc_deposit_db_bank (
   id                   int                  identity,
   c_id                 varchar(12)          null,
   f_companyName        varchar(100)         null,
   f_registMark         varchar(50)          null,
   f_companyAddress     varchar(500)         null,
   f_companyPhone       varchar(20)          null,
   f_bank               varchar(100)         null,
   f_account            varchar(100)         null,
   f_default            bit                  null default 'false',
   constraint PK_FC_DEPOSIT_DB_BANK primary key (id)
)
go

/*==============================================================*/
/* Table: fc_deposit_db_company                                 */
/*==============================================================*/
create table fc_deposit_db_company (
   c_id                 varchar(12)          not null,
   company_type         varchar(50)          null,
   c_create             datetime             null,
   c_department         varchar(200)         null,
   o_id                 varchar(50)          null,
   c_charge_man         varchar(50)          null,
   last_mod_date        datetime             null,
   custom_id            varchar(100)         null,
   c_address            varchar(200)         null,
   contact_man          varchar(100)         null,
   contact_phone        varchar(100)         null,
   is_valid             bit                  null,
   delete_person        varchar(50)          null,
   delete_date          datetime             null,
   dep_org_code         varchar(10)          null,
   constraint PK_FC_DEPOSIT_DB_COMPANY primary key (c_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_db_company')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'company_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_db_company', 'column', 'company_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-招标单位
   1-招标代理',
   'user', @CurrentUser, 'table', 'fc_deposit_db_company', 'column', 'company_type'
go

/*==============================================================*/
/* Table: fc_deposit_finance_fee                                */
/*==============================================================*/
create table fc_deposit_finance_fee (
   fe_id                varchar(12)          not null,
   td_id                varchar(12)          not null,
   pr_id                varchar(12)          null,
   fee_type             varchar(50)          null,
   fee_money            money                null,
   invoice_no           varchar(50)          null,
   is_invoice_sign      bit                  null,
   refund_fee           money                null,
   return_reminder_date datetime             null,
   is_reminder          bit                  null,
   system_memo          varchar(200)         null,
   is_rebate            bit                  null default 0,
   input_man            varchar(50)          null,
   input_time           datetime             null,
   memo                 varchar(200)         null,
   is_process           bit                  null default 0,
   process_man          varchar(50)          null,
   process_time         datetime             null,
   process_memo         varchar(200)         null,
   payment_no           varchar(50)          null,
   main_fe_id           varchar(12)          null,
   constraint PK_FC_DEPOSIT_FINANCE_FEE primary key (fe_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_finance_fee')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fee_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_finance_fee', 'column', 'fee_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-保证金
   1-中标服务费
   2-质保金
   3-冲销金',
   'user', @CurrentUser, 'table', 'fc_deposit_finance_fee', 'column', 'fee_type'
go

/*==============================================================*/
/* Table: fc_deposit_finance_fee_item                           */
/*==============================================================*/
create table fc_deposit_finance_fee_item (
   id                   int                  identity,
   td_id                varchar(12)          not null,
   fe_id                varchar(12)          null,
   fee_type             varchar(50)          null,
   pay_type             varchar(50)          null,
   pay_fee              money                null,
   income_fee           money                null,
   memo                 varchar(200)         null,
   is_rebate            bit                  null default 0,
   rebate_fe_id         varchar(12)          null,
   input_man            varchar(50)          null,
   input_time           datetime             null,
   is_recycle           bit                  null default 0,
   recycle_fe_id        varchar(12)          null,
   constraint PK_FC_DEPOSIT_FINANCE_FEE_ITEM primary key (id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_finance_fee_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fee_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_finance_fee_item', 'column', 'fee_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-保证金
   1-中标服务费
   2-质保金
   3-冲销金',
   'user', @CurrentUser, 'table', 'fc_deposit_finance_fee_item', 'column', 'fee_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_finance_fee_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'pay_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_finance_fee_item', 'column', 'pay_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-支出
   1-收入',
   'user', @CurrentUser, 'table', 'fc_deposit_finance_fee_item', 'column', 'pay_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_finance_fee_item')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'memo')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_finance_fee_item', 'column', 'memo'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '有可能收入金额是折扣掉保证金的',
   'user', @CurrentUser, 'table', 'fc_deposit_finance_fee_item', 'column', 'memo'
go

/*==============================================================*/
/* Table: fc_deposit_finance_payment_request                    */
/*==============================================================*/
create table fc_deposit_finance_payment_request (
   pr_id                varchar(12)          not null,
   td_id                varchar(12)          not null,
   fee_type             varchar(50)          null,
   is_rebate            bit                  null default 0,
   invoice_no           varchar(100)         null,
   f_bank               varchar(100)         null,
   f_account            varchar(100)         null,
   payment_fee          money                null,
   apply_man            varchar(50)          null,
   apply_dep_org_code   varchar(10)          null,
   apply_time           datetime             null,
   flow_id              int                  null,
   approval_result      varchar(50)          null,
   memo                 varchar(200)         null,
   fe_id                varchar(12)          null,
   constraint PK_FC_DEPOSIT_FINANCE_PAYMENT_ primary key (pr_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_finance_payment_request')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fee_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_finance_payment_request', 'column', 'fee_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-保证金
   1-中标服务费
   2-质保金
   3-冲销金',
   'user', @CurrentUser, 'table', 'fc_deposit_finance_payment_request', 'column', 'fee_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_deposit_finance_payment_request')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'approval_result')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_deposit_finance_payment_request', 'column', 'approval_result'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0- 未提交
   1- 审批中
   2- 已通过
   3- 未通过',
   'user', @CurrentUser, 'table', 'fc_deposit_finance_payment_request', 'column', 'approval_result'
go

