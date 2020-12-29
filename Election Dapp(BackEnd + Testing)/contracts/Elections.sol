pragma solidity ^0.5.3;

contract Elections{

struct Cands {
    uint id;
    string name;
    uint voteCount;
}

    uint public candsCount;
    mapping (uint => Cands) public candidates;
    mapping (address => bool) public voters;

    event votedEvent( uint indexed _candID);

    constructor()public{
        addCands('Khzr');
        addCands('Zain');
    }

    function addCands(string memory _name) private{
        candsCount++;
        candidates[candsCount] = Cands(candsCount,_name,0);
    }
    
    function vote(uint candID) public{

        require(!voters[msg.sender]);
        require(candID > 0 && candID <= candsCount);

        voters[msg.sender] = true;

        candidates[candID].voteCount++;

       emit votedEvent(candID);
    }
}