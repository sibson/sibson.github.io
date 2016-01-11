# rest.mk
#
#  - A makefile fragment that builds Restructured Text documents
#
#  Quickly create pdfs or html by running
#
#    make -f rest.mk DOC_DIR=. pdf
#
#  You may also use stylesheets by adding
#
#    RST2PDF_FLAGS+=-s $(DOCUMENT:.txt=.css)
#############################################################################
#
#
# Control variables
#############################################################################
DOC_DIR?=docs
BUILD_DIR?=build

DOCUMENT?=$(wildcard $(DOC_DIR)/*.txt)


#############################################################################
#
# Internal gunk/magic below, you shouldn't need to worry about this.
#
############################################################################

PDFS?=$(addprefix $(BUILD_DIR)/,$(DOCUMENT:.txt=.pdf))
HTMLS?=$(addprefix $(BUILD_DIR)/,$(DOCUMENT:.txt=.html))

RST2PDF?=rst2pdf
RST2HTML?=rst2html

pdf:: $(PDFS)
html:: $(HTMLS)
docs:: html pdf

$(BUILD_DIR)/$(DOC_DIR):
	mkdir -p $@

$(BUILD_DIR)/%.pdf: %.txt | $(BUILD_DIR)/$(DOC_DIR)
	$(RST2PDF) $(RST2PDF_FLAGS) $< -o $@

$(BUILD_DIR)/%.html: %.txt | $(BUILD_DIR)/$(DOC_DIR)
	$(RST2HTML) $< $@

clean::
	rm -rf $(PDFS) $(HTMLS)

help::
	@echo "  make pdf: build pdf documentation"
	@echo "  make html: build html documentation"
	@echo "  make docs: build all documentation"
