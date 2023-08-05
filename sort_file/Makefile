# Makefile for creating sample files in a new folder and running the sorting script

.PHONY: all create_folder create_files sort_files clean_files

all: create_folder create_files sort_files

NEW_FOLDER := sample_files

create_folder:
	@echo "Creating new folder: $(NEW_FOLDER)"
	mkdir -p $(NEW_FOLDER)

create_files: create_folder
	@echo "Generating sample files in $(NEW_FOLDER)"
	./create_sample_files.sh $(NEW_FOLDER)

sort_files: create_files
	@echo "Sorting files in $(NEW_FOLDER)"
	./sort_files.sh $(NEW_FOLDER)

clean_files:
	@echo "Cleaning up: Removing $(NEW_FOLDER)"
	rm -rf $(NEW_FOLDER)
