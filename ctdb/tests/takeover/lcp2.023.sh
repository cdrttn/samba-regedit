#!/bin/sh

. "${TEST_SCRIPTS_DIR}/unit.sh"

define_test "3 nodes, all IPs assigned, 1->3 unhealthy"

export CTDB_TEST_LOGLEVEL=4

required_result <<EOF
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  CONSIDERING MOVES (UNASSIGNED)
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]: +++++++++++++++++++++++++++++++++++++++++
DATE TIME [PID]: Selecting most imbalanced node from:
DATE TIME [PID]:  0 [89609]
DATE TIME [PID]:  1 [0]
DATE TIME [PID]:  2 [147968]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  CONSIDERING MOVES FROM 2 [147968]
DATE TIME [PID]:  2 [-58359] -> 192.168.21.254 -> 1 [+0]
DATE TIME [PID]:  2 [-58359] -> 192.168.21.252 -> 1 [+0]
DATE TIME [PID]:  2 [-59572] -> 192.168.20.253 -> 1 [+0]
DATE TIME [PID]:  2 [-59823] -> 192.168.20.251 -> 1 [+0]
DATE TIME [PID]:  2 [-59823] -> 192.168.20.249 -> 1 [+0]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]: 2 [-59823] -> 192.168.20.251 -> 1 [+0]
DATE TIME [PID]: +++++++++++++++++++++++++++++++++++++++++
DATE TIME [PID]: Selecting most imbalanced node from:
DATE TIME [PID]:  0 [89609]
DATE TIME [PID]:  1 [0]
DATE TIME [PID]:  2 [88145]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  CONSIDERING MOVES FROM 0 [89609]
DATE TIME [PID]:  0 [-42483] -> 192.168.21.253 -> 1 [+14161]
DATE TIME [PID]:  0 [-45662] -> 192.168.20.254 -> 1 [+15625]
DATE TIME [PID]:  0 [-45662] -> 192.168.20.252 -> 1 [+15625]
DATE TIME [PID]:  0 [-45411] -> 192.168.20.250 -> 1 [+16129]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]: 0 [-45662] -> 192.168.20.254 -> 1 [+15625]
DATE TIME [PID]: +++++++++++++++++++++++++++++++++++++++++
DATE TIME [PID]: Selecting most imbalanced node from:
DATE TIME [PID]:  0 [43947]
DATE TIME [PID]:  1 [15625]
DATE TIME [PID]:  2 [88145]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  CONSIDERING MOVES FROM 2 [88145]
DATE TIME [PID]:  2 [-44198] -> 192.168.21.254 -> 1 [+28322]
DATE TIME [PID]:  2 [-44198] -> 192.168.21.252 -> 1 [+28322]
DATE TIME [PID]:  2 [-43947] -> 192.168.20.253 -> 1 [+31501]
DATE TIME [PID]:  2 [-43947] -> 192.168.20.249 -> 1 [+31501]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]: 2 [-44198] -> 192.168.21.254 -> 1 [+28322]
DATE TIME [PID]: +++++++++++++++++++++++++++++++++++++++++
DATE TIME [PID]: Selecting most imbalanced node from:
DATE TIME [PID]:  0 [43947]
DATE TIME [PID]:  1 [43947]
DATE TIME [PID]:  2 [43947]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  CONSIDERING MOVES FROM 0 [43947]
DATE TIME [PID]:  0 [-28322] -> 192.168.21.253 -> 1 [+44198]
DATE TIME [PID]:  0 [-29786] -> 192.168.20.252 -> 1 [+45662]
DATE TIME [PID]:  0 [-29786] -> 192.168.20.250 -> 1 [+45915]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  CONSIDERING MOVES FROM 1 [43947]
DATE TIME [PID]:  1 [-28322] -> 192.168.21.254 -> 1 [+28322]
DATE TIME [PID]:  1 [-29786] -> 192.168.20.254 -> 1 [+29786]
DATE TIME [PID]:  1 [-29786] -> 192.168.20.251 -> 1 [+29786]
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  ----------------------------------------
DATE TIME [PID]:  CONSIDERING MOVES FROM 2 [43947]
DATE TIME [PID]:  2 [-28322] -> 192.168.21.252 -> 1 [+44198]
DATE TIME [PID]:  2 [-29786] -> 192.168.20.253 -> 1 [+45662]
DATE TIME [PID]:  2 [-29786] -> 192.168.20.249 -> 1 [+45662]
DATE TIME [PID]:  ----------------------------------------
192.168.21.254 1
192.168.21.253 0
192.168.21.252 2
192.168.20.254 1
192.168.20.253 2
192.168.20.252 0
192.168.20.251 1
192.168.20.250 0
192.168.20.249 2
EOF

simple_test 2,2,2 <<EOF
192.168.21.254 2
192.168.21.253 0
192.168.21.252 2
192.168.20.254 0
192.168.20.253 2
192.168.20.252 0
192.168.20.251 2
192.168.20.250 0
192.168.20.249 2
EOF
