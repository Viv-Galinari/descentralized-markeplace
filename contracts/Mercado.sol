pragma solidity ^0.4.23;

import "contracts/Escrow.sol";

/** @title Mercado contract. */
contract Mercado {
    
    enum ProductCondition {New, Used}    
    uint public productIndex;

    // Using last account provided by ganache-cli as arbiter of the contract
    address public arbiter;
    
    // defines the store owner
    mapping (address => mapping(uint => Product)) stores;
    mapping (uint => address) productIdInStore;

    // stores the productEscrow on an individual address 
    mapping (uint => address) productEscrow;

    // defines the product
    struct Product {
        uint id;
        string name;
        string category;
        string imageLink;
        string descLink;
        uint startTime;
        uint price;
        ProductCondition condition;
        address buyer;
    }

    // Sets an event to fire each time a new product is added to the store
    event NewProduct(uint _productId, string _name, string _category, string _imageLink,
                    string _descLink, uint _startTime, uint _price, uint _productCondition);

    /** Constructor that initiates a contract
      * @param _arbiter address of the arbiter
      */ 
    constructor(address _arbiter) public {
        productIndex = 0;
        arbiter = _arbiter;
    }

    /** @dev that initiates an escrow contract each time the 'buyProduct' function is called.
      * @param _name name of the product.
      * @param _category category of the product.
      * @param _imageLink product image stored on IPFS.
      * @param _descLink product description stored on IPFS.
      * @param _startTime time stored in seconds.
      * @param _price price of the product in wei.
      * @param _productCondition New defined as 0 and Used defined as 1 as product condition.
      */ 
    function addProductToStore(string _name, string _category, string _imageLink,
        string _descLink, uint _startTime, uint _price, uint _productCondition) public {
        // add products to store and increment by one
        productIndex += 1;
        //create a Product out of Product Struct in the memory
        Product memory product = Product(productIndex, _name, _category, _imageLink,
            _descLink, _startTime, _price, ProductCondition(_productCondition), 0);
        stores[msg.sender][productIndex] = product;
        productIdInStore[productIndex] = msg.sender;
        emit NewProduct(productIndex, _name, _category, _imageLink, _descLink, _startTime,
                       _price, _productCondition);
    }

     /** @dev Gets Product info.
      * @param _productId Id of the product.
      */  
    function getProduct(uint _productId) public view returns (uint, string, string, string,
        string, uint, uint, ProductCondition, address) {
        
        Product memory product = stores[productIdInStore[_productId]][_productId];
        return (product.id, product.name, product.category, product.imageLink,
            product.descLink, product.startTime, product.price,
            product.condition, product.buyer);
    }


    /** @dev Gets Product info.
      * @param _productId Id of the product.
      */  
    function buyProduct(uint _productId) payable public {
        Product memory product = stores[productIdInStore[_productId]][_productId];
        require(product.buyer == address(0));
        require(msg.value >= product.price);
        product.buyer = msg.sender;
        stores[productIdInStore[_productId]][_productId] = product;

        /** creates a new instance of escrow contract for each time a product is sold
        * calling the value of the product and passing all the arguments of the escrow contractor 
        */
        Escrow escrow = (new Escrow).value(msg.value)(_productId, msg.sender, productIdInStore[_productId], arbiter);

        // assign current escrow to product escrow of specific product Id
        productEscrow[_productId] = escrow;
    }

     /** @dev Gets Escrow info.
      * @param _productId Id of the product.
      * @return address Address of buyer.
      * @return address Address of seller.
      * @return address Address of arbiter.
      * @return bool Boolean value of funds been disbursed.
      * @return uint Tracks releaseCount values.
      * @return uint Tracks refundCount values.
      */  
    function escrowInfo(uint _productId) view public returns (address, address, address, bool, uint, uint) {
      return Escrow(productEscrow[_productId]).escrowInfo();
    }

  
     /** @dev Function to release amount to seller.
      * @param _productId Id of the product.
      */  
    function releaseAmountToSeller(uint _productId) public {
      Escrow(productEscrow[_productId]).releaseAmountToSeller(msg.sender);
    }
    
     /** @dev Function to release amount to buyer.
      * @param _productId Id of the product.
      */  
    function refundAmountToBuyer(uint _productId) public {
      Escrow(productEscrow[_productId]).refundAmountToBuyer(msg.sender);
    
    }    
}


