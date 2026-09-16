CREATE TABLE dq_exception (exception_id NUMBER PRIMARY KEY, table_name VARCHAR2(100), column_name VARCHAR2(100), record_id VARCHAR2(100), rule_name VARCHAR2(200), error_message VARCHAR2(500), severity VARCHAR2(20), status VARCHAR2(20), detected_date DATE DEFAULT SYSDATE);
CREATE SEQUENCE dq_exception_seq START WITH 1;
CREATE OR REPLACE PROCEDURE run_data_quality IS BEGIN
 INSERT INTO dq_exception SELECT dq_exception_seq.NEXTVAL,'ACCOUNT','CUSTOMER_ID',TO_CHAR(account_id),'CUSTOMER_ID_NOT_NULL','Customer ID is missing','HIGH','OPEN',SYSDATE FROM account WHERE customer_id IS NULL;
 INSERT INTO dq_exception SELECT dq_exception_seq.NEXTVAL,'ACCOUNT','CURRENT_BALANCE',TO_CHAR(account_id),'NEGATIVE_BALANCE','Unexpected negative balance','MEDIUM','OPEN',SYSDATE FROM account WHERE current_balance<0; COMMIT;
END;
/
