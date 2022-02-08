#!/bin/bash

#Init Chain
./go-ethereum/build/bin/geth init genesis.json --datadir ./node1
./go-ethereum/build/bin/geth init genesis.json --datadir ./node2
./go-ethereum/build/bin/geth init genesis.json --datadir ./node3

#Copy keystores
cp config/keystore/UTC--2022-01-18T06-13-40.102714000Z--065cac36eaa04041d88704241933c41aabfe83ee node1/keystore
cp config/keystore/UTC--2022-01-18T06-15-39.746684000Z--9456c31c95315f15efd76806ad6aa783d0bc5425 node2/keystore
cp config/keystore/UTC--2022-01-19T11-29-34.056195000Z--de88ea17ed4f11af598a8a466152230449162cbb node3/keystore

#Copy nodekeys
cp config/nodekeys/nodekey1 node1/geth/nodekey
cp config/nodekeys/nodekey2 node2/geth/nodekey
cp config/nodekeys/nodekey3 node3/geth/nodekey
