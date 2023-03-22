TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_weekdays_aftr_upd` AFTER UPDATE ON `main_weekdays` FOR EACH ROW BEGIN\n			        declare weekend_name varchar(200);\n			        select week_name into weekend_name from tbl_weeks where week_id = new.day_name;\n			        UPDATE main_leavemanagement_summary lm SET lm.weekend_startdayname = weekend_name, lm.modifieddate = utc_timestamp() \n			        WHERE (lm.weekend_startday = new.day_name AND lm.isactive=1);\n			        UPDATE main_leavemanagement_summary lm SET lm.weekend_enddayname = weekend_name, lm.modifieddate = utc_timestamp() \n			        WHERE (lm.weekend_endday = new.day_name AND lm.isactive=1);\n			    	END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
