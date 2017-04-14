
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
create unique index IDX_IPHM_MACHINE_SN on IPHM_MACHINE (MACHINE_SN);


--2、机器状态信息表
create table IPHM_MACHINE_STATE
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  RECORD_TIME    DATE,
  JSON_DATA      CLOB          not null
);

comment on table IPHM_MACHINE_STATE is '机器状态信息表';
comment on column IPHM_MACHINE_STATE.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_MACHINE_STATE.MACHINE_SN is '机台编号';
comment on column IPHM_MACHINE_STATE.RECORD_TIME is '记录时间';
comment on column IPHM_MACHINE_STATE.JSON_DATA is 'JSON数据'; 

create unique index PK_IPHM_MACHINE_STATE_ID on IPHM_MACHINE_STATE (ID);
create index IDX_IPHM_MACHINE_STATE_SN on IPHM_MACHINE_STATE (MACHINE_SN);


--3、报警信息表
create table IPHM_ALARM
(
  ID               NUMBER        not null,
  MACHINE_SN       VARCHAR2(16)  not null,
  ALARM_ID         VARCHAR2(64)  not null,
  PARAM1           VARCHAR2(128),
  PARAM2           VARCHAR2(128), 
  ACTIVE_TIME      DATE,
  RESET_TIME       DATE,
  ALARM_INTERVAL   INT
);

comment on table IPHM_ALARM is '报警信息表';
comment on column IPHM_ALARM.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_ALARM.MACHINE_SN is '机台编号';
comment on column IPHM_ALARM.ALARM_ID is '报警ID';
comment on column IPHM_ALARM.PARAM1 is '参数1';
comment on column IPHM_ALARM.PARAM2 is '参数2';
comment on column IPHM_ALARM.ACTIVE_TIME is '报警触发时间'; 
comment on column IPHM_ALARM.RESET_TIME is '报警解除时间'; 
comment on column IPHM_ALARM.ALARM_INTERVAL is '报警时长，单位秒'; 

create unique index PK_IPHM_ALARM_ID on IPHM_ALARM (ID);
create index IDX_IPHM_ALARM_SN on IPHM_ALARM (MACHINE_SN);


--4、操作模式记录表
create table IPHM_OPMODE
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  RECORD_TIME    DATE,
  OPMODE         INT  not null
);

comment on table IPHM_OPMODE is '操作模式记录表';
comment on column IPHM_OPMODE.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_OPMODE.MACHINE_SN is '机台编号';
comment on column IPHM_OPMODE.RECORD_TIME is '记录时间';
comment on column IPHM_OPMODE.OPMODE is '操作模式：1-手动，2-半自动，3-全自动，0-调模'; 

create unique index PK_IPHM_OPMODE_ID on IPHM_OPMODE (ID);
create index IDX_IPHM_OPMODE_SN on IPHM_OPMODE (MACHINE_SN);


--5、工艺参数表 
create table IPHM_PARAMS
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  RECORD_TIME    DATE,
  JSON_DATA      CLOB          not null
);

comment on table IPHM_PARAMS is '工艺参数表';
comment on column IPHM_PARAMS.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_PARAMS.MACHINE_SN is '机台编号';
comment on column IPHM_PARAMS.RECORD_TIME is '记录时间';
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
  RECORD_TIME    DATE,
  JSON_DATA      CLOB          not null
);

comment on table IPHM_SPCDATA is 'SPC生产数据表 ';
comment on column IPHM_SPCDATA.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_SPCDATA.MACHINE_SN is '机台编号';
comment on column IPHM_SPCDATA.RECORD_TIME is '记录时间';
comment on column IPHM_SPCDATA.JSON_DATA is 'JSON数据'; 

create unique index PK_IPHM_SPCDATA_ID on IPHM_SPCDATA (ID);
create index IDX_IPHM_SPCDATA_SN on IPHM_SPCDATA (MACHINE_SN);


--8、设备规格表
create table IPHM_SPECIFY
(
  ID             NUMBER        not null,
  MACHINE_SN     VARCHAR2(16)  not null,
  RECORD_TIME    DATE,
  JSON_DATA      CLOB          not null
);

comment on table IPHM_SPECIFY is '设备规格表 ';
comment on column IPHM_SPECIFY.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_SPECIFY.MACHINE_SN is '机台编号';
comment on column IPHM_SPECIFY.RECORD_TIME is '记录时间';
comment on column IPHM_SPECIFY.JSON_DATA is 'JSON数据'; 

create unique index PK_IPHM_SPECIFY_ID on IPHM_SPECIFY (ID);
create index IDX_IPHM_SPECIFY_SN on IPHM_SPECIFY (MACHINE_SN);


--9、语言字典表
create table IPHM_LANG_DICT
(
  ID             NUMBER          not null,
  LANG_KEY       VARCHAR2(64)    not null,
  VALUE          VARCHAR2(128)
);

comment on table IPHM_LANG_DICT is '语言字典表';
comment on column IPHM_LANG_DICT.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_LANG_DICT.LANG_KEY is '字典KEY';
comment on column IPHM_LANG_DICT.VALUE is '值'; 

create unique index PK_IPHM_LANG_DICT_ID on IPHM_LANG_DICT (ID);
create index IDX_IPHM_LANG_DICT_KEY on IPHM_LANG_DICT (LANG_KEY);


--10、停机原因表
create table IPHM_STANDSTILL_REASON
(
  REASON_ID       VARCHAR2(64)    not null,
  REASON          VARCHAR2(128)
);

comment on table IPHM_STANDSTILL_REASON is '停机原因表';
comment on column IPHM_STANDSTILL_REASON.REASON_ID is '原因ID';
comment on column IPHM_STANDSTILL_REASON.REASON is '原因描述'; 

create unique index PK_IPHM_STANDSTILL_REASON_ID on IPHM_STANDSTILL_REASON (REASON_ID); 


--11、停机记录表
create table IPHM_STANDSTILL_LOG
(
  ID               NUMBER        not null,
  MACHINE_SN       VARCHAR2(16)  not null,
  REASON_ID        VARCHAR2(64)  not null,
  USER_ID          VARCHAR2(32),
  START_TIME       DATE,
  RESET_TIME       DATE,
  LAST_INTERVAL    INT
);

comment on table IPHM_STANDSTILL_LOG is '停机记录表';
comment on column IPHM_STANDSTILL_LOG.ID is '序号，取自序列PHM_SEQ';
comment on column IPHM_STANDSTILL_LOG.MACHINE_SN is '机台编号';
comment on column IPHM_STANDSTILL_LOG.REASON_ID is '原因ID';
comment on column IPHM_STANDSTILL_LOG.USER_ID is '用户ID';
comment on column IPHM_STANDSTILL_LOG.START_TIME is '开始时间';
comment on column IPHM_STANDSTILL_LOG.RESET_TIME is '恢复时间'; 
comment on column IPHM_STANDSTILL_LOG.LAST_INTERVAL is '时长，单位秒'; 

create unique index PK_IPHM_STANDSTILL_LOG_ID on IPHM_STANDSTILL_LOG (ID);
create index IDX_IPHM_STANDSTILL_LOG_SN on IPHM_STANDSTILL_LOG (MACHINE_SN);
create index IDX_IPHM_STANDSTILL_LOG_REASON on IPHM_STANDSTILL_LOG (REASON_ID);


