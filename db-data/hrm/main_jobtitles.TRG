TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_jobtitles_aft_upd` AFTER UPDATE ON `main_jobtitles` FOR EACH ROW BEGIN\n				    if old.jobtitlename != new.jobtitlename then \n				    begin \n					update main_requisition_summary set jobtitle_name = new.jobtitlename,modifiedon = utc_timestamp() where isactive = 1 and jobtitle = new.id;\n					update main_employees_summary set jobtitle_name = new.jobtitlename,modifieddate = utc_timestamp() where isactive = 1 and jobtitle_id = new.id;\n				    end;\n				    end if;\n				    \n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
