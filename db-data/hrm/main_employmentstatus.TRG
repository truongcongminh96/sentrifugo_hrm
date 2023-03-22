TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_employmentstatus_main_requisition_summary` AFTER UPDATE ON `main_employmentstatus` FOR EACH ROW BEGIN\n					declare empt_name varchar(250);\n					UPDATE main_requisition_summary rs \n					LEFT JOIN main_employmentstatus mes ON mes.workcodename = rs.emp_type\n					LEFT JOIN tbl_employmentstatus tes ON tes.id = mes.workcodename\n					SET rs.emp_type_name = tes.employemnt_status, rs.modifiedon = utc_timestamp()\n					WHERE (rs.emp_type_name != tes.employemnt_status);\n					select te.employemnt_status into empt_name from main_employmentstatus em \n				       inner join tbl_employmentstatus te on te.id = em.workcodename where em.id = new.id;\n					#start of main_employees_summary\n					update main_employees_summary set emp_status_name = empt_name,modifieddate = utc_timestamp() where emp_status_id = new.id and isactive = 1;\n					#end of main_employees_summary\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
