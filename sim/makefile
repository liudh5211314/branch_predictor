.PHONY:	com sim clean

OUTPUT = simv_com
VPD_NAME = +vpdfile+${OUTPUT}.vpd

VCS =	vcs -full64 -cpp g++-4.8 -cc gcc-4.8		\
		-LDFLAGS -Wl,--no-as-needed					\
		+notimingcheck								\
		-debug_all									\
		${VPD_NAME}									\
		-o ${OUTPUT}								\
		-l compile.log								

SIM =	./${OUTPUT}				\
		${VPD_NAME}				\
		-l ${OUTPUT}.log

com:
	${VCS} -f file_list.f

sim:
	${SIM}

clean:
	rm -rf ./csrc *.daidir *.log *.vpd *.vdb simv* *.key *race.out* DVEfiles
