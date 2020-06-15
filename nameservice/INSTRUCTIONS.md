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
