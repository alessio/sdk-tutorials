#!/usr/bin/env bash

set -e

shopt -s expand_aliases

alias nsd=$(pwd)/nsd
alias nscli=$(pwd)/nscli

rm -rf ~/.nsd
rm -rf ~/.nscli

nsd init test --chain-id=namechain

nscli config output json
nscli config indent true
nscli config trust-node true
nscli config chain-id namechain
nscli config keyring-backend test

jackseed='sport eternal despair major raccoon arrest zoo magic measure ensure relief multiply priority paper reveal scrap know word lawn wagon elbow trumpet unveil young'
aliceseed='fork digital rare coin permit couch business energy session arm icon profit rule peasant ability walk office open hawk churn special over excite vessel'
fooseed='laugh circle useless shift maze quantum ribbon auction check pledge toilet ripple hobby radio indoor nice segment torch crucial ecology omit jaguar aunt later'
barseed='frown attack build change parade way brand advice voice basket panda marble reduce renew paper suspect arch club ketchup toddler include deal leader float'

nscli keys add --recover jack <<<"${jackseed}"
nscli keys add --recover alice <<<"${aliceseed}"
nscli keys add --recover foo <<<"${fooseed}"
nscli keys add --recover bar <<<"${barseed}"

nsd add-genesis-account $(nscli keys show jack -a) 1000nametoken,100000000stake
nsd add-genesis-account $(nscli keys show alice -a) 1000nametoken,100000000stake
nsd add-genesis-account $(nscli keys show foo -a) 10000nametoken,1000000stake
nsd add-genesis-account $(nscli keys show bar -a) 10000nametoken,1000000stake

nsd gentx --name jack --keyring-backend test

echo "Collecting genesis txs..."
nsd collect-gentxs

echo "Validating genesis file..."
nsd validate-genesis

for keyname in jack alice foo bar; do
  nscli keys show --address $keyname
done
