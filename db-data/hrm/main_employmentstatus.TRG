TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_employmentstatus_main_requisition_summary` AFTER UPDATE ON `main_employmentstatus` FOR EACH ROW BEGIN
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'