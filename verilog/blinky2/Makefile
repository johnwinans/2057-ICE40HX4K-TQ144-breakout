TOP=..

DEVICE    = 8k
FOOTPRINT = tq144:4k

.PHONY: all clean burn world timings

FILES= \
	top.v \
	counter.v

all:: top.bin

include $(TOP)/Make.rules

top.blif: $(FILES)
	$(COMPILE.v) -p "synth_ice40 -top top -blif $@" $(FILES)


timing: top.asc
	icetime -tmd hx$(DEVICE) $<


counter_tb.vvp: counter_tb.v counter.v
	iverilog -o $@ $^

plot: counter_tb.vcd
	gtkwave $<

prog: top.bin
	sudo $(TOP)/prog-flash.sh $<

