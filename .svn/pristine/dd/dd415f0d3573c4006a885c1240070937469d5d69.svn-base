/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2022/12/2 10:57:37                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('fc_account_month')
            and   type = 'U')
   drop table fc_account_month
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_assess_unit')
            and   type = 'U')
   drop table fc_db_assess_unit
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_bank')
            and   type = 'U')
   drop table fc_db_bank
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_clients')
            and   type = 'U')
   drop table fc_db_clients
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_exchange_rate')
            and   type = 'U')
   drop table fc_db_exchange_rate
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_factory')
            and   type = 'U')
   drop table fc_db_factory
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_factory_bank')
            and   type = 'U')
   drop table fc_db_factory_bank
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_db_financial_classify')
            and   type = 'U')
   drop table fc_db_financial_classify
go

/*==============================================================*/
/* Table: fc_account_month                                      */
/*==============================================================*/
create table fc_account_month (
   month_code           varchar(50)          null,
   month_name           varchar(50)          null,
   is_close             bit                  null default 'false',
   close_memo           varchar(200)         null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_account_month')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'month_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_account_month', 'column', 'month_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '如 2017.09',
   'user', @CurrentUser, 'table', 'fc_account_month', 'column', 'month_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_account_month')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'month_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_account_month', 'column', 'month_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '如 2017年09月',
   'user', @CurrentUser, 'table', 'fc_account_month', 'column', 'month_name'
go

/*==============================================================*/
/* Table: fc_db_assess_unit                                     */
/*==============================================================*/
create table fc_db_assess_unit (
   dep_org_code         varchar(10)          null,
   unit_code            varchar(50)          null,
   unit_name            varchar(50)          null,
   is_in_use            bit                  null,
   sort_number          int                  null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('fc_db_assess_unit') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'fc_db_assess_unit' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '注意： unit_code 不要出现相同值的情况, 不同部门用前缀来区分下', 
   'user', @CurrentUser, 'table', 'fc_db_assess_unit'
go

/*==============================================================*/
/* Table: fc_db_bank                                            */
/*==============================================================*/
create table fc_db_bank (
   id                   int                  identity,
   c_id                 varchar(12)          null,
   f_companyName        varchar(100)         null,
   f_registMark         varchar(50)          null,
   f_companyAddress     varchar(500)         null,
   f_companyPhone       varchar(20)          null,
   f_bank               varchar(100)         null,
   f_account            varchar(100)         null,
   f_default            bit                  null default 'false',
   memo                 varchar(200)         null,
   my_bank              varchar(100)         null,
   my_account           varchar(100)         null,
   constraint PK_FC_DB_BANK primary key (id)
)
go

/*==============================================================*/
/* Table: fc_db_clients                                         */
/*==============================================================*/
create table fc_db_clients (
   c_id                 varchar(12)          not null,
   c_create             datetime             null,
   finance              varchar(50)          null,
   c_department         nvarchar(200)        null,
   o_id                 varchar(50)          null,
   c_charge_man         varchar(50)          null,
   a_id                 varchar(50)          null,
   p_id                 varchar(50)          null,
   city_id              varchar(50)          null,
   c_hy_id              varchar(50)          null,
   c_department_simple  varchar(200)         null,
   c_money              varchar(20)          null,
   c_law_man            varchar(20)          null,
   last_mod_date        datetime             null,
   c_discount           decimal(16,5)        null,
   custom_id            varchar(100)         null,
   c_ms_id              bit                  null default 'false',
   c_department_Foreign varchar(200)         null,
   is_valid             bit                  null,
   delete_person        varchar(50)          null,
   delete_date          datetime             null,
   advance_balance      money                null,
   agent_balance        money                null,
   org_code             varchar(10)          null,
   c_cw_type            varchar(50)          null,
   settlement_c_id      varchar(12)          null,
   unit_code            varchar(50)          null,
   constraint PK_FC_DB_CLIENTS primary key (c_id)
)
go

/*==============================================================*/
/* Table: fc_db_exchange_rate                                   */
/*==============================================================*/
create table fc_db_exchange_rate (
   currency_id          varchar(50)          null,
   currency             varchar(50)          null,
   currency_price       decimal(16,5)        null,
   update_time          datetime             null
)
go

/*==============================================================*/
/* Table: fc_db_factory                                         */
/*==============================================================*/
create table fc_db_factory (
   f_id                 varchar(12)          not null,
   f_input_date         datetime             null,
   f_country            varchar(50)          null,
   f_department         varchar(200)         null,
   f_department_simple  varchar(200)         null,
   f_account_id         varchar(50)          null,
   f_charge_man         varchar(50)          null,
   o_id_input           varchar(50)          null,
   o_id_lastmodify      varchar(50)          null,
   last_mod_date        datetime             null,
   f_website            varchar(100)         null,
   f_mem                varchar(100)         null,
   is_valid             bit                  null,
   f_account            varchar(50)          null,
   delete_person        varchar(50)          null,
   delete_date          datetime             null,
   org_code             varchar(10)          null,
   unit_code            varchar(50)          null,
   f_cw_type            varchar(50)          null,
   is_customhouse       bit                  null default 0,
   constraint PK_FC_DB_FACTORY primary key (f_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_db_factory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_customhouse')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_db_factory', 'column', 'is_customhouse'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '海关货源, 财务付款的时候可以修改申请外币实洋',
   'user', @CurrentUser, 'table', 'fc_db_factory', 'column', 'is_customhouse'
go

/*==============================================================*/
/* Table: fc_db_factory_bank                                    */
/*==============================================================*/
create table fc_db_factory_bank (
   id                   int                  identity,
   f_id                 varchar(12)          null,
   f_companyName        varchar(100)         null,
   f_companyAddress     varchar(500)         null,
   f_companyPhone       varchar(20)          null,
   f_bank               varchar(100)         null,
   f_account            varchar(100)         null,
   f_default            bit                  null default 'false',
   memo                 varchar(200)         null,
   swift_code           varchar(50)          null,
   constraint PK_FC_DB_FACTORY_BANK primary key (id)
)
go

/*==============================================================*/
/* Table: fc_db_financial_classify                              */
/*==============================================================*/
create table fc_db_financial_classify (
   dep_org_code         varchar(10)          null,
   category             varchar(50)          null,
   classfiy_code        varchar(50)          null,
   classify_name        varchar(50)          null,
   sort_number          int                  null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('fc_db_financial_classify') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'fc_db_financial_classify' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '注意： classfiy_code 不要出现相同值的情况, 不同部门用前缀来区分下', 
   'user', @CurrentUser, 'table', 'fc_db_financial_classify'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_db_financial_classify')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'category')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_db_financial_classify', 'column', 'category'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '直接写中文',
   'user', @CurrentUser, 'table', 'fc_db_financial_classify', 'column', 'category'
go

