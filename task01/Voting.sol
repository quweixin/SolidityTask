// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {

    //记录每个人获得投票数
    mapping(string => uint256) public votes;

    // //记录已投票的的人
    // mapping(address => bool) private hashVoted;

    //事件：有人投票时触发
    event Voted(string indexed candidate,uint256 votesCount);

    address public owner ;

    string[] public candidates ;

    constructor() {
        owner = msg.sender;
        // candidates.push("Tony");
        // candidates.push("James");
        // candidates.push("John");
        // candidates.push("Tom");
    }

    function addCandidate(string memory candidate) public {
        candidates.push(candidate);
    }

    //投票函数，记录每个人获得的投票数
    function vote(string memory candidate) public {
        // requeire 当检查条件不成立的时候，就会抛出异常。
        // require(!hashVoted[msg.sender],"You have already voted.");
        votes[candidate] += 1;
        // hashVoted[msg.sender] = true;
        emit Voted(candidate,votes[candidate]);
    }

    // 查询得票数函数
    function getVotes(string memory candidate) public view returns (uint256){
        return votes[candidate];
    }

    //清空所有候选人投票数
    function resetVotes() public{
        require(msg.sender == owner, "Not the contract owner");
        for (uint256 i= 0; i<candidates.length;i++) {
            votes[candidates[i]] = 0;
        }
    }

}