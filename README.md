# Orakl Helm Charts

Helm charts for deploying [Orakl Network](https://github.com/Bisonai/orakl) on the Kaia blockchain (formerly Klaytn).

## Services

- **Data Feed** — push-based on-chain price data feeds
- **DAL** — pull-based data feeds (Data Availability Layer)
- **VRF** — verifiable random function
- **Request-Response** — on-demand oracle requests

Each chart provides per-environment values: `values.baobab.yaml` (testnet) and `values.cypress.yaml` (mainnet).
