TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_states_aft_upd` AFTER UPDATE ON `main_states` FOR EACH ROW BEGIN\n					if old.state != new.state then \n					begin \n					   update main_interviewrounds_summary set interview_state_name = new.state,modified_date = utc_timestamp() where interview_state_id = new.state_id_org and isactive = 1;\n					end;\n					end if;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
