# Mercado Descentralized Markeplace

## Overview

 Mercado is a decentralized trading platform running on the Ethereum blockchain.

- Anyone can list an item. 
- All items can be filtered by category.
- Product images and descritption are stored on IPFS blockchain.
- Product items are also stored on mongoDB as offchain solution for easy product querying.
- Goods can be purchased via MetaMask, paying in Ether.
- Mercado uses MultiSig Smart contract as a descentralized fraud protector intermediary between buyers and sellers.
- And uses Lite-Server library to serve static files.


## Running the project deployed on the web

Link to the project: Mercado International (http://www.mercado.international)
- Requires Metamask chrome extension to complete transactions.

-  Running on ROPSTEN testnet. Proposed gas price: 11 Wei, according to Etherscan
(https://etherscan.io/gastracker)
- Request Ropsten Ether Faucet for testing purposes: (https://faucet.metamask.io/) or (https://faucet.ropsten.be/)

-  Deployed on Rinkeby testnet, however with limited access.


## Running on localhost

- Clone this repo and on the root folder (and on different terminal tabs)

`npm i` to install dependencies

`npm install -g ganache-cli` to download Ganache-cli AND `ganache-cli` to start a local and private blockchain with ten test accounts on port 8585

`cd go-ipfs` to go to IPFS directory within the project AND `./ipfs daemon` to start IPFS server on port 8080 [or 4001 and 5001] - make sure to be on 'go-ipfs' folder.

`npm run dev` on root directory to serve dapp locally with lite-server.  

`node server.js` to start NodeJS server which will communicate with MongoDB 

`brew install mongodb` to install mongo database (offchain solution) and other possible usefull commands: `mongod` to start mongoDB and `mongo` to query database if needed.

`truffle compile` - compile and migrate contracsts
`truffle migrate` - compile and migrate contracsts
`truffle test` -  test contracts


## Build with
[Truffle Webpack Box](https://truffleframework.com/boxes/webpack) boilerplate on Webpack@3.0 to build, compile and test.

[IPFS](http://ipfs.io) for descentralized storage solution and IPFS Javascript library.

[Lite-server]() library as development server to serve the front end interface of the application.

[MongoDB]() as offchain solution for product database.

[NodeJS Server]() that connects the frontend with the database.

[Ropsten]() and [Rinkeby]() testnet.


## Coding Style
This repo uses JS Standard and Solidity.
