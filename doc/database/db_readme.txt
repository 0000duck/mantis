
TOPIC: <recorder_id>-机台号
/v1.0/recorder/<recorder_id>/update/speci  --3.1	设备规格
/v1.0/recorder/<recorder_id>/update/para  --3.2	塑机工艺
/v1.0/recorder/<recorder_id>/update/state  --3.3	塑机状态：
/v1.0/recorder/<recorder_id>/add/shot --3.4	生产数据:
/v1.0/recorder/<recorder_id>/add/event --3.5	事件信息:报警信息/操作模式
/v1.0/recorder/<recorder_id>/update/move --3.6	动作曲线:


1、机器表 IPHM_MACHINE
ID
MACHINE_SN
MACHINE_NAME
MACHINE_TYPE
ADDRESS


2、机器状态信息表 IPHM_MACHINE_STATE  ---60s
ID
MACHINE_SN
INTIME
JSON_DATA


3、事件信息：   ---事件触发，有变化就发
(1)报警信息表 IPHM_ALARM
ID
MACHINE_SN
ALARM_KEY
BEGINTIME
ENDTIME
ALARM_INTERVAL

(2)操作模式记录表 IPHM_OPMODE  
ID
MACHINE_SN
INTIME
OPMODE


4、参数表 IPHM_PARAMS   ---启动时和改变时触发，有变化就发
ID
MACHINE_SN
INTIME default sysdate
JSON_DATA

5、参数更新日志表 IPHM_PARAMS_LOG
ID
MACHINE_SN
PARAM_KEY
INIT_VALUE
NEW_VALUE
MOD_TIME

---难点：需要对JSON数据做对比，
每次发送的数据，先判断是否已存在，不存在直接新增；存在时还需要判断是否有变化，有变化则记录变更日志，没变化不处理；



6、SPC   IPHM_SPCDATA     ---按一模的周期时间
ID
MACHINE_SN
INTIME default sysdate
JSON_DATA


7、设备规格 IPHM_SPECIFY   一台机器一条记录 
ID
MACHINE_SN
INTIME default sysdate
JSON_DATA


8、动画曲线：不入库，
@E:\working\20170307_ChinaPlas\Database\20170410_Database.sql;

