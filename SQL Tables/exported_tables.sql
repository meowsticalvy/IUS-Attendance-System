SQL> 
SQL> SELECT DBMS_METADATA.GET_DDL('TABLE', table_name) FROM user_tables WHERE table_name IN
  2  ('ADepartment032','ARegistration032','ACourse032','AStudent_Data032','ATeacher032','AAttendance032','AProgram032');
SQL> 
SQL> SPOOL OFF;
