// 
Run a local development server 
// clean up other comments
add screenshots as DEMO

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

Link to the project: [http://10.4.4.183:8005]() 


## Build with
[Truffle Webpack Box](https://truffleframework.com/boxes/webpack) boilerplate on Webpack@3.0.

[IPFS](http://ipfs.io) for descentralized storage solution and IPFS Javascript library.

[Lite-server]() library as development server to serve the front end interface of the application.

[MongoDB]() as offchain solution for product database.

[NodeJS Server]() that connects the frontend with the database.


## Other commands

`ganache-cli` - starts a private blockchain with ten test accounts on port 8585

`ipfs daemons` - starts IPFS server on port 8080 [or 4001 and 5001]

`localhost:5001/webui` - for IPFS Web User Inteface

`node server.js` - to start NodeJS server at port 3000 (node_modules/.bin/nodemon server.js)

`npm run dev` - to serve dapp frontend on external link <http://10.4.4.183:8005> or local host <http://localhost:8085>.

`mongod` - starts mongoDB

`mongo` - query database

`truffle migrate` - compile and migrate contracsts


#### Clone this repo


`npm install` - Make sure testrpc is running on its default port. 

`npm run start` - Starts the development server

`truffle test` - Run the test suite

## Coding Style
This repo uses JS Standard and Solidity.
