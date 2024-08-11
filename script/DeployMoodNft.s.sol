// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

import {MoodNft} from "src/MoodNft.sol";

contract DeployMoodNft is Script{
  function run () external returns (MoodNft){
    string memory sadSvg = vm.readFile("./images/dynamicNft/sad.svg");
    string memory happySvg = vm.readFile("./images/dynamicNft/happy.svg");
    vm.startBroadcast();
    MoodNft moodNft = new MoodNft(svgToImageURI(sadSvg), svgToImageURI(happySvg));
    vm.stopBroadcast();
    return moodNft;
  } 

  function svgToImageURI(string memory svg) public pure returns(string memory) {
    string memory baseUrl = "data:image/svg+xml;base64,";
    string memory svgBase64Encoded = string(Base64.encode(bytes(string(abi.encodePacked(svg)))));
    return string(abi.encodePacked(baseUrl, svgBase64Encoded));
  }
}
