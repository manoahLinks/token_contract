// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract TokenContract {

    // token details
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    // mapping an EOA to a balance 
    mapping (address => uint) public balanceOf;
    mapping (address => mapping (address => uint)) allowance;

    // math pure functions
    function _add(uint256 x, uint256 y) internal pure returns (uint256 z) {
        return z = x + y;
    } 

    function _substract(uint256 x, uint256 y) internal pure returns (uint256 z) {
        return z = x -y;
    } 

    // constructur function
    constructor (string memory _name, string memory _symbol, uint8 _decimals) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
    }

    // mint&burn token
    function mint(address _reciever, uint256 _value) public returns (bool success) {
        require(_value > 0, "the min you can mint is 1");
        balanceOf[_reciever] += _value;
        totalSupply = _add(totalSupply, _value);
        return success = true;
    }

    function burn(address _from, uint256 _value) public returns (bool success) {
        balanceOf[_from] -= _value;
        totalSupply = _substract(totalSupply, _value);
        return success = true; 
    }

    // user functions
    function transfer(address _to, uint256 value) public returns (bool) {
        balanceOf[msg.sender] -= value;
        balanceOf[_to] += value;
        return true;
    }

}