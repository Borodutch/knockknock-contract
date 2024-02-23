// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

interface IWithBalanceOf {
  function balanceOf(address account) external view returns (uint256);
}
