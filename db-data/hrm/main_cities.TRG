TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_cities_aft_upd` AFTER UPDATE ON `main_cities` FOR EACH ROW BEGIN\n					if old.city != new.city then \n				        begin \n				           update main_interviewrounds_summary set interview_city_name = new.city,modified_date = utc_timestamp() where interview_city_id = new.city_org_id and isactive = 1;\n				        end;\n				        end if;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
