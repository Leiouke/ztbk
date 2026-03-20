/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2020/6/1 10:16:21                            */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('it_backup_project')
            and   type = 'U')
   drop table it_backup_project
go

if exists (select 1
            from  sysobjects
           where  id = object_id('it_backup_project_log')
            and   type = 'U')
   drop table it_backup_project_log
go

/*==============================================================*/
/* Table: it_backup_project                                     */
/*==============================================================*/
create table it_backup_project (
   p_id                 varchar(10)          not null,
   project_name         varchar(50)          null,
   f_operate_id         varchar(50)          null,
   f_operate_time       datetime             null,
   verify_id            varchar(50)          null,
   verify_time          datetime             null,
   final_operate_id     varchar(50)          null,
   is_final             bit                  null default 0,
   final_operate_time   datetime             null,
   project_type         varchar(50)          null,
   location             varchar(100)         null,
   is_valid             bit                  null default 1,
   constraint PK_IT_BACKUP_PROJECT primary key (p_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_backup_project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_backup_project', 'column', 'project_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-程序源代码
   1-系统数据库
   2-系统配置文件',
   'user', @CurrentUser, 'table', 'it_backup_project', 'column', 'project_type'
go

/*==============================================================*/
/* Table: it_backup_project_log                                 */
/*==============================================================*/
create table it_backup_project_log (
   p_id                 varchar(10)          not null,
   operate_time         datetime             null,
   operate_id           varchar(50)          null,
   operate_type         varchar(50)          null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('it_backup_project_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'operate_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'it_backup_project_log', 'column', 'operate_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0-一级备份
   1-校验
   2-最终备份',
   'user', @CurrentUser, 'table', 'it_backup_project_log', 'column', 'operate_type'
go

