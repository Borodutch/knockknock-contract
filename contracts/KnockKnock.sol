// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/interfaces/IERC1155.sol";
import "./IWithBalanceOf.sol";

contract KnockKnock is Ownable {
  IERC1155 public hostContract;

  event Knock(address indexed _from);

  constructor(address _hostContract) Ownable(msg.sender) {
    hostContract = IERC1155(_hostContract);
  }

  function setHostContract(address _hostContract) external onlyOwner {
    hostContract = IERC1155(_hostContract);
  }

  function knock() external {
    require(
      hostContract.balanceOf(msg.sender, 1) > 0,
      "You don't have any balance"
    );
    emit Knock(msg.sender);
  }
}
