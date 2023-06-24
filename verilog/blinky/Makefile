
DEVICE    = 8k
FOOTPRINT = tq144:4k

.PHONY: all clean burn world timings

all: top.bin

include ../Make.rules

plot: tb.vcd
	gtkwave tb.vcd
