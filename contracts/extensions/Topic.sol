// SPDX-License-Identifier: GPL-3.0-only
/*
    Author  : Javier Guajardo
    Github  : https://github.com/ethereumchile
    Twitter : @ethereumchile
    Website : https://ethereumchile.cl
    Date    : 03/12/2021
*/

pragma solidity >=0.7.0 <=0.9.0;

import "./User.sol";

contract TopicContract is UserContract {
    struct Topic {
        string description;
        bool isActive;
    }

    mapping(bytes32 => Topic) public topic;
    mapping(bytes32 => mapping(address => bool)) public topicUsers;

    function createTopic(bytes32 name, string memory description)
        public
        onlyActiveUser
        returns (bool)
    {
        require(!topic[name].isActive);
        topic[name].isActive = true;
        topic[name].description = description;
        topicUsers[name][msg.sender] = true;
        return true;
    }

    function joinTopic(bytes32 name) public onlyActiveUser returns (bool) {
        require(!topicUsers[name][msg.sender] && topic[name].isActive);
        topicUsers[name][msg.sender] = true;
        return true;
    }

    function leaveTopic(bytes32 name) public onlyActiveUser returns (bool) {
        require(topicUsers[name][msg.sender] && topic[name].isActive);
        delete topicUsers[name][msg.sender];
        return true;
    }
}
