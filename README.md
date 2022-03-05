# chainmaker
a geth private blockchain setup script

## Submodule
- [go-ethereum](https://github.com/ethereum/go-ethereum.git)
- [ethstats](https://github.com/cubedro/eth-netstats)

## Clone Repsitory
```bash
git install --recursive https://github.com/ptmew/chainmaker.git
```

## Guide
- Clone this repo
- Make geth binary at go-ethereum repo
- Follow ethstats repo guide to install the package
- Use Chain.sh to init the chain genesis
- Create tmux session
- Run geth-node script on tmux to automate the node startup process
