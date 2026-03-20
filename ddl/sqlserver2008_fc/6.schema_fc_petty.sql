/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2022/2/15 14:51:27                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('fc_petty_cash')
            and   type = 'U')
   drop table fc_petty_cash
go

/*==============================================================*/
/* Table: fc_petty_cash                                         */
/*==============================================================*/
create table fc_petty_cash (
   pc_id                varchar(12)          null,
   o_id_input           varchar(50)          null,
   input_time           datetime             null,
   apply_money          money                null,
   status               varchar(50)          null,
   memo                 varchar(200)         null,
   is_destroy           bit                  null default 0,
   o_id_destroy         varchar(50)          null,
   destroy_time         datetime             null,
   org_code             varchar(10)          null,
   flow_id              int                  null,
   approval_result      varchar(50)          null,
   o_id_claim           varchar(50)          null,
   claim_confirm_time   datetime             null,
   claim_time           datetime             null,
   o_id_repay           varchar(50)          null,
   repay_confirm_time   datetime             null,
   repay_time           datetime             null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_petty_cash')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_petty_cash', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0-制单中
   1-审批中
   2-审批不过
   3-待领款
   4-待还款
   5-已还款',
   'user', @CurrentUser, 'table', 'fc_petty_cash', 'column', 'status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('fc_petty_cash')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'approval_result')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'fc_petty_cash', 'column', 'approval_result'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字典
   0- 未提交
   1- 审批中
   2- 已通过
   3- 未通过',
   'user', @CurrentUser, 'table', 'fc_petty_cash', 'column', 'approval_result'
go

