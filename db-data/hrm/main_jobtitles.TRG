TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`%` TRIGGER `main_jobtitles_aft_upd` AFTER UPDATE ON `main_jobtitles` FOR EACH ROW BEGIN
sql_modes=0
definers='root@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'