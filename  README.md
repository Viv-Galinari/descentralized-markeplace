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


## Running

Link to the project: Mercado International (https://www.mercado.international)

Or clone this repo and run `npm run dev` to serve dapp with lite-server.

-  Running on Ropsten testnet (or Rinkeby). 
Proposed gas price: 11 Wei, according to Etherscan
(https://etherscan.io/gastracker)




## Build with
[Truffle Webpack Box](https://truffleframework.com/boxes/webpack) boilerplate on Webpack@3.0 to build, compile and test.

[IPFS](http://ipfs.io) for descentralized storage solution and IPFS Javascript library.

[Lite-server]() library as development server to serve the front end interface of the application.

[MongoDB]() as offchain solution for product database.

[NodeJS Server]() that connects the frontend with the database.


## Other commands



`ganache-cli` - starts a local and private blockchain with ten test accounts on port 8585

`ipfs daemons` - starts IPFS server on port 8080 [or 4001 and 5001]

`localhost:5001/webui` - for IPFS Web User Inteface

`node server.js` - to start NodeJS server at port 3000 (node_modules/.bin/nodemon server.js)



`mongod` - starts mongoDB

`mongo` - query database

`truffle migrate` - compile and migrate contracsts


## Coding Style
This repo uses JS Standard and Solidity.
