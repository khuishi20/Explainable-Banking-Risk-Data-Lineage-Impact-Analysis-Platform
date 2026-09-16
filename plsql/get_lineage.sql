CREATE OR REPLACE PROCEDURE get_lineage(p_report_name IN VARCHAR2,p_metric_name IN VARCHAR2) IS BEGIN
 FOR r IN (SELECT dl.source_object,dl.source_column,dl.target_object,dl.target_column,dl.transformation_rule,dl.lineage_type FROM report_metric rm JOIN data_lineage dl ON rm.target_object=dl.target_object AND rm.target_column=dl.target_column WHERE rm.report_name=p_report_name AND rm.metric_name=p_metric_name) LOOP
  DBMS_OUTPUT.PUT_LINE('SOURCE: '||r.source_object||'.'||r.source_column); DBMS_OUTPUT.PUT_LINE('TARGET: '||r.target_object||'.'||r.target_column); DBMS_OUTPUT.PUT_LINE('RULE: '||r.transformation_rule); DBMS_OUTPUT.PUT_LINE('TYPE: '||r.lineage_type); DBMS_OUTPUT.PUT_LINE('---------------------------'); END LOOP;
END;
/
