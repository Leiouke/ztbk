/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2023/2/16 9:40:26                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_dictionary') and o.name = 'FK_Reference_dir_dic')
alter table it_system_dictionary
   drop constraint FK_Reference_dir_dic
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_menu') and o.name = 'FK_Reference_men_men')
alter table it_system_menu
   drop constraint FK_Reference_men_men
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_receiver') and o.name = 'FK_Reference_not_rec')
alter table it_system_receiver
   drop constraint FK_Reference_not_rec
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_rolemenu') and o.name = 'FK_Reference_men_rol')
alter table it_system_rolemenu
   drop constraint FK_Reference_men_rol
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_rolemenu') and o.name = 'FK_Reference_rol_rol')
alter table it_system_rolemenu
   drop constraint FK_Reference_rol_rol
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_usermenu') and o.name = 'FK_Reference_men_use')
alter table it_system_usermenu
   drop constraint FK_Reference_men_use
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_usermenu') and o.name = 'FK_Reference_use_men')
alter table it_system_usermenu
   drop constraint FK_Reference_use_men
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_userrole') and o.name = 'FK_Reference_rol_use')
alter table it_system_userrole
   drop constraint FK_Reference_rol_use
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('it_system_userrole') and o.name = 'FK_Reference_use_use')
alter table it_system_userrole
   drop constraint FK_Reference_use_use
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_dept')
            and   type = 'U')
   drop table it_system_dept
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_dicdirectory')
            and   type = 'U')
   drop table it_system_dicdirectory
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_dictionary')
            and   type = 'U')
   drop table it_system_dictionary
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_help')
            and   type = 'U')
   drop table it_system_help
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_log')
            and   type = 'U')
   drop table it_system_log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_menu')
            and   type = 'U')
   drop table it_system_menu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_notice')
            and   type = 'U')
   drop table it_system_notice
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_printconfig')
            and   type = 'U')
   drop table it_system_printconfig
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_receiver')
            and   type = 'U')
   drop table it_system_receiver
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_role')
            and   type = 'U')
   drop table it_system_role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_rolemenu')
            and   type = 'U')
   drop table it_system_rolemenu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_subsystem')
            and   type = 'U')
   drop table it_system_subsystem
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_subsystemmenu')
            and   type = 'U')
   drop table it_system_subsystemmenu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_user')
            and   type = 'U')
   drop table it_system_user
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_usermenu')
            and   type = 'U')
   drop table it_system_usermenu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_system_userrole')
            and   type = 'U')
   drop table it_system_userrole
go

/*==============================================================*/
/* Table: it_system_dept                                        */
/*==============================================================*/
create table it_system_dept (
   id                   int                  identity,
   org_code             varchar(10)          null,
   org_name             varchar(50)          null,
   org_head             varchar(50)          null,
   org_type             varchar(50)          null,
   parent_code          varchar(10)          null,
   charge_job_no        varchar(10)          null,
   finance_job_no       varchar(100)         null,
   sort_number          int                  null,
   is_valid             bit                  null default 1,
   constraint PK_IT_SYSTEM_DEPT primary key (id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'org_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_dept', 'column', 'org_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统自动产生增量值',
   'user', @CurrentUser, 'table', 'it_system_dept', 'column', 'org_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'org_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_dept', 'column', 'org_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典值
   0-部门
   1-科室
   2-班组',
   'user', @CurrentUser, 'table', 'it_system_dept', 'column', 'org_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'finance_job_no')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_dept', 'column', 'finance_job_no'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '可以有多个用逗号隔开',
   'user', @CurrentUser, 'table', 'it_system_dept', 'column', 'finance_job_no'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort_number')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_dept', 'column', 'sort_number'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '规则：四位数 比如总经理室 1000 
   总经办 1100
   总经办-报关科 1110',
   'user', @CurrentUser, 'table', 'it_system_dept', 'column', 'sort_number'
go

/*==============================================================*/
/* Table: it_system_dicdirectory                                */
/*==============================================================*/
create table it_system_dicdirectory (
   ID                   int                  identity,
   code                 varchar(50)          null,
   name                 varchar(50)          null,
   constraint PK_IT_SYSTEM_DICDIRECTORY primary key (ID)
)
go

/*==============================================================*/
/* Index: codeUnique                                            */
/*==============================================================*/
create unique index codeUnique on it_system_dicdirectory (
code ASC
)
go

/*==============================================================*/
/* Table: it_system_dictionary                                  */
/*==============================================================*/
create table it_system_dictionary (
   ID                   int                  identity,
   code                 varchar(50)          null,
   name                 varchar(50)          null,
   sortNo               int                  null,
   status               bit                  null,
   remark               text                 null,
   directoryId          int                  not null,
   d_code               varchar(50)          null,
   constraint PK_IT_SYSTEM_DICTIONARY primary key (ID)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_dictionary')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_dictionary', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-- 启用
   0- 不启用',
   'user', @CurrentUser, 'table', 'it_system_dictionary', 'column', 'status'
go

/*==============================================================*/
/* Table: it_system_help                                        */
/*==============================================================*/
create table it_system_help (
   jsp_address          varchar(255)         null,
   help_content         varchar(2000)        null
)
go

/*==============================================================*/
/* Table: it_system_log                                         */
/*==============================================================*/
create table it_system_log (
   ID                   int                  identity,
   userAccount          varchar(50)          null,
   context              text                 null,
   logTime              datetime             null,
   constraint PK_IT_SYSTEM_LOG primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Table: it_system_menu                                        */
/*==============================================================*/
create table it_system_menu (
   ID                   int                  identity,
   name                 varchar(50)          null,
   url                  varchar(100)         null,
   sortNo               int                  null,
   icon                 varchar(20)          null,
   pID                  int                  null,
   subsystemId          int                  null,
   constraint PK_IT_SYSTEM_MENU primary key nonclustered (ID)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'subsystemId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_menu', 'column', 'subsystemId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '只有第一层菜单才需要设定子系统',
   'user', @CurrentUser, 'table', 'it_system_menu', 'column', 'subsystemId'
go

/*==============================================================*/
/* Table: it_system_notice                                      */
/*==============================================================*/
create table it_system_notice (
   ID                   int                  identity,
   title                varchar(200)         null,
   content              text                 null,
   sender               varchar(50)          null,
   sender_name          varchar(50)          null,
   sendTime             datetime             null,
   messageType          varchar(20)          null,
   constraint PK_IT_SYSTEM_NOTICE primary key (ID)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_notice')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sender')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_notice', 'column', 'sender'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发送人account',
   'user', @CurrentUser, 'table', 'it_system_notice', 'column', 'sender'
go

/*==============================================================*/
/* Table: it_system_printconfig                                 */
/*==============================================================*/
create table it_system_printconfig (
   ID                   int                  identity,
   account              varchar(50)          null,
   printerName          varchar(100)         null,
   printType            varchar(20)          null,
   memo                 varchar(200)         null,
   constraint PK_IT_SYSTEM_PRINTCONFIG primary key (ID)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_printconfig')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'printType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_printconfig', 'column', 'printType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   A4
   A5',
   'user', @CurrentUser, 'table', 'it_system_printconfig', 'column', 'printType'
go

/*==============================================================*/
/* Table: it_system_receiver                                    */
/*==============================================================*/
create table it_system_receiver (
   ID                   int                  identity,
   noticeId             int                  not null,
   account              varchar(50)          null,
   constraint PK_IT_SYSTEM_RECEIVER primary key (ID)
)
go

/*==============================================================*/
/* Table: it_system_role                                        */
/*==============================================================*/
create table it_system_role (
   ID                   int                  identity,
   name                 varchar(50)          null,
   defaultSubsystem     int                  null,
   constraint PK_IT_SYSTEM_ROLE primary key nonclustered (ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('it_system_role') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'it_system_role' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '这个角色仅仅用于菜单分配', 
   'user', @CurrentUser, 'table', 'it_system_role'
go

/*==============================================================*/
/* Table: it_system_rolemenu                                    */
/*==============================================================*/
create table it_system_rolemenu (
   ID                   int                  identity,
   roleId               int                  not null,
   menuId               int                  not null,
   constraint PK_IT_SYSTEM_ROLEMENU primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Table: it_system_subsystem                                   */
/*==============================================================*/
create table it_system_subsystem (
   ID                   int                  identity,
   name                 varchar(50)          null,
   sortNo               int                  null,
   constraint PK_IT_SYSTEM_SUBSYSTEM primary key (ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('it_system_subsystem') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'it_system_subsystem' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '1个菜单只对应1个子系统', 
   'user', @CurrentUser, 'table', 'it_system_subsystem'
go

/*==============================================================*/
/* Table: it_system_subsystemmenu                               */
/*==============================================================*/
create table it_system_subsystemmenu (
   ID                   int                  identity,
   subsystemId          int                  null,
   menuId               int                  null,
   constraint PK_IT_SYSTEM_SUBSYSTEMMENU primary key (ID)
)
go

/*==============================================================*/
/* Table: it_system_user                                        */
/*==============================================================*/
create table it_system_user (
   ID                   int                  identity,
   account              varchar(50)          null,
   password             varchar(50)          null,
   password_modify_time datetime             null,
   job_no               varchar(10)          null,
   userName             varchar(50)          null,
   sex                  bit                  null,
   mobile               varchar(50)          null,
   address              varchar(50)          null,
   email                varchar(50)          null,
   qq                   varchar(50)          null,
   msn                  varchar(50)          null,
   status               bit                  null,
   registerDate         datetime             null,
   modifyDate           datetime             null,
   loginDate            datetime             null,
   logoutDate           datetime             null,
   isManager            bit                  null,
   remark               varchar(50)          null,
   portrait             varchar(255)         null,
   yh_user_id           varchar(50)          null,
   constraint PK_IT_SYSTEM_USER primary key nonclustered (ID)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sex')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_user', 'column', 'sex'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0--男
   1--女',
   'user', @CurrentUser, 'table', 'it_system_user', 'column', 'sex'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_system_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_system_user', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0--有效
   1--无效',
   'user', @CurrentUser, 'table', 'it_system_user', 'column', 'status'
go

/*==============================================================*/
/* Index: uniqueAccount                                         */
/*==============================================================*/
create unique index uniqueAccount on it_system_user (
account ASC
)
go

/*==============================================================*/
/* Table: it_system_usermenu                                    */
/*==============================================================*/
create table it_system_usermenu (
   ID                   int                  identity,
   account              varchar(50)          not null,
   menuId               int                  not null,
   constraint PK_IT_SYSTEM_USERMENU primary key (ID)
)
go

/*==============================================================*/
/* Table: it_system_userrole                                    */
/*==============================================================*/
create table it_system_userrole (
   ID                   int                  identity,
   account              varchar(50)          not null,
   roleId               int                  not null,
   org_code             varchar(10)          null,
   dep_org_code         varchar(10)          null,
   office_org_code      varchar(10)          null,
   group_org_code       varchar(10)          null,
   approve_role         varchar(50)          null,
   is_default           bit                  null,
   constraint PK_IT_SYSTEM_USERROLE primary key nonclustered (ID)
)
go

alter table it_system_dictionary
   add constraint FK_Reference_dir_dic foreign key (directoryId)
      references it_system_dicdirectory (ID)
go

alter table it_system_menu
   add constraint FK_Reference_men_men foreign key (pID)
      references it_system_menu (ID)
go

alter table it_system_receiver
   add constraint FK_Reference_not_rec foreign key (noticeId)
      references it_system_notice (ID)
         on delete cascade
go

alter table it_system_rolemenu
   add constraint FK_Reference_men_rol foreign key (menuId)
      references it_system_menu (ID)
         on delete cascade
go

alter table it_system_rolemenu
   add constraint FK_Reference_rol_rol foreign key (roleId)
      references it_system_role (ID)
         on delete cascade
go

alter table it_system_usermenu
   add constraint FK_Reference_men_use foreign key (menuId)
      references it_system_menu (ID)
         on delete cascade
go

alter table it_system_usermenu
   add constraint FK_Reference_use_men foreign key (account)
      references it_system_user (account)
         on delete cascade
go

alter table it_system_userrole
   add constraint FK_Reference_rol_use foreign key (roleId)
      references it_system_role (ID)
         on delete cascade
go

alter table it_system_userrole
   add constraint FK_Reference_use_use foreign key (account)
      references it_system_user (account)
         on delete cascade
go

