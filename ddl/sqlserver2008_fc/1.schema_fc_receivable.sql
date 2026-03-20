/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2022/11/1 8:54:19                            */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_advance')
            and   type = 'U')
   drop table fc_receivable_advance
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_advance_item')
            and   type = 'U')
   drop table fc_receivable_advance_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_advance_item_temp')
            and   type = 'U')
   drop table fc_receivable_advance_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_invoice_kp')
            and   type = 'U')
   drop table fc_receivable_invoice_kp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_kp_item')
            and   type = 'U')
   drop table fc_receivable_kp_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_kp_item_content')
            and   type = 'U')
   drop table fc_receivable_kp_item_content
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_kp_item_temp')
            and   type = 'U')
   drop table fc_receivable_kp_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_statement')
            and   type = 'U')
   drop table fc_receivable_statement
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_statement_item')
            and   type = 'U')
   drop table fc_receivable_statement_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_statement_item_temp')
            and   type = 'U')
   drop table fc_receivable_statement_item_temp
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_receivable_statement_to_invoice_temp')
            and   type = 'U')
   drop table fc_receivable_statement_to_invoice_temp
go

/*==============================================================*/
/* Table: fc_receivable_advance                                 */
/*==============================================================*/
create table fc_receivable_advance (
   ra_id                varchar(12)          not null,
   c_id                 varchar(12)          null,
   currency             varchar(50)          null,
   c_real_money         money                null,
   real_money           money                null,
   kp_money             money                null,
   input_code           varchar(50)          null,
   input_time           datetime             null,
   sales_code           varchar(50)          null,
   memo                 varchar(200)         null,
   org_code             varchar(10)          null,
   is_destroy           bit                  null default 0,
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   unit_code            varchar(50)          null,
   constraint PK_FC_RECEIVABLE_ADVANCE primary key (ra_id)
)
go

/*==============================================================*/
/* Table: fc_receivable_advance_item                            */
/*==============================================================*/
create table fc_receivable_advance_item (
   inc_no               int                  identity,
   ra_id                varchar(12)          null,
   rs_id                varchar(12)          null,
   against_real_money   money                null,
   constraint PK_FC_RECEIVABLE_ADVANCE_ITEM primary key (inc_no)
)
go

/*==============================================================*/
/* Table: fc_receivable_advance_item_temp                       */
/*==============================================================*/
create table fc_receivable_advance_item_temp (
   guid                 varchar(32)          null,
   inc_no               int                  identity,
   ra_id                varchar(12)          null,
   rs_id                varchar(12)          null,
   against_real_money   money                null,
   can_against_real_money money                null,
   constraint PK_FC_RECEIVABLE_ADVANCE_ITEM_ primary key (inc_no)
)
go

/*==============================================================*/
/* Table: fc_receivable_invoice_kp                              */
/*==============================================================*/
create table fc_receivable_invoice_kp (
   kp_id                varchar(12)          null,
   kp_no                varchar(100)         null,
   c_id                 varchar(12)          null,
   fc_kp_form           varchar(50)          null,
   fc_kp_family         varchar(50)          null default '0',
   fc_tax_rate          varchar(50)          null,
   tax_money            money                null,
   receive_money        money                null default 0,
   kp_date              datetime             null,
   o_id_kp              varchar(50)          null,
   memo                 varchar(200)         null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   o_id_receiver        varchar(50)          null,
   is_destroy           bit                  null default 'false',
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   status               varchar(50)          null,
   is_claim_kp          bit                  null default 0,
   is_commit_claim      bit                  null default 0,
   bank_id              int                  null,
   fc_kp_type           varchar(50)          null,
   org_code             varchar(10)          null,
   kp_cw_type           varchar(50)          null,
   unit_code            varchar(50)          null,
   is_account           bit                  null default 0,
   account_time         datetime             null,
   account_month        varchar(20)          null,
   account_person       varchar(50)          null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_receivable_invoice_kp')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_kp_form')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'fc_kp_form'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-普通发票
   1-增值税发票',
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'fc_kp_form'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_receivable_invoice_kp')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_kp_family')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'fc_kp_family'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-一般发票
   1-形式发票',
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'fc_kp_family'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_receivable_invoice_kp')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_tax_rate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'fc_tax_rate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'fc_tax_rate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_receivable_invoice_kp')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典项目
   0 - 开票中
   1 - 已开票
   2 - 已收款 ',
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_receivable_invoice_kp')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_kp_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'fc_kp_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-应收发票
   1-预收发票',
   'user', @CurrentUser, 'table', 'fc_receivable_invoice_kp', 'column', 'fc_kp_type'
go

/*==============================================================*/
/* Table: fc_receivable_kp_item                                 */
/*==============================================================*/
create table fc_receivable_kp_item (
   inc_no               int                  identity,
   kp_id                varchar(12)          null,
   statement_id         varchar(12)          null,
   kp_money             money                null
)
go

/*==============================================================*/
/* Table: fc_receivable_kp_item_content                         */
/*==============================================================*/
create table fc_receivable_kp_item_content (
   id                   int                  identity,
   kp_id                varchar(12)          null,
   kp_content           varchar(200)         null,
   kp_amount            varchar(10)          null,
   kp_unit              varchar(10)          null,
   kp_memo              varchar(100)         null,
   kp_specs             varchar(50)          null,
   kp_money             money                null,
   total_money          money                null,
   discount             decimal(16,5)        null,
   fc_tax_class_code    varchar(50)          null default '10602010199'
)
go

/*==============================================================*/
/* Table: fc_receivable_kp_item_temp                            */
/*==============================================================*/
create table fc_receivable_kp_item_temp (
   inc_no               int                  identity,
   guid                 varchar(32)          null,
   kp_id                varchar(12)          null,
   statement_id         varchar(12)          null,
   kp_money             money                null,
   can_kp_money         money                null
)
go

/*==============================================================*/
/* Table: fc_receivable_statement                               */
/*==============================================================*/
create table fc_receivable_statement (
   rs_id                varchar(12)          not null,
   custom_f_id          varchar(12)          null,
   custom_s_id          varchar(12)          null,
   source_no            varchar(50)          null,
   rs_type              varchar(50)          null,
   currency             varchar(50)          null,
   c_real_money         money                null,
   total_money          money                null,
   real_money           money                null,
   total_money_backup   money                null,
   real_money_backup    money                null,
   kp_money             money                null,
   against_money        money                null default 0,
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
   export_invoice_no    varchar(50)          null,
   constraint PK_FC_RECEIVABLE_STATEMENT primary key (rs_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_receivable_statement')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'rs_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_receivable_statement', 'column', 'rs_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-普通结算单
   1-其他结算单',
   'user', @CurrentUser, 'table', 'fc_receivable_statement', 'column', 'rs_type'
go

/*==============================================================*/
/* Table: fc_receivable_statement_item                          */
/*==============================================================*/
create table fc_receivable_statement_item (
   inc_no               int                  identity,
   rs_id                varchar(12)          null,
   rs_cw_type           varchar(50)          null,
   c_real_money         money                null,
   total_money          money                null,
   real_money           money                null,
   constraint PK_FC_RECEIVABLE_STATEMENT_ITE primary key (inc_no)
)
go

/*==============================================================*/
/* Table: fc_receivable_statement_item_temp                     */
/*==============================================================*/
create table fc_receivable_statement_item_temp (
   guid                 varchar(32)          null,
   inc_no               int                  identity,
   rs_id                varchar(12)          null,
   rs_cw_type           varchar(50)          null,
   c_real_money         money                null,
   total_money          money                null,
   real_money           money                null
)
go

/*==============================================================*/
/* Table: fc_receivable_statement_to_invoice_temp               */
/*==============================================================*/
create table fc_receivable_statement_to_invoice_temp (
   guid                 varchar(32)          null,
   inc_no               int                  identity,
   kp_money             money                null,
   kp_content           varchar(200)         null,
   kp_amount            varchar(10)          null,
   kp_unit              varchar(10)          null,
   kp_memo              varchar(100)         null,
   fc_tax_class_code    varchar(50)          null,
   constraint PK_FC_RECEIVABLE_STATEMENT_TO_ primary key (inc_no)
)
go

