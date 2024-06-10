// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WarlandGame is ERC20, Ownable {

    mapping(uint256 => uint256) public GameCharacters;
    mapping(address => uint256) public redeemedItems;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        GameCharacters[1] = 100; // Cava
        GameCharacters[2] = 200; // Lily
        GameCharacters[3] = 300; // Roby
        GameCharacters[4] = 400; // Bell
    }


    function mintDGN(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _to, _amount);
    }

    function showGameCharacters() external pure returns (string memory) {
        string memory saleOptions = "The Game Characters is on sale: {1} Cava (100) {2} Lily (200) {3} Roby (200) {4} Bell (400)";
        return saleOptions;
    }

    function buyCharacters(uint256 _item, address _recipient) public {
        require(GameCharacters[_item] > 0, "Item is not available.");
        require(_item <= 4, "Item is not available.");
        require(balanceOf(msg.sender) >= GameCharacters[_item], "Buy Failed: Insufficient balance.");
        
        redeemedItems[_recipient] = _item;
        transfer(owner(), GameCharacters[_item]);
    }

    function hasRedeemedItem() external view returns (uint256) {
        return redeemedItems[msg.sender];
    }
    
    function burnDGN(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

}
