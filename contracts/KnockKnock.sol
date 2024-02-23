// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./IWithBalanceOf.sol";

contract KnockKnock is Ownable {
  IWithBalanceOf public hostContract;

  event Knock(address indexed _from);

  constructor(address _hostContract) Ownable(msg.sender) {
    hostContract = IWithBalanceOf(_hostContract);
  }

  function setHostContract(address _hostContract) external onlyOwner {
    hostContract = IWithBalanceOf(_hostContract);
  }

  function knock() external {
    require(
      hostContract.balanceOf(msg.sender) > 0,
      "You don't have any balance"
    );
    emit Knock(msg.sender);
  }
}
