CREATE OR REPLACE PROCEDURE get_impact(p_source_object IN VARCHAR2,p_source_column IN VARCHAR2) IS BEGIN
 FOR r IN (SELECT LEVEL dependency_level,source_object,source_column,target_object,target_column,transformation_rule,lineage_type FROM data_lineage START WITH source_object=p_source_object AND source_column=p_source_column CONNECT BY NOCYCLE PRIOR target_object=source_object AND PRIOR target_column=source_column) LOOP
  DBMS_OUTPUT.PUT_LINE('LEVEL '||r.dependency_level||': '||r.source_object||'.'||r.source_column||' -> '||r.target_object||'.'||r.target_column); DBMS_OUTPUT.PUT_LINE('TRANSFORMATION: '||r.transformation_rule); END LOOP;
END;
/
