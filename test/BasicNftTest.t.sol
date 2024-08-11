// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {BasicNft} from "src/BasicNft.sol";

contract BasicNftTest is Test {
  DeployBasicNft public deployer;
  BasicNft public basicNft;

  function setUp() public {
    deployer = new DeployBasicNft();
    basicNft = deployer.run();
  }

  function testNameIsCorrect() public view {
    string memory expectedName = "Doggie";
  }

}
