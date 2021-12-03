// SPDX-License-Identifier: GPL-3.0-only
/*
    Author  : Javier Guajardo
    Github  : https://github.com/ethereumchile
    Twitter : @ethereumchile
    Website : https://ethereumchile.cl
    Date    : 03/12/2021
*/

pragma solidity >=0.7.0 <=0.9.0;
pragma solidity >=0.7.0 <=0.9.0;

contract UserContract {
    struct User {
        bool isBanned;
        bool isRegistered;
        string nickname;
        uint256 dateRegistration;
        uint256 dateBan;
        uint256 postCounter;
    }
    struct UserReport {
        string reason;
        uint256 date;
        bool sent;
    }

    mapping(address => User) public user;
    mapping(address => mapping(address => UserReport)) public userReports;
    mapping(address => mapping(address => bool)) public following;
    mapping(address => mapping(address => bool)) public followers;

    modifier onlyActiveUser() {
        require(
            !user[msg.sender].isBanned && user[msg.sender].isRegistered,
            "User doesn't exist or banned"
        );
        _;
    }

    function createAccount(string memory nickname) public returns (bool) {
        require(!user[msg.sender].isRegistered && bytes(nickname).length > 0);
        user[msg.sender].nickname = nickname;
        user[msg.sender].dateRegistration = block.timestamp;
        user[msg.sender].isRegistered = true;
        return true;
    }

    function deleteAccount() public onlyActiveUser returns (bool) {
        delete user[msg.sender];
        return true;
    }

    function followUser(address userAccount)
        public
        onlyActiveUser
        returns (bool)
    {
        require(user[userAccount].isRegistered && !user[userAccount].isBanned);
        following[msg.sender][userAccount] = true;
        followers[userAccount][msg.sender] = true;
        return true;
    }

    function unfollowUser(address userAccount)
        public
        onlyActiveUser
        returns (bool)
    {
        require(user[userAccount].isRegistered && !user[userAccount].isBanned);
        delete following[msg.sender][userAccount];
        return true;
    }

    function checkFollow(address userAccount)
        public
        view
        onlyActiveUser
        returns (bool)
    {
        return following[msg.sender][userAccount];
    }

    function checkFollowme(address userAccount)
        public
        view
        onlyActiveUser
        returns (bool)
    {
        return following[userAccount][msg.sender];
    }

    function reportUser(address userAccount, string memory reason)
        public
        onlyActiveUser
        returns (bool)
    {
        require(
            !userReports[userAccount][msg.sender].sent,
            "You can report a user only once, thank you"
        );
        UserReport memory report;
        report.reason = reason;
        report.date = block.timestamp;
        report.sent = true;
        userReports[userAccount][msg.sender] = report;
        return true;
    }
}
