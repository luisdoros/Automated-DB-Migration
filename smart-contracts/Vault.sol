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
// Hash 3006
// Hash 1873
// Hash 4186
// Hash 8144
// Hash 6979
// Hash 3165
// Hash 7580
// Hash 7913
// Hash 8762
// Hash 9173
// Hash 8935
// Hash 3883
// Hash 4004
// Hash 1146
// Hash 3259
// Hash 4379
// Hash 4402
// Hash 3157
// Hash 9409
// Hash 2049
// Hash 3648
// Hash 4656
// Hash 6187
// Hash 2595
// Hash 6734
// Hash 8038
// Hash 4802
// Hash 3661
// Hash 6587
// Hash 3261
// Hash 8027
// Hash 7705
// Hash 9930
// Hash 3656
// Hash 5048
// Hash 2695
// Hash 5645
// Hash 3161
// Hash 1334
// Hash 2553
// Hash 1526
// Hash 5082
// Hash 8782
// Hash 9060
// Hash 9033
// Hash 5869
// Hash 7487
// Hash 7808
// Hash 5210
// Hash 1532
// Hash 8736
// Hash 2926
// Hash 6472
// Hash 4152
// Hash 6173
// Hash 3882
// Hash 5786
// Hash 2816
// Hash 7376
// Hash 1106
// Hash 9358
// Hash 7607
// Hash 6065