TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_screeningtype_aft_upd` AFTER UPDATE ON `main_bgchecktype` FOR EACH ROW BEGIN\n					if(old.type != new.type) then\n					update main_bgchecks_summary set screeningtype_name = new.type,modifieddate = utc_timestamp() where screeningtypeid = new.id and isactive = 1;\n					end if;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
