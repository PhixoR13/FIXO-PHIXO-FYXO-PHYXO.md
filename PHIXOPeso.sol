// SPDX-License-Identifier: CC-BY-4.0
pragma solidity ^0.8.0;

/**
 * @title PHIXO Peso Token Contract
 * @author PhixoR13
 * @notice This work is licensed under Creative Commons Attribution 4.0 International License
 * @dev Implementation of the PHIXO Peso token with ceremonial USD conversion
 */
contract PHIXOPeso {
    string public name = "PHIXO Peso";
    string public symbol = "₱";
    uint8 public decimals = 18;
    uint256 public totalSupply = 5440000000000 * 10**18; // 5.44T ₱
    address public owner = msg.sender;
    mapping(address => uint256) balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        balances[owner] = totalSupply;
    }

    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "transfer to the zero address");
        require(balances[msg.sender] >= _value, "Saldo insuficiente");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Función ceremonial: convertir USD a ₱ (solo para iniciados)
    function convertUSDToPHIXO(uint256 _usdAmount) public pure returns (uint256) {
        return _usdAmount * 9000000; // 1 ₱ = 9,000,000 $
    }
}