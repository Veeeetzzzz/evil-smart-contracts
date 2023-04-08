# Evil Smart Contracts

A collection of nefariously built smart contracts - for educational purposes only. 

## Prerequisites

- [Node.js](https://nodejs.org/en/download/) (v14.x recommended)
- [Truffle](https://www.trufflesuite.com/truffle) (v5.x recommended)
- [Ganache](https://www.trufflesuite.com/ganache) or a running Ethereum node (optional)
- [MetaMask](https://metamask.io/) or other Ethereum wallet (optional)

## Setup

1. Clone the repository: 

`git clone https://github.com/Veeeetzzzz/evil-smart-contracts.git`

`cd evil-smart-contracts`

2. Install dependencies:

`npm install`

3. Compile the contract:

`truffle compile`

This command will compile the `.sol` file in the `contracts/` directory.

## Deployment

1. Set up your network configuration in `truffle-config.js`:

```javascript
networks: {
  development: {
    host: "127.0.0.1",
    port: 7545, // Change this to your Ethereum node's port
    network_id: "*" // Match any network id
  }
}
```
# Interact with the contract

You can use Truffle Console to interact with your deployed contract:

`truffle console --network development`

Replace development with the appropriate network name if you're interacting with a contract deployed on a testnet or mainnet.

In the console, you can interact with your contract using its ABI and deployed address.

For example, if your contract is named MyContract, you can load the deployed instance:

`const myContract = await MyContract.deployed()`

And then call the functions of the contract:

`await myContract.myFunction()`

Replace myFunction with the name of the function you want to call.
