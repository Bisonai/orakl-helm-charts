#!/bin/bash

# Define an array containing the file names for adapters and aggregators
adapter_files=(
  "bnb-usdt.adapter.json"
  "btc-usdt.adapter.json"
  "busd-usdt.adapter.json"
  "dai-usdt.adapter.json"
  "dot-usdt.adapter.json"
  "eth-usdt.adapter.json"
  "klay-usdt.adapter.json"
  "matic-usdt.adapter.json"
  "sol-usdt.adapter.json"
  "trx-usdt.adapter.json"
  "usdc-usdt.adapter.json"
)

aggregator_files=(
  "bnb-usdt.aggregator.json"
  "btc-usdt.aggregator.json"
  "busd-usdt.aggregator.json"
  "dai-usdt.aggregator.json"
  "dot-usdt.aggregator.json"
  "eth-usdt.aggregator.json"
  "klay-usdt.aggregator.json"
  "matic-usdt.aggregator.json"
  "sol-usdt.aggregator.json"
  "trx-usdt.aggregator.json"
  "usdc-usdt.aggregator.json"
)

# Register the adapters
for file in "${adapter_files[@]}"
do
  yarn cli adapter insert --source https://bisonai.github.io/orakl-config/adapter/"$file"
done


for file in "${aggregator_files[@]}"
do
  yarn cli aggregator insert --chain baobab --source https://bisonai.github.io/orakl-config/aggregator/baobab/"$file"
done
