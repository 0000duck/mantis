
TOPIC: <recorder_id>-��̨��
/v1.0/recorder/<recorder_id>/update/speci  --3.1	�豸���
/v1.0/recorder/<recorder_id>/update/para  --3.2	�ܻ�����
/v1.0/recorder/<recorder_id>/update/state  --3.3	�ܻ�״̬��
/v1.0/recorder/<recorder_id>/add/shot --3.4	��������:
/v1.0/recorder/<recorder_id>/add/event --3.5	�¼���Ϣ:������Ϣ/����ģʽ
/v1.0/recorder/<recorder_id>/update/move --3.6	��������:


1�������� IPHM_MACHINE
ID
MACHINE_SN
MACHINE_NAME
MACHINE_TYPE
ADDRESS


2������״̬��Ϣ�� IPHM_MACHINE_STATE  ---60s
ID
MACHINE_SN
INTIME
JSON_DATA


3���¼���Ϣ��   ---�¼��������б仯�ͷ�
(1)������Ϣ�� IPHM_ALARM
ID
MACHINE_SN
ALARM_KEY
BEGINTIME
ENDTIME
ALARM_INTERVAL

(2)����ģʽ��¼�� IPHM_OPMODE  
ID
MACHINE_SN
INTIME
OPMODE


4�������� IPHM_PARAMS   ---����ʱ�͸ı�ʱ�������б仯�ͷ�
ID
MACHINE_SN
INTIME default sysdate
JSON_DATA

5������������־�� IPHM_PARAMS_LOG
ID
MACHINE_SN
PARAM_KEY
INIT_VALUE
NEW_VALUE
MOD_TIME

---�ѵ㣺��Ҫ��JSON�������Աȣ�
ÿ�η��͵����ݣ����ж��Ƿ��Ѵ��ڣ�������ֱ������������ʱ����Ҫ�ж��Ƿ��б仯���б仯���¼�����־��û�仯������



6��SPC   IPHM_SPCDATA     ---��һģ������ʱ��
ID
MACHINE_SN
INTIME default sysdate
JSON_DATA


7���豸��� IPHM_SPECIFY   һ̨����һ����¼ 
ID
MACHINE_SN
INTIME default sysdate
JSON_DATA


8���������ߣ�����⣬
@E:\working\20170307_ChinaPlas\Database\20170410_Database.sql;

