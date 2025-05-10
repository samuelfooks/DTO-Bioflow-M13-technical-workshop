# Define directories
SOURCE_DIR=.
OUTPUT_DIR=docs
ASSETS_DIR=assets

# Find all Markdown files in the source directory, excluding the data directory
MD_FILES=$(filter-out $(SOURCE_DIR)/data/%, $(wildcard $(SOURCE_DIR)/**/*.md))

# Define output files
HTML_FILES=$(patsubst $(SOURCE_DIR)/%.md,$(OUTPUT_DIR)/%.html,$(MD_FILES))
PDF_FILES=$(patsubst $(SOURCE_DIR)/%.md,$(OUTPUT_DIR)/%.pdf,$(MD_FILES))

# Default target
all: html pdf

# Rule to convert Markdown to HTML
html: $(HTML_FILES)

$(OUTPUT_DIR)/%.html: $(SOURCE_DIR)/%.md
	mkdir -p $(dir $@)
	npx @marp-team/marp-cli@latest $< --theme-set $(ASSETS_DIR)/common.css --html --output $@

# Rule to convert Markdown to PDF
pdf: $(PDF_FILES)

$(OUTPUT_DIR)/%.pdf: $(SOURCE_DIR)/%.md
	mkdir -p $(dir $@)
	npx @marp-team/marp-cli@latest $< --theme-set $(ASSETS_DIR)/common.css --pdf --output $@

# Clean up generated files
clean:
	rm -rf $(OUTPUT_DIR)/*.html $(OUTPUT_DIR)/*.pdf
