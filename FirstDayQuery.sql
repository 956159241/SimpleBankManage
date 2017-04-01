USE bank;

--Ϊ����������ӵ�ǰ����
ALTER TABLE dbo.BankAccount
    ADD CONSTRAINT DFT_BankAccount_opendate
    DEFAULT(CURRENT_TIMESTAMP) FOR opendate;
    
--Ϊ��־�Ĳ���������ӵ�ǰ����
ALTER TABLE dbo.Log
    ADD CONSTRAINT DFT_Log_operationdate
    DEFAULT(CURRENT_TIMESTAMP) FOR operationdate;
    
--��ѯUsers���е���Ϣ    
SELECT id,username,usertype,password,sex,userID,
CONVERT(varchar,birthday,23) AS birthday,phone FROM Users;

--��������
UPDATE Users SET username='marry',password='marry',
sex='Ů',userID='888888',birthday='2000-12-1',phone='1' WHERE id='2'

--չʾUsers�����������
SELECT * FROM Users;

--ѡ�����п�����Ϣ�������Ϣ
SELECT id,cnumber,cpassword,balance,islost,CONVERT(VARCHAR,opendate,20) opendate FROM BankAccount;

--���������־
INSERT INTO Log(logtype,ruserid,username,details,ip)
	VALUES('��ʧ','2','marry','��ʧ','192.168.2.1');

--�鿴��־��Ϣ
SELECT * FROM Log;

--�������п���Ϣ��
INSERT INTO BankAccount(userid,cnumber,cpassword,balance,islost) 
	VALUES ('2','12213','123','123','false');
	
--�鿴���п���Ϣ��
SELECT * FROM BankAccount;

--BankAccout���Users�����ϲ�ѯ
SELECT B.cnumber,U.username,U.userID,B.opendate,B.islost FROM 
	Users AS U INNER JOIN BankAccount AS B ON U.id = B.userid;

--������ѯ
SELECT B.cnumber,U.username,U.userID,B.opendate,B.islost FROM 
	Users AS U INNER JOIN BankAccount AS B ON U.id = B.userid
	WHERE username = 'lin_';
	
--���û��Ŀ�����������
SELECT cnumber,id FROM BankAccount WHERE islost = 'False' AND userid = '2';

--ѡ���˻����
SELECT balance FROM BankAccount WHERE cnumber = '12213';

--ȡǮ֮��������

UPDATE BankAccount SET balance = balance - 10;

--��־����ʾ����
SELECT username,logtype,details,operationdate,IP FROM Log;