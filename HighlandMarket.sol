// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HighlandMarket is ERC20, Ownable {

    mapping(uint256 => uint256) public VeggiePrices;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        VeggiePrices[1] = 200;
        VeggiePrices[2] = 130;
        VeggiePrices[3] = 120;
        VeggiePrices[4] = 50;
    }


    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _to, _amount);
    }

    function VeggiesItems() external pure returns (string memory) {
        string memory saleOptions = "The Vegtables on sale: {1} Pumpkin (200) {2} Broccoli (130) {3} Leeks (120) {4} Carrot (50)";
        return saleOptions;
    }

    function redeemitem(uint256 _item) public {
        require(VeggiePrices[_item] > 0, "Item is not available.");
        require(_item <= 4, "Item is not available.");
        require(balanceOf(msg.sender) >= VeggiePrices[_item], "Redeem Failed: Insufficient balance.");
        transfer(owner(), VeggiePrices[_item]);
    }
    
    function burn(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function decimals() override public pure returns (uint8) {
        return 18;
    }

    
}
