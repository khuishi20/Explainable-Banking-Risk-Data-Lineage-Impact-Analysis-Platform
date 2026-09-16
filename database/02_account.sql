CREATE TABLE account (account_id NUMBER PRIMARY KEY, customer_id NUMBER, account_type VARCHAR2(30), current_balance NUMBER(18,2), interest_rate NUMBER(8,4), open_date DATE, maturity_date DATE, account_status VARCHAR2(20), CONSTRAINT fk_account_customer FOREIGN KEY(customer_id) REFERENCES customer(customer_id));
CREATE TABLE account_audit (audit_id NUMBER PRIMARY KEY, account_id NUMBER, old_balance NUMBER(18,2), new_balance NUMBER(18,2), change_date DATE, changed_by VARCHAR2(100));
CREATE SEQUENCE account_audit_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_account_balance_audit AFTER UPDATE OF current_balance ON account FOR EACH ROW BEGIN INSERT INTO account_audit VALUES(account_audit_seq.NEXTVAL,:OLD.account_id,:OLD.current_balance,:NEW.current_balance,SYSDATE,USER); END;
/
