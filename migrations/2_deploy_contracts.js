var Mercado = artifacts.require("./Mercado.sol");

module.exports = function(deployer) {
  // pass the last account of ganache as the arbiter of the contract
  deployer.deploy(Mercado, web3.eth.accounts[9]);
};

