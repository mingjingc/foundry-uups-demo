// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {MyContractV1} from "../src/MyContractV1.sol";

contract DeployMyContractV1 is Script {
    function run() public {
        address owner = 0x1d3614b96dE8e194714495f258A43592B83ADC8E;
        vm.startBroadcast();

        address myContractProxy =
            Upgrades.deployUUPSProxy("MyContractV1.sol:MyContractV1", abi.encodeCall(MyContractV1.initialize, (owner)));
        console.log("Proxy deployed to:", myContractProxy);

        vm.stopBroadcast();
    }
}
