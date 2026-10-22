#!/usr/bin/tclsh
wcfg new
set simulation_group_id [group add simulation_group]
wave add /test_task2 -into $simulation_group_id
set implementation_group_id [group add implementation_group]
wave add -r /test_task2/l_m_task2 -into $implementation_group_id
wcfg save test_task2.wcfg
run all
quit -f