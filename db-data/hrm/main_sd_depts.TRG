TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_sd_depts_aft_upd` AFTER UPDATE ON `main_sd_depts` FOR EACH ROW BEGIN\n					if old.service_desk_name != new.service_desk_name then \n        			begin \n           				update main_sd_requests_summary set service_desk_name = new.service_desk_name,modifieddate = utc_timestamp() where service_desk_id = new.id;\n        			end;\n        			end if;\n    				END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
