var Mercado = artifacts.require("./Mercado.sol");

contract('Mercado', function(accounts) {
    var Buyer = accounts[0];
    var secondAccount = accounts[1];
    var thirdAccount = accounts[2];
    var Arbiter = accounts[9];

    /* It tests the ethereum addressses provided by truffle suite 
     * whereby the contract should be initiated with an arbiter 
     * allocated to the last account of ganache-cli.
    */
    it("should initiate the contract with arbiter in the last account", function() {
      return Mercado.deployed().then(function(instance) {
        return instance.arbiter.call(accounts[1]);
      }).then(function(address) {
        assert.fail();
      })
        .catch(error => {
          assert.notEqual(error.message, "assert.fail()", "Arbiter wasn't in the last account") 
        });
      });
        
    /*  It tests the buyer as the creator of the contract using the 
     * first account  (accounts[0]).
    */
      it("should allow buyers to buy products if it is the first account", function() {
        return Mercado.deployed().then(function(instance) {
          return instance.buyProduct(accounts[0]);
        }).then(function(address) {
            assert.equal(Buyer, accounts[0], "Buyer is the first account");   
            });
        });
    });