# Purpose: Sample Makefile used by developers
# Author : Anh K. Huynh
# Date   : 2013 April 24th
# License: GPL v2

BIN_DIR = ../bin/

default:
	@echo "Sample Makefile used by developer. Don't use this file"
	@echo "  install : install files to /usr/share/uim/"

xtelex.scm: Telex.txt.in
	@$(BIN_DIR)/scim2uim.rb --telex < Telex.txt.in > $(@)

xvni.scm: VNI.txt.in
	@$(BIN_DIR)/scim2uim.rb --vni < VNI.txt.in > $(@)

install: xtelex.scm xvni.scm
	@install -v -m644 xtelex.scm xvni.scm /usr/share/uim/

clean:
	@rm -fv xtelex.scm xvni.scm

build-telex:
	@echo "Possibly missing entries"
	@$(BIN_DIR)/find_missing.rb < Telex.txt.in > missing
	@cat missing >> Telex.txt.in
	@echo "Find missing entries again"
	@$(BIN_DIR)/find_missing.rb < Telex.txt.in > missing
	@cat missing >> Telex.txt.in
	@echo "Sorting the tables"
	@sort -u Telex.txt.in | $(BIN_DIR)/sort.rb  > tmp
	@echo "Now done"
	@mv tmp Telex.txt.in

all: clean build-telex install