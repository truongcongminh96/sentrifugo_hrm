TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_positions_main_requisition_summary` AFTER UPDATE ON `main_positions` FOR EACH ROW BEGIN\n					UPDATE main_requisition_summary rs SET rs.position_name = NEW.positionname, rs.modifiedon = utc_timestamp() WHERE (rs.position_id = NEW.id \n					AND rs.position_name != NEW.positionname);\n					update main_employees_summary set position_name = new.positionname,modifieddate = utc_timestamp() where position_id = new.id and isactive = 1;\n				    END'
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
