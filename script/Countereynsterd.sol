// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Countereynsterd} from "../src/Countereynsterd.sol";

contract CountereynsterdScript is Script {
    function run() public {
        vm.startBroadcast();

        // Desplegamos el contrato Countereynsterd
        new Countereynsterd();

        vm.stopBroadcast();
    }
}