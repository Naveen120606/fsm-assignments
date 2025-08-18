**Sequence Detector (Mealy FSM) for Pattern 1101**
The design implements a Mealy-type FSM to detect the serial input pattern 1101 on din.

-> Output y is a 1-cycle pulse when the last bit of the sequence arrives.
-> Overlapping sequences are supported.
-> Reset is synchronous, active-high.
-> Stream tested = 11011011101
-> Expected pulse indices = 4,7,11
