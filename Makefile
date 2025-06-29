# Makefile for generating gRPC code from .proto files

# Variables
PROTO_DIR := protobuf/testsystem
PROTO_FILES := $(wildcard $(PROTO_DIR)/*.proto)
-GO_OUT_DIR := .
+GO_OUT_DIR := gen/go

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
		--go_opt=module=github.com/stanterprise/protobuf/gen/go \
		--go-grpc_out=$(GO_OUT_DIR) \
		--go-grpc_opt=module=github.com/stanterprise/protobuf/gen/go \
		$(PROTO_FILES)

# Clean generated code
clean:
	rm -rf gen/go/testsystem
	rm -rf gen/python/testsystem

# Help
help:
	@echo "Usage:"
	@echo "  make go       - Generate Go code"
	@echo "  make clean    - Remove generated code"