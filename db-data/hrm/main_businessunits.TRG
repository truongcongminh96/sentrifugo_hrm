TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_businessunits_main_requisition_summary` AFTER UPDATE ON `main_businessunits` FOR EACH ROW BEGIN\n					UPDATE main_requisition_summary rs SET rs.businessunit_name = NEW.unitname, rs.modifiedon = utc_timestamp() WHERE (rs.businessunit_id = NEW.id \n					AND rs.businessunit_name != NEW.unitname);\n				        UPDATE main_leaverequest_summary ls SET ls.buss_unit_name = if(NEW.unitcode != "000",concat(NEW.unitcode,"","-"),""), ls.modifieddate = utc_timestamp() \n				        WHERE (ls.bunit_id = NEW.id AND ls.isactive=1);\n				        \n				        update main_leavemanagement_summary lm set lm.businessunit_name = if(NEW.unitcode != "000",concat(NEW.unitcode,"","-"),""),lm.modifieddate = utc_timestamp() \n				        where lm.businessunit_id = new.id and lm.isactive = 1;\n					#start of main_employees_summary\n					update main_employees_summary set businessunit_name = new.unitname,modifieddate = utc_timestamp() where businessunit_id = new.id and isactive = 1;\n					#end of main_employees_summary\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
