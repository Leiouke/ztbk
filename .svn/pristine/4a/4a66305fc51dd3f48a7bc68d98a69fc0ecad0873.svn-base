/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2022/2/22 13:56:38                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('fc_sales_report')
            and   type = 'U')
   drop table fc_sales_report
go

/*==============================================================*/
/* Table: fc_sales_report                                       */
/*==============================================================*/
create table fc_sales_report (
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
   constraint PK_FC_SALES_REPORT primary key (report_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_sales_report')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_sales_report', 'column', 'report_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典, 前两个跟结算单类型对应起来的
   0-业务销售报表
   1-其他收入报表
   2-预收销售报表
   3-预收冲销报表
   ',
   'user', @CurrentUser, 'table', 'fc_sales_report', 'column', 'report_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_sales_report')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_sales_report', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-制单中
   1-已提交
   2-已退回
   3-已归档',
   'user', @CurrentUser, 'table', 'fc_sales_report', 'column', 'status'
go

