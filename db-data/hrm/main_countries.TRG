TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_countries_aft_upd` AFTER UPDATE ON `main_countries` FOR EACH ROW BEGIN\n					if old.country != new.country then \n					begin \n					update main_interviewrounds_summary set interview_country_name = new.country,modified_date = utc_timestamp() where interview_country_id = new.country_id_org and isactive = 1;\n					end;\n					end if;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
