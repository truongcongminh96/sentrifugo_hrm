TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_roles_aft_upd` AFTER UPDATE ON `main_roles` FOR EACH ROW BEGIN\n				    if old.rolename != new.rolename then \n				    begin \n					update main_employees_summary set emprole_name = new.rolename,modifieddate = utc_timestamp() where isactive = 1 and emprole = new.id;\n				    end;\n				    end if;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
