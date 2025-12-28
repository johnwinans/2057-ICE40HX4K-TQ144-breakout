TOP=..


.PHONY: all clean burn world timings

FILES= \
	top.v \
	counter.v

all:: top.bin

include $(TOP)/Make.rules

top.json : $(FILES)
	$(COMPILE.v) -p "$(SYNTH) -top top -json $@" $^


timing: top.asc
	icetime -tmd hx$(DEVICE) $<


counter_tb.vvp: counter_tb.v counter.v
	iverilog -o $@ $^

plot: counter_tb.vcd
	gtkwave $<

prog: top.bin
	sudo $(TOP)/prog-flash.sh $<

