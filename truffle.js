// Allows us to use ES6 in our migrations and tests.
require('babel-register')


module.exports = {
  // specify solidity compiler 
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
  networks: {
    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: '*' // Match any network id
    }
  }
};
