
PROGNAME=noozoid
BUILD_DIR=_build

all: help

build: ## build binary
	mkdir -p $(BUILD_DIR)
	crystal build -o $(BUILD_DIR)/$(PROGNAME) src/main.cr

test: ## test binary
	crystal spec

help: ## print this help
	@echo "Usage: make <target>"
	@echo ""
	@echo "With one of following targets:"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "} \
	  /^[a-zA-Z_-]+:.*?## / \
	  { sub("\\\\n",sprintf("\n%22c"," "), $$2); \
	        printf("\033[36m%-20s\033[0m %s\n", $$1, $$2); \
	  }' $(MAKEFILE_LIST)
	@echo ""

