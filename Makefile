############# VARIABLES #############
# Paths
CURR_PATH=$(shell pwd)
BUILD_DIR=${CURR_PATH}/build

############# GENERIC/META TARGETS #############

## --------------:
## Meta Targets:
## --------------:

## all: Runs build
.PHONY: all
all: build

## clean: Runs clean_build
.PHONY: clean
clean: clean_build

## clobber: Runs clobber_build
.PHONY: clobber
clobber: clobber_build

## help: Displays all available build targets.
help: Makefile
	@echo
	@echo " Choose a command:"
	@echo
	@sed -n 's/^## //p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

.PHONY: build
build:
	mkdir -p ${BUILD_DIR}
	cd ${BUILD_DIR} && cmake ../
	$(MAKE) -C ${BUILD_DIR} $(MAKEFLAGS)

.PHONY: clean_build
clean_build:
	$(MAKE) -C ${BUILD_DIR} clean

.PHONY: clobber_build
clobber_build:
	rm -rf ${BUILD_DIR}
