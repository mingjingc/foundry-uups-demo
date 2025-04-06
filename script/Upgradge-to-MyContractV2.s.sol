// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Options} from "openzeppelin-foundry-upgrades/Options.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {MyContractV2} from "../src/MyContractV2.sol";

contract UpgradgeToMyContractV2 is Script {
    function run() public {
        // change to your proxy address
        address proxy = 0x33b617AFe60d338F68dFbC0143139ddaD018fc7B;
        vm.startBroadcast();
        Options memory opts;
        Upgrades.upgradeProxy(proxy, "MyContractV2.sol:MyContractV2", "", opts);

        address implAddrV2 = Upgrades.getImplementationAddress(proxy);
        console.log("Proxy upgraded to:", implAddrV2);
        vm.stopBroadcast();
    }
}
