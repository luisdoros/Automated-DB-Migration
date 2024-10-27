// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 6850
// Hash 6748
// Hash 9640
// Hash 8312
// Hash 1166
// Hash 2352
// Hash 4451
// Hash 1992
// Hash 6702
// Hash 6143
// Hash 7527
// Hash 3772
// Hash 2583
// Hash 8714
// Hash 9965
// Hash 2365
// Hash 4173
// Hash 7723
// Hash 9222
// Hash 1100
// Hash 7981
// Hash 3435
// Hash 4998
// Hash 6962
// Hash 8096
// Hash 1230
// Hash 4188
// Hash 7918
// Hash 2534
// Hash 9922
// Hash 5106
// Hash 4699
// Hash 5352
// Hash 5278
// Hash 7473
// Hash 8513
// Hash 8300
// Hash 4985
// Hash 7353
// Hash 4778
// Hash 2905
// Hash 7693
// Hash 7801
// Hash 9946
// Hash 7908
// Hash 3647
// Hash 3562
// Hash 6423
// Hash 3782