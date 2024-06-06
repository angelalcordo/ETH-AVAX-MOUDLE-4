// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BuyGadgets is ERC20, Ownable {

    mapping(uint256 => uint256) public GadgetsPrice;
    mapping(address => mapping(uint256 => uint256)) public playerItems; // player address => (itemId => quantity)

    event ItemRedeemed(address indexed player, uint256 indexed itemId, uint256 amount);
    event ItemDelivered(address indexed player, uint256 indexed itemId, uint256 quantity);

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        GadgetsPrice[1] = 2000;
        GadgetsPrice[2] = 1300;
        GadgetsPrice[3] = 1200;
        GadgetsPrice[4] = 500;
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        transfer(_to, _amount);
    }

    function GadgetsItems() external pure returns (string memory) {
        string memory saleOptions = "The BuyGadgets is on sale: {1} Laptop (2000) {2} Tablet (13000) {3} Camera (1200) {4} Cellphone (500)";
        return saleOptions;
    }

    function redeemitem(uint256 _item) public {
        require(GadgetsPrice[_item] > 0, "Item is not available.");
        require(_item <= 4, "Item is not available.");
        require(balanceOf(msg.sender) >= GadgetsPrice[_item], "Redeem Failed: Insufficient balance.");
        
        // Transfer the token cost to the owner
        transfer(owner(), GadgetsPrice[_item]);
        
        // Deliver the item to the player
        playerItems[msg.sender][_item] += 1;
        
        // Emit events for the redemption and delivery
        emit ItemRedeemed(msg.sender, _item, GadgetsPrice[_item]);
        emit ItemDelivered(msg.sender, _item, 1);
    }
    
    function burn(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Insufficient balance.");
        _burn(msg.sender, _amount);
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function decimals() override public pure returns (uint8) {
        return 18;
    }
}
