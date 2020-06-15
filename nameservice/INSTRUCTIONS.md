# Instructions

# Prerequisites

Ensure you have Go 1.14 installed:

```
go version
```

Create a new directory and clone the repositories:

```
workdir="${HOME}/codewithus"
mkdir -p "${workdir}" ; cd "${workdir}"
git clone -b codewithus-1 https://github.com/alessio/cosmos-sdk-codewithus
git clone https://github.com/alessio/sdk-tutorials
cd sdk-tutorials/nameservice
echo "replace github.com/cosmos/cosmos-sdk => ${workdir}/cosmos-sdk-codewithus" >> go.mod
go mod tidy
go mod download
go mod verify
```

You **don't need to set GOPATH manually** since, if unset, the `go` tool sets `GOPATH`
automatically to `$HOME/go`. Ensure `GOPATH/bin` is appended to the user's `PATH`
environment variable. The Right Way(c):

```
export PATH=${PATH}:"$(go env GOPATH)/bin"
```

You **don't need to set GOBIN manually** since `GOBIN` defaults to `$GOPATH/bin` if unset - [reference](https://golang.org/cmd/go/#hdr-Compile_and_install_packages_and_dependencies).

# Build

```
make
bash init.sh
./nsd start
./nscli rest-server --trust-node
```

# Debuggers and IDEs

## Delve

### Linux

Walk out the project path (e.g. `cd`) and run just:

```
go get github.com/go-delve/delve/cmd/dlv
go get github.com/aarzilli/gdlv
```

Then `cd` back to the project directory:

```
cd -
```

### macOS


Make sure you have the compilation tools:

```
xcode-select --install
```

Walk out the project path (e.g. `cd`) and run just:

```
go get github.com/go-delve/delve/cmd/dlv
go get github.com/aarzilli/gdlv
```

Then `cd` back to the project directory:

```
cd -
```


## Goland (IntelliJ IDEA)

[A free 30-day trial is available](https://www.jetbrains.com/go/).
