●  	A project README.md that explains your project
○  	What does your project do?
○  	How to set it up
■  	Run a local development server

add screenshots as DEMO

# Mercado Descentralized Markeplace

## Overview

 Mercado is a decentralized marketplace running on the Ethereum blockchain where sellers and buyers trade goods paying on Ether. (change this)

- Anyone can list an item. 
- All items can be filtered by category.
- Product images and descritption are stored on IPFS blockchain.
- Product items are also stored on mongoDB as an offchain for easy product querying. 
- Goods can be purchased via MetaMask, trading in Ether
- Mercado makes use of MultiSig Escrow Smart contract to act as descentralized fraud protector intermediary that hoklds ether sent to the smart contract ensure both parts buyer and sellers are covered.


## Build with
[Truffle Webpack Box](https://truffleframework.com/boxes/webpack) boilerplate on Webpack@3.0
[IPFS](http://ipfs.io) for descentralized storage solution and IPFS Javascript library\
[MongoDB]() as offchain solution for product database\
[NodeJS Server]() that connects the frontend with the database

ADD LIBRARIES

## Coding Style
This repo uses JS Standard and Solidity.

## Running
The Web3 RPC location will be picked up from the truffle.js file.


`ganache-cli` - starts a private blockchain with ten test accounts on port 8585

`ipfs daemons` - starts IPFS server on port 8080 [or 4001 and 5001]

`localhost:5001/webui` - for IPFS Web User Inteface

`node server.js` - to srtat NodeJS server at port 3000 (node_modules/.bin/nodemon server.js)



`npm run dev` - to serve dapp frontend on  <http://localhost:8080> or <http://localhost:8081>

`mongod` - starts mongoDB on port 27017

`mongo` - query database

`truffle migrate` - compile and migrate contracsts


#### Clone this repo


`npm install` - Make sure testrpc is running on its default port. 

`npm run start` - Starts the development server

`truffle test` - Run the test suite