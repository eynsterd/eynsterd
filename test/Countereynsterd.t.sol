// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Countereynsterd} from "../src/Countereynsterd.sol";

contract CountereynsterdTest is Test {
    Countereynsterd public countereynsterd;
    address public usuario = address(0x123);

    function setUp() public {
        // Instanciamos el contrato con el nuevo nombre
        countereynsterd = new Countereynsterd();
    }

    function test_NombreCorrecto() public {
        assertEq(countereynsterd.name(), "Countereynsterd");
    }

    function test_PremiarDescarga() public {
        countereynsterd.premiarDescarga(usuario);
        // Verifica que el usuario recibió 10 tokens
        assertEq(countereynsterd.balanceOf(usuario), 10 * 10**18);
    }

    function test_SoloOwnerPuedePremiar() public {
        address noOwner = address(0x999);
        vm.prank(noOwner);
        vm.expectRevert("Solo el admin premia");
        countereynsterd.premiarDescarga(usuario);
    }
}