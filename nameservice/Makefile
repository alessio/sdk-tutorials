PACKAGES=$(shell go list ./... | grep -v '/simulation')

VERSION := $(shell echo $(shell git describe --tags) | sed 's/^v//')
COMMIT := $(shell git log -1 --format='%H')

ldflags = -X github.com/cosmos/cosmos-sdk/version.Name=NameService \
	-X github.com/cosmos/cosmos-sdk/version.ServerName=nsd \
	-X github.com/cosmos/cosmos-sdk/version.ClientName=nscli \
	-X github.com/cosmos/cosmos-sdk/version.Version=$(VERSION) \
	-X github.com/cosmos/cosmos-sdk/version.Commit=$(COMMIT)

BUILD_FLAGS := -ldflags '$(ldflags)'

ifeq (gdb,$(findstring gdb,$(BUILD_OPTIONS)))
  BUILD_FLAGS += -gcflags=all="-N -l"
endif

include Makefile.ledger
all: nsd nscli

nsd:
		go build -mod=readonly $(BUILD_FLAGS) ./cmd/nsd/

nscli:
		go build -mod=readonly $(BUILD_FLAGS) ./cmd/nscli/

install: go.sum
		@echo "--> Installing nsd & nscli"
		go install -mod=readonly $(BUILD_FLAGS) ./cmd/nsd
		go install -mod=readonly $(BUILD_FLAGS) ./cmd/nscli

go.sum: go.mod
		@echo "--> Ensure dependencies have not been modified"
		GO111MODULE=on go mod verify

test:
	@go test -mod=readonly $(PACKAGES)

clean:
	rm -f nsd nscli

.PHONY: clean
