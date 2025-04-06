// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "./MyContractStorageV2.sol";

/// @custom:oz-upgrades-from src/MyContractV1.sol:MyContractV1
contract MyContractV2 is MyContractStorageV2, Initializable, OwnableUpgradeable, UUPSUpgradeable {
    function initialize(address initialOwner) public initializer {
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    function setName(string memory _name) external onlyOwner {
        name = _name;
    }

    function setHometown(string memory _hometown) external onlyOwner {
        hometown = _hometown;
    }

    function version() public pure returns (string memory) {
        return "2.0.0";
    }
}
