// Allows us to use ES6 in our migrations and tests.
require('babel-register')
require('dotenv').config();

var HDWalletProvider = require('truffle-hdwallet-provider');

// Deploys contracts to Rinkeby Test Network
module.exports = {
  networks: {
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(
          process.env.MNEMONIC, 
          `https://rinkeby.infura.io/${process.env.INFURA_API_KEY}`
        )        
      },
      gasPrice: 25000000000,
      network_id: 4
    },
    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: '*' // Match any network id
    }
  },  
    // specify solidity compiler 
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
};
