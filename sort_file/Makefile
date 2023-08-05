# Makefile for creating sample files in a new folder and running the sorting script

.PHONY: all create_folder create_files sort_files clean

all: create_files sort_files

SAMPLE_FOLDER := sample_files

create_folder:
	@echo "Creating new folder: $(SAMPLE_FOLDER)"
	mkdir -p $(SAMPLE_FOLDER)

create_files: create_folder
	@echo "Generating sample files in $(SAMPLE_FOLDER)"
	./create_sample_files.sh

sort_files: create_files
	@echo "Sorting files in $(SAMPLE_FOLDER)"
	./sort_files $(SAMPLE_FOLDER)

clean:
	@echo "Cleaning up: Removing $(SAMPLE_FOLDER)"
	rm -rf $(SAMPLE_FOLDER)
