USE bank;

--为开户日期添加当前日期
ALTER TABLE dbo.BankAccount
    ADD CONSTRAINT DFT_BankAccount_opendate
    DEFAULT(CURRENT_TIMESTAMP) FOR opendate;
    
--为日志的操作日期添加当前日期
ALTER TABLE dbo.Log
    ADD CONSTRAINT DFT_Log_operationdate
    DEFAULT(CURRENT_TIMESTAMP) FOR operationdate;
    
--查询Users表中的信息    
SELECT id,username,usertype,password,sex,userID,
CONVERT(varchar,birthday,23) AS birthday,phone FROM Users;

--更新数据
UPDATE Users SET username='marry',password='marry',
sex='女',userID='888888',birthday='2000-12-1',phone='1' WHERE id='2'

--展示Users里的所有数据
SELECT * FROM Users;

--选择银行开户信息表里的信息
SELECT id,cnumber,cpassword,balance,islost,CONVERT(VARCHAR,opendate,20) opendate FROM BankAccount;

--插入操作日志
INSERT INTO Log(logtype,ruserid,username,details,ip)
	VALUES('挂失','2','marry','挂失','192.168.2.1');

--查看日志信息
SELECT * FROM Log;

--插入银行卡信息表
INSERT INTO BankAccount(userid,cnumber,cpassword,balance,islost) 
	VALUES ('2','12213','123','123','false');
	
--查看银行卡信息表
SELECT * FROM BankAccount;

--BankAccout表和Users表联合查询
SELECT B.cnumber,U.username,U.userID,B.opendate,B.islost FROM 
	Users AS U INNER JOIN BankAccount AS B ON U.id = B.userid;

--搜索查询
SELECT B.cnumber,U.username,U.userID,B.opendate,B.islost FROM 
	Users AS U INNER JOIN BankAccount AS B ON U.id = B.userid
	WHERE username = 'lin_';
	
--把用户的卡号搜索出来
SELECT cnumber,id FROM BankAccount WHERE islost = 'False' AND userid = '2';

--选择账户余额
SELECT balance FROM BankAccount WHERE cnumber = '12213';

--取钱之后，余额减少

UPDATE BankAccount SET balance = balance - 10;

--日志表显示内容
SELECT username,logtype,details,operationdate,IP FROM Log;