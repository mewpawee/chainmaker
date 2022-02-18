#!/bin/bash

argument=$1
node=$2
case $argument in
    "account")
        #Create new Account
        ./go-ethereum/build/bin/geth account new --password config/password.txt --datadir config | grep "Public address of the key" | tr -d " " | cut -d ":" -f2
        ;;
    "init")
        #Init Chain
        echo "Initiate Chain..."
        ./go-ethereum/build/bin/geth init config/genesis.json --datadir ./node1
        ./go-ethereum/build/bin/geth init config/genesis.json --datadir ./node2
        ./go-ethereum/build/bin/geth init config/genesis.json --datadir ./node3

        #Copy keystores
        echo "Copy Keystores..."
        cp config/keystore/UTC--2022-01-18T06-13-40.102714000Z--065cac36eaa04041d88704241933c41aabfe83ee node1/keystore
        cp config/keystore/UTC--2022-01-18T06-15-39.746684000Z--9456c31c95315f15efd76806ad6aa783d0bc5425 node2/keystore
        cp config/keystore/UTC--2022-01-19T11-29-34.056195000Z--de88ea17ed4f11af598a8a466152230449162cbb node3/keystore

        #Copy nodekeys
        echo "Copy Nodekeys..."
        cp config/nodekeys/nodekey1 node1/geth/nodekey
        cp config/nodekeys/nodekey2 node2/geth/nodekey
        cp config/nodekeys/nodekey3 node3/geth/nodekey
        ;;
    "clean")
        #Remove datadirs
        echo "Cleaning up..."
        rm -rf node1
        rm -rf node2
        rm -rf node3
        ;;
    "start")
        #Start node
        echo "Starting node..."
        case $node in
            "node1")
                ./go-ethereum/build/bin/geth --allow-insecure-unlock --http --http.api personal,eth,net,web3 --ethstats 'node1:asdf@localhost:3000' --datadir node1 --unlock 0x065cac36eaa04041d88704241933c41aabfe83ee --password config/password.txt --mine --nodiscover --config config/config.toml
                ;;
            "node2")
                ./go-ethereum/build/bin/geth --ethstats 'node2:asdf@localhost:3000' --datadir node2 --unlock 0x9456c31c95315f15efd76806ad6aa783d0bc5425 --password config/password.txt --mine --port 30304 --nodiscover --config config/config.toml
                ;;
            "node3")
                ./go-ethereum/build/bin/geth --ethstats 'node3:asdf@localhost:3000' --datadir node3 --unlock 0xde88ea17ed4f11af598a8a466152230449162cbb --password config/password.txt --mine --port 30305 --nodiscover --syncmode full --config config/config.toml
                ;;
        esac
esac

echo "Done!"
