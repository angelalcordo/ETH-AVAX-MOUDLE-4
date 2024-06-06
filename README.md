# Degen Token (ERC-20): Unlocking the Future of Gaming
## Buy Gadgets
ETH Intermediate Module 4 - Degen Token ERC20

## Description

The DegenToken smart contract is an ERC20 token designed for an in-game economy on the Ethereum blockchain. This contract allows the minting and burning of tokens, and it includes functionalities for setting prices for in-game items and redeeming those items using tokens. The contract demonstrates good error handling practices using the require statement to ensure proper conditions before executing critical functions. By implementing these functionalities, this contract provides useful lessons in building secure and reliable smart contracts for decentralized transactions in a gaming context.

## Executing the program

The first requirement to run this program is to use Remix Ethereum IDE (https://remix.ethereum.org/) and create a new files and take note that ".sol" is the (BuGadgetss.sol)Correct file format for running a Solidity Program and compile the contract by selecting the appropriate Solidity compiler version (e.g., 0.8.0 or above) and clicking the "Compile DegenToken.sol" button.

To interact with the DegenToken contract and leverage its functionalities, you can use Remix Ethereum IDE. Begin by creating a new "myown.sol" file and compiling it using a Solidity compiler version 0.8.0 or above. The DegenToken contract, along with the Ownable.sol contract created alongside it, provide the necessary infrastructure for managing ownership and executing restricted functions. After compiling the contract, deploy it by selecting the Ethereum icon on the left sidebar. Once deployed, you can directly interact with its functions within the Remix IDE environment. The mint function facilitates token minting to a specified account, while the burn function allows burning tokens from the sender's account. Using the setItemPrice function, you can establish the price of items in the in-game store by specifying the item ID and the price in tokens. To redeem items from the in-game store, utilize the redeemItem function along with the corresponding item ID. Monitor the contract's behavior in the Remix IDE's "Console" tab, confirming successful function calls through emitted events.

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BuyGadgets is ERC20, Ownable {
```

## Additional Information

Student Info and Email address

National Teachers College

Alcordo, Angel Adellene A.
 
422003173@ntc.edu.ph

## Loom Video Part 1-2

https://www.loom.com/share/123efa3f235f4ea48c188768594d9e76
https://www.loom.com/share/24f9174b4a224676b53a79c4edfc818d
