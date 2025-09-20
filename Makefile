# Makefile for generating gRPC code from .proto files

# Variables
PROTO_DIR := protobuf/
PROTO_FILES := $(shell find $(PROTO_DIR) -name '*.proto')
GO_OUT_DIR := ./

# Protobuf compiler
PROTOC := protoc

# Plugins
GO_PLUGIN := protoc-gen-go
GO_GRPC_PLUGIN := protoc-gen-go-grpc

# Paths to plugins
GO_PLUGIN_PATH := $(shell which $(GO_PLUGIN))
GO_GRPC_PLUGIN_PATH := $(shell which $(GO_GRPC_PLUGIN))

# Generate Go code
go:
	mkdir -p $(GO_OUT_DIR)
	$(PROTOC) \
		--proto_path=$(PROTO_DIR) \
		--go_out=$(GO_OUT_DIR) \
		--go_opt=module=github.com/stanterprise/proto-go \
		--go-grpc_out=$(GO_OUT_DIR) \
		--go-grpc_opt=module=github.com/stanterprise/proto-go \
		$(PROTO_FILES)

# Clean generated code
clean:
	rm -rf testsystem
	

# Help
help:
	@echo "Usage:"
	@echo "  make go       - Generate Go code"
	@echo "  make clean    - Remove generated code"