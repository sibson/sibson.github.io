DOC_DIR=_resume
BUILD_DIR=_build
IMG_DIR=img

ASSETS=$(IMG_DIR)/marc_sibson_resume.pdf $(IMG_DIR)/marc_sibson_resume.txt

all: $(ASSETS)

$(IMG_DIR)/marc_sibson_resume.pdf: $(BUILD_DIR)/$(DOC_DIR)/marc_sibson_resume.pdf
	cp $< $@

$(IMG_DIR)/marc_sibson_resume.txt: $(DOC_DIR)/marc_sibson_resume.txt
	cp $< $@

run:
	jekyll serve --incremental

clean::
	rm -rf .jekyll-metadata _site _build

include $(DOC_DIR)/makefile
