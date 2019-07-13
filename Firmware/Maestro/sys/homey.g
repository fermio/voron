M564 H0			; allow movements before homing

G91
G1 Z10 F9000		; lift up a little
G90

G1 Y600 F2400 H1	; quick homing

G91
G1 Y-5 F9000		; back off a little
G90

G1 Y600 F360 H1		; slow homing

G91
G1 Z-10 F9000		; go back down
G90

M564 S1 H1		; homing done, enforce limits
