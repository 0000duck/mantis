
--新建个数字序列，所有id为number的都取这个序列；
create sequence PHM_SEQ
minvalue 100000
maxvalue 9999999999
start with 100001
increment by 1
cache 20;

--1、机器表
create table IPHM_MACHINE
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  MACHINE_NAME   VARCHAR2(64),
  MACHINE_TYPE   CHAR(2)       not null,
  ADDRESS        VARCHAR2(256),
  REMARK         VARCHAR2(256)
);

comment on table IPHM_MACHINE is '机器表';
comment on column IPHM_MACHINE.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_MACHINE.MACHINE_SN is '机台编号';
comment on column IPHM_MACHINE.MACHINE_NAME is '机器名称';
comment on column IPHM_MACHINE.MACHINE_TYPE is '机器型号：BU/BS/BM/BE/BH';
comment on column IPHM_MACHINE.ADDRESS is '地址';
comment on column IPHM_MACHINE.REMARK is '备注';

create unique index PK_IPHM_MACHINE_ID on IPHM_MACHINE (ID);
create index IDX_IPHM_MACHINE_SN on IPHM_MACHINE (MACHINE_SN);


--2、机器状态信息表
create table IPHM_MACHINE_STATE
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  INTIME         DATE default sysdate,
  JSON_DATA      CLOB          not null
);

comment on table IPHM_MACHINE_STATE is '机器状态信息表';
comment on column IPHM_MACHINE_STATE.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_MACHINE_STATE.MACHINE_SN is '机台编号';
comment on column IPHM_MACHINE_STATE.INTIME is '记录时间';
comment on column IPHM_MACHINE_STATE.JSON_DATA is 'JSON数据'; 

create unique index PK_IPHM_MACHINE_STATE_ID on IPHM_MACHINE_STATE (ID);
create index IDX_IPHM_MACHINE_STATE_SN on IPHM_MACHINE_STATE (MACHINE_SN);


--3、报警信息表
create table IPHM_ALARM
(
  ID              NUMBER        not null,
  MACHINE_SN      VARCHAR2(16)  not null,
  ALARM_KEY       VARCHAR2(64)  not null,
  BEGINTIME       DATE,
  ENDTIME         DATE,
  ALARM_INTERVAL  CHAR(10)
);

comment on table IPHM_ALARM is '报警信息表';
comment on column IPHM_ALARM.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_ALARM.MACHINE_SN is '机台编号';
comment on column IPHM_ALARM.ALARM_KEY is '报警内容KEY值';
comment on column IPHM_ALARM.BEGINTIME is '报警触发时间'; 
comment on column IPHM_ALARM.ENDTIME is '报警解除时间'; 
comment on column IPHM_ALARM.ALARM_INTERVAL is '报警时长，单位秒'; 

create unique index PK_IPHM_ALARM_ID on IPHM_ALARM (ID);
create index IDX_IPHM_ALARM_SN on IPHM_ALARM (MACHINE_SN);


--4、操作模式记录表
create table IPHM_OPMODE
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  INTIME         DATE default sysdate,
  OPMODE         CHAR(2)  not null
);

comment on table IPHM_OPMODE is '操作模式记录表';
comment on column IPHM_OPMODE.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_OPMODE.MACHINE_SN is '机台编号';
comment on column IPHM_OPMODE.INTIME is '记录时间';
comment on column IPHM_OPMODE.OPMODE is '操作模式：1-手动，2-半自动，3-全自动，0-调模'; 

create unique index PK_IPHM_OPMODE_ID on IPHM_OPMODE (ID);
create index IDX_IPHM_OPMODE_SN on IPHM_OPMODE (MACHINE_SN);


--5、工艺参数表 
create table IPHM_PARAMS
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  INTIME         DATE default sysdate,
  JSON_DATA      CLOB          not null
);

comment on table IPHM_PARAMS is '工艺参数表';
comment on column IPHM_PARAMS.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_PARAMS.MACHINE_SN is '机台编号';
comment on column IPHM_PARAMS.INTIME is '记录时间';
comment on column IPHM_PARAMS.JSON_DATA is 'JSON数据'; 

create unique index PK_IPHM_PARAMS_ID on IPHM_PARAMS (ID);
create index IDX_IPHM_PARAMS_SN on IPHM_PARAMS (MACHINE_SN);


--6、工艺参数更新日志表
create table IPHM_PARAMS_LOG
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  PARAM_KEY      VARCHAR2(128)  not null,
  INIT_VALUE     VARCHAR2(16)  not null,
  NEW_VALUE      VARCHAR2(16)  not null,
  MOD_TIME       DATE 
);

comment on table IPHM_PARAMS_LOG is '工艺参数更新日志表';
comment on column IPHM_PARAMS_LOG.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_PARAMS_LOG.MACHINE_SN is '机台编号';
comment on column IPHM_PARAMS_LOG.PARAM_KEY is '参数KEY';
comment on column IPHM_PARAMS_LOG.INIT_VALUE is '原始值';
comment on column IPHM_PARAMS_LOG.NEW_VALUE is '新值';
comment on column IPHM_PARAMS_LOG.MOD_TIME is '变更时间'; 

create unique index PK_IPHM_PARAMS_LOG_ID on IPHM_PARAMS_LOG (ID);
create index IDX_IPHM_PARAMS_LOG_SN on IPHM_PARAMS_LOG (MACHINE_SN);


--7、SPC生产数据表 
create table IPHM_SPCDATA
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  INTIME         DATE default sysdate,
  JSON_DATA      CLOB          not null
);

comment on table IPHM_SPCDATA is 'SPC生产数据表 ';
comment on column IPHM_SPCDATA.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_SPCDATA.MACHINE_SN is '机台编号';
comment on column IPHM_SPCDATA.INTIME is '记录时间';
comment on column IPHM_SPCDATA.JSON_DATA is 'JSON数据'; 

create unique index PK_IPHM_SPCDATA_ID on IPHM_SPCDATA (ID);
create index IDX_IPHM_SPCDATA_SN on IPHM_SPCDATA (MACHINE_SN);


--8、设备规格表
create table IPHM_SPECIFY
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  INTIME         DATE default sysdate,
  JSON_DATA      CLOB          not null
);

comment on table IPHM_SPECIFY is '设备规格表 ';
comment on column IPHM_SPECIFY.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_SPECIFY.MACHINE_SN is '机台编号';
comment on column IPHM_SPECIFY.INTIME is '记录时间';
comment on column IPHM_SPECIFY.JSON_DATA is 'JSON数据'; 

create unique index PK_IPHM_SPECIFY_ID on IPHM_SPECIFY (ID);
create index IDX_IPHM_SPECIFY_SN on IPHM_SPECIFY (MACHINE_SN);

