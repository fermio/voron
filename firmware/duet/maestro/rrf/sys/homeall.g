M564 H0

G91
G1 Z10 F9000
G90

G1 X600 F2400 H1
G1 Y600 F2400 H1

G91
G1 X-5 Y-5 F9000
G90

G1 X600 F360 H1
G1 Y600 F360 H1


M98 P"0:/macros/probing/switch"
M98 P"0:/macros/probing/goto/switch"

G30 Z-99999

M564 S1 H1

M98 P"0:/macros/park-nozzle"
