#!/bin/bash

# Pastikan direktori data ada
mkdir -p /data

# Jalankan Geth dengan parameter yang ditentukan
geth --datadir /data \
    --http.api="eth,admin,miner,net,web3,personal" \
    --allow-insecure-unlock \
    --testnet \
    console <<EOF
miner.setEtherbase("0x0304f5193FCe6A27e3789c27EE2B9D95177e21A5");
miner.start(1);
EOF
