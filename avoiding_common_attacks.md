## Avoiding Common Attacks

- This project has been tested using Unit test provided by Truffle suite to ensure logic bugs were detected at run-time.

 - Used Require Statements to ensure only the right users should have access to certain functions.

 - Included Arbiter address and multisig contract to prevent buyers and sellers from abusing their privilegues in the system.

 - Used off-chain database to query products and do not overload the blockchain.

 - Used IPFS to encrypt product images and description and hash them in the blockchain.

 - Used 'msg.sender' in all instances instead of unsecure 'tx.origin' instances.

 - Used default  uint256 to avoid integer overflow.

