
PROGNAME=noozoid
BUILD_DIR=bin

all: help

prepare: ## install dependencies
	mkdir -p $(BUILD_DIR)
	shards install

build: ## build binary
	mkdir -p $(BUILD_DIR)
	shards build

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

