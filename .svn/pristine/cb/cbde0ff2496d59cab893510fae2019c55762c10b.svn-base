/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2021/12/31 11:07:57                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('fc_process_approval_detail')
            and   type = 'U')
   drop table fc_process_approval_detail
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_process_approval_staff')
            and   type = 'U')
   drop table fc_process_approval_staff
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_process_flow')
            and   type = 'U')
   drop table fc_process_flow
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_process_flow_link')
            and   type = 'U')
   drop table fc_process_flow_link
go

if exists (select 1
            from  sysobjects
           where  id = object_id('fc_process_flow_node')
            and   type = 'U')
   drop table fc_process_flow_node
go

/*==============================================================*/
/* Table: fc_process_approval_detail                            */
/*==============================================================*/
create table fc_process_approval_detail (
   id                   int                  identity,
   bill_code            varchar(12)          null,
   flow_id              int                  null,
   bill_type            varchar(50)          null,
   auditor              varchar(10)          null,
   audit_time           datetime             null,
   audit_status         varchar(50)          null,
   audit_memo           varchar(200)         null,
   node_no              int                  null,
   is_current           bit                  null default 1,
   constraint PK_FC_PROCESS_APPROVAL_DETAIL primary key (id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_process_approval_detail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'bill_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_process_approval_detail', 'column', 'bill_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0 - 招聘需求
   1 - 面试结果
   ...',
   'user', @CurrentUser, 'table', 'fc_process_approval_detail', 'column', 'bill_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_process_approval_detail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'audit_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_process_approval_detail', 'column', 'audit_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0- 通过
   1- 未通过',
   'user', @CurrentUser, 'table', 'fc_process_approval_detail', 'column', 'audit_status'
go

/*==============================================================*/
/* Table: fc_process_approval_staff                             */
/*==============================================================*/
create table fc_process_approval_staff (
   id                   int                  identity,
   bill_code            varchar(12)          null,
   flow_id              int                  null,
   bill_type            varchar(50)          null,
   node_no              int                  null,
   next_node_no         int                  null,
   account              varchar(10)          null,
   is_current           bit                  null default 1,
   constraint PK_FC_PROCESS_APPROVAL_STAFF primary key (id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_process_approval_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'bill_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_process_approval_staff', 'column', 'bill_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0 - 招聘需求
   1 - 面试结果
   ...',
   'user', @CurrentUser, 'table', 'fc_process_approval_staff', 'column', 'bill_type'
go

/*==============================================================*/
/* Table: fc_process_flow                                       */
/*==============================================================*/
create table fc_process_flow (
   id                   int                  identity,
   flow_name            varchar(50)          null,
   flow_description     varchar(100)         null,
   bill_type            varchar(50)          null,
   constraint PK_FC_PROCESS_FLOW primary key (id)
)
go

/*==============================================================*/
/* Table: fc_process_flow_link                                  */
/*==============================================================*/
create table fc_process_flow_link (
   id                   int                  identity,
   flow_id              int                  null,
   link_name            varchar(50)          null,
   previous_node_no     int                  null,
   next_node_no         int                  null,
   constraint PK_FC_PROCESS_FLOW_LINK primary key (id)
)
go

/*==============================================================*/
/* Table: fc_process_flow_node                                  */
/*==============================================================*/
create table fc_process_flow_node (
   id                   int                  identity,
   flow_id              int                  null,
   node_no              int                  null,
   node_name            varchar(50)          null,
   role_id              int                  null,
   constraint PK_FC_PROCESS_FLOW_NODE primary key (id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_process_flow_node')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'node_no')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_process_flow_node', 'column', 'node_no'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '由用户提供, 需要保证一个流程里面节点序号不重复',
   'user', @CurrentUser, 'table', 'fc_process_flow_node', 'column', 'node_no'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_process_flow_node')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'role_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_process_flow_node', 'column', 'role_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典',
   'user', @CurrentUser, 'table', 'fc_process_flow_node', 'column', 'role_id'
go

