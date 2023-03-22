TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_interviewdetails_aft_upd` AFTER UPDATE ON `main_interviewdetails` FOR EACH ROW BEGIN\n					if old.interview_status != new.interview_status then \n				        begin \n					update main_interviewrounds_summary set interview_status = new.interview_status,modified_date = utc_timestamp() where interview_id = new.id and isactive = 1;\n					end;\n				        end if;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
