# chainmaker
a geth private blockchain setup script

## Submodule
- [go-ethereum](https://github.com/ethereum/go-ethereum.git)
- [ethstats](https://github.com/cubedro/eth-netstats)

## Clone Repsitory
```bash
git clone --recursive https://github.com/ptmew/chainmaker.git
```

## Prerequirement
- Clone this repo
- Make geth binary at go-ethereum repo (`cd go-ethereum` then `make geth`)
- Follow ethstats repo guide to install the package

## Run this repo
1. Use Chain.sh to init the chain genesis
```
./chain.sh init
```

2. Create tmux session
```
tmux new-session -s geth-node
```

3. Run geth-node script on tmux to automate the node startup process
```
./geth-node
```

## Command in chain.sh
```
init                # Automate a geth init
clean               # Clean node datadir folder
start <node-folder> # Start geth with the given datadir
```
