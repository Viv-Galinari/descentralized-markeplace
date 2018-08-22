/** Escrow contract will create 2 out of 3 multi-signature contract 
* acting as the decentralized arbiter between buyers and sellers
* ensuring all conditions are met and transaction is done effectevelly.
*
*
* Logic: the contract will store ether sent from the buyer
* and needs two out of three votes to release amount to the seller
* or it will refund amount back to the buyer
* 
*/

pragma solidity ^0.4.23;


/** @title Escrow contract for products sold. */
contract Escrow {
    
    // declare all global variables.
    address public buyer;
    address public seller;
    address public arbiter;

    // creates a escrow contract for each product sold.
    uint public productId;
    uint public amount;

    // Keep tracking of who calls release or refund functions.
    mapping(address => bool) releaseAmount;
    mapping(address => bool) refundAmount;

    // Keep tracking of voting counting, as it relies on 'two out of three voting' logic.
    uint public releaseCount;
    uint public refundCount;

    // settles transaction.
    bool public fundsDisbursed;

    // Will restrict the access of the refund or release functions to the owner only.
    address public owner;

     /** Constructor that initiates an escrow contract each time the 'buyProduct' function is called.
      * function marked as payable as it receives ether. 
      * @param _productId id of the product.
      * @param _buyer address of the buyer.
      * @param _seller address of the seller.
      * @param _arbiter address of the arbiter, which is the last account provided by ganache-cli.
      */ 
    constructor(uint _productId, address _buyer, address _seller, address _arbiter) payable public {
        buyer = _buyer;
        seller = _seller;
        arbiter = _arbiter;
        fundsDisbursed = false;
        amount = msg.value;
        // is whoever calls the 'buyProduc()' function and initiate the constructor.
        owner = msg.sender; 
        productId = _productId;
    }
    
    /** @dev Gets Scrow info of a contract.
      * @return address Address of buyer.
      * @return address Address of seller.
      * @return address Address of arbiter.
      * @return bool Boolean value of funds been disbursed.
      * @return uint Tracks releaseCount values.
      * @return uint Tracks refundCount values.
      */
    function escrowInfo() view public returns (address, address, address, bool, uint, uint) {
        return (buyer, seller, arbiter, fundsDisbursed, releaseCount, refundCount);        
    }
    
     
    /** @dev Release amount to the seller if two out of three votes are true.
      * @param caller of the voter.
      */
    function releaseAmountToSeller(address caller) public {
        require(fundsDisbursed == false);
        require(msg.sender == owner);
        if ((caller == buyer || caller == seller || caller == arbiter) && releaseAmount[caller] != true) {
            releaseAmount[caller] = true;
            releaseCount += 1;
        }
        
        if (releaseCount == 2) {
            seller.transfer(amount);
            // ends transaction
            fundsDisbursed = true;
        }
    }
    
   /** @dev Release amount back to the seller if two out of three votes are true.
      * @param caller of the voter.
      */   
    function refundAmountToBuyer(address caller) public {
        require(fundsDisbursed == false);
        require(msg.sender == owner);
        if ((caller == buyer || caller == seller || caller == arbiter) && refundAmount[caller] != true) {
            refundAmount[caller] = true;
            refundCount += 1;
        }
        
        if (refundCount == 2) {
            buyer.transfer(amount);
            fundsDisbursed = true;
        }
    }  
    
}
