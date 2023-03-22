TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_holidaygroups_aft_ins` AFTER UPDATE ON `main_holidaygroups` FOR EACH ROW BEGIN\n				    if old.groupname != new.groupname then \n				    begin \n					update main_employees_summary set holiday_group_name = new.groupname,modifieddate = utc_timestamp() where isactive = 1 and holiday_group = new.id;\n				    end;\n				    end if;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
