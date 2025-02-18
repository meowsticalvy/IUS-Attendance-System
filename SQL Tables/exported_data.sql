SQL> 
SQL> SELECT 'INSERT INTO ' || table_name || ' VALUES (' || LISTAGG(column_name, ', ') WITHIN GROUP (ORDER BY column_id) || ');'
  2  FROM user_tab_columns
  3  WHERE table_name IN ('ADepartment032','ARegistration032','ACourse032','AStudent_Data032','ATeacher032','AAttendance032','AProgram032')
  4  GROUP BY table_name;
SQL> 
SQL> SPOOL OFF;
