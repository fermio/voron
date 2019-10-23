M564 H0

G91
G1 Z10 F9000
G90

M98 P"0:/macros/probing/switch"

M98 P"0:/macros/probing/goto/switch"

G30 Z-99999

M564 S1 H1
