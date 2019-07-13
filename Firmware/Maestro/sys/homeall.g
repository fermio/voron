M564 H0			; allow movements before homing

G91
G1 Z10 F9000		; lift up a little
G90

G1 X600 F2400 H1	; quick homing
G1 Y600 F2400 H1	; quick homing

G91
G1 X-5 Y-5 F9000	; back off a little
G90

G1 X600 F360 H1		; slow homing
G1 Y600 F360 H1		; slow homing


M98 P"0:/macros/probing/switch"
M98 P"0:/macros/probing/goto/switch"

G30 Z-99999		; single Z probe at center of bed

M564 S1 H1		; homing done, enforce limits

M98 P"0:/macros/park-nozzle"