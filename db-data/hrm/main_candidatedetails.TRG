TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_candidates_aft_upd` AFTER UPDATE ON `main_candidatedetails` FOR EACH ROW BEGIN\n					if(old.candidate_name != new.candidate_name) then\n					begin\n					update main_bgchecks_summary set specimen_name = new.candidate_name,modifieddate = utc_timestamp() where specimen_id = new.id and specimen_flag = 2 and isactive = 1;\n					update main_interviewrounds_summary set candidate_name = new.candidate_name,modified_date = utc_timestamp() where candidate_id = new.id and isactive = 1;\n				        end;\n					end if;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
