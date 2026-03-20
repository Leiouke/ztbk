/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2022/2/23 9:51:19                            */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('np_db_bank')
            and   type = 'U')
   drop table np_db_bank
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_db_clients')
            and   type = 'U')
   drop table np_db_clients
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_db_contact')
            and   type = 'U')
   drop table np_db_contact
go

if exists (select 1
            from  sysobjects
           where  id = object_id('np_db_factory')
            and   type = 'U')
   drop table np_db_factory
go

/*==============================================================*/
/* Table: np_db_bank                                            */
/*==============================================================*/
create table np_db_bank (
   id                   int                  identity,
   f_id                 varchar(10)          null,
   f_companyName        varchar(100)         null,
   f_registMark         varchar(50)          null,
   f_companyAddress     varchar(500)         null,
   f_companyPhone       varchar(20)          null,
   f_payment            varchar(50)          null,
   f_bank               varchar(100)         null,
   f_account            varchar(100)         null,
   swift_code           varchar(50)          null,
   iban                 varchar(50)          null,
   aba                  varchar(50)          null,
   address_category     varchar(50)          null,
   f_default            bit                  null default 'false',
   f_bankAddress        varchar(500)         null,
   f_bankPhone          varchar(50)          null,
   memo                 varchar(200)         null,
   my_bank              varchar(100)         null,
   my_account           varchar(100)         null,
   kp_type              varchar(50)          null default '0',
   tax_rate             decimal(16,5)        null default 0,
   is_item              bit                  null default 0,
   kp_content           varchar(50)          null,
   kp_amount            varchar(10)          null,
   kp_unit              varchar(10)          null,
   constraint PK_NP_DB_BANK primary key (id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_db_bank')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'kp_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_db_bank', 'column', 'kp_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_db_bank', 'column', 'kp_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_db_bank')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'tax_rate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_db_bank', 'column', 'tax_rate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'np_db_bank', 'column', 'tax_rate'
go

/*==============================================================*/
/* Table: np_db_clients                                         */
/*==============================================================*/
create table np_db_clients (
   c_id                 varchar(10)          not null,
   cc_id                varchar(50)          null,
   c_create             datetime             null,
   finance              varchar(50)          null,
   c_department         varchar(200)         null,
   c_level              varchar(50)          null,
   o_id                 varchar(50)          null,
   cm_id                varchar(50)          null,
   c_mem                varchar(200)         null,
   c_charge_man         varchar(50)          null,
   attribute            varchar(50)          null,
   a_id                 varchar(50)          null,
   p_id                 varchar(50)          null,
   city_id              varchar(50)          null,
   c_hy_id              varchar(50)          null,
   c_department_simple  varchar(200)         null,
   c_money              varchar(20)          null,
   c_law_man            varchar(20)          null,
   last_mod_date        datetime             null,
   limit_money          int                  null,
   limit_day            int                  null,
   c_discount           decimal(16,5)        null,
   c_back               decimal(16,5)        null,
   back_limit_date      int                  null,
   parent_client        varchar(10)          null,
   custom_id            varchar(100)         null,
   c_ms_id              bit                  null default 'false',
   is_print             bit                  null default 'false',
   c_department_Foreign varchar(200)         null,
   boundary             decimal(16,5)        null,
   decimal_place        int                  null default 2,
   is_print_h_price     bit                  null default 0,
   is_local_rate        bit                  null default 'false',
   profit_rate          decimal(16,5)        null,
   c_verify_style       varchar(50)          null,
   c_area_id            varchar(50)          null,
   zs_type              varchar(50)          null,
   is_valid             bit                  null,
   delete_person        varchar(50)          null,
   delete_date          datetime             null,
   rack_no              varchar(50)          null,
   advance_balance      money                null,
   subpackage_form      varchar(50)          null default '1',
   label_form           varchar(50)          null default '1',
   agent_balance        money                null,
   constraint PK_NP_DB_CLIENTS primary key (c_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_db_clients')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'attribute')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_db_clients', 'column', 'attribute'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书|新技术',
   'user', @CurrentUser, 'table', 'np_db_clients', 'column', 'attribute'
go

/*==============================================================*/
/* Table: np_db_contact                                         */
/*==============================================================*/
create table np_db_contact (
   id                   int                  identity,
   f_id                 varchar(10)          null,
   f_contact_category   varchar(50)          null,
   f_contact_man        varchar(120)         null,
   f_country            varchar(50)          null,
   f_address            varchar(200)         null,
   f_zip                varchar(20)          null,
   f_tel                varchar(40)          null,
   f_mobile             varchar(20)          null,
   f_email              varchar(60)          null,
   f_QQ                 varchar(20)          null,
   f_weixin             varchar(20)          null,
   f_contact_mem        varchar(100)         null,
   f_status             bit                  null default 'false',
   constraint PK_NP_DB_CONTACT primary key (id)
)
go

/*==============================================================*/
/* Table: np_db_factory                                         */
/*==============================================================*/
create table np_db_factory (
   f_id                 varchar(10)          not null,
   fc_id                varchar(50)          null,
   f_input_date         datetime             null,
   f_country            varchar(50)          null,
   f_department         varchar(200)         null,
   f_department_simple  varchar(200)         null,
   f_account_id         varchar(50)          null,
   limit_money          int                  null,
   limit_day            int                  null,
   f_discount           decimal(16,5)        null,
   f_charge_man         varchar(50)          null,
   back_limit_date      int                  null,
   o_id_input           varchar(50)          null,
   o_id_lastmodify      varchar(50)          null,
   last_mod_date        datetime             null,
   f_level              varchar(50)          null,
   f_back               decimal(16,5)        null,
   f_website            varchar(100)         null,
   f_mem                varchar(100)         null,
   f_type               varchar(50)          null,
   f_id_belong          varchar(10)          null,
   is_valid             bit                  null,
   f_sxxe               varchar(50)          null,
   f_myaccount          varchar(50)          null,
   f_account            varchar(50)          null,
   edi                  varchar(50)          null,
   is_need_against      bit                  null default 0,
   delete_person        varchar(50)          null,
   delete_date          datetime             null,
   status               varchar(50)          null,
   o_id_first_auditor   varchar(50)          null,
   o_id_second_auditor  varchar(50)          null,
   first_audit_time     datetime             null,
   second_audit_time    datetime             null,
   audit_memo           varchar(200)         null,
   constraint PK_NP_DB_FACTORY primary key (f_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_db_factory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fc_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_db_factory', 'column', 'fc_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0001-供应商
   0002-集货商',
   'user', @CurrentUser, 'table', 'np_db_factory', 'column', 'fc_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_db_factory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'f_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_db_factory', 'column', 'f_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书|数据库',
   'user', @CurrentUser, 'table', 'np_db_factory', 'column', 'f_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('np_db_factory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'np_db_factory', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-待一级审核
   1-待二级审核
   2-审核退回
   3-审核通过',
   'user', @CurrentUser, 'table', 'np_db_factory', 'column', 'status'
go

