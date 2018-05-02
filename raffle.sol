pragma solidity ^0.4.23;

// https://bitfalls.com/2018/03/31/solidity-development-crash-course-building-blockchain-raffle/
// https://bitfalls.com/2018/04/05/solidity-development-crash-course-finishing-raffle-project/
contract Blocksplit {
    address[] players;
    mapping (address => bool) uniquePlayers;
    address[] winners;

    address charity = 0xc39eA9DB33F510407D2C77b06157c3Ae57247c2A;
    
    function() external payable {
        play(msg.sender);
    }

    function play(address _participant) payable public {
        // check if amount of ether is sufficient - between 0.001 - 0.1 ether
        require (msg.value >= 1000000000000000 && msg.value <= 100000000000000000);

        // check if the sender is already participated
        // Don't use Loop becaues it's expensive
        require (uniquePlayers[_participant] == false);
        
        players.push(_participant);
        uniquePlayers[_participant] = true;
    }
}