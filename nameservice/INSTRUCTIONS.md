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

(A free 30-day trial is available)[https://www.jetbrains.com/go/].
