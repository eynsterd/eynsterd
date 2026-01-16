// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Countereynsterd is ERC20 {
    address public owner;

    // El token se llama Countereynsterd y su símbolo es CEYN
    constructor() ERC20("Countereynsterd", "CEYN") {
        owner = msg.sender;
    }

    function premiarDescarga(address usuario) public {
        require(msg.sender == owner, "Solo el admin premia");
        _mint(usuario, 10 * 10**decimals());
    }
}