pragma solidity >=0.4.22 <0.8.8;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Voting.sol";

contract TestVoting {
    Voting voting = Voting(DeployedAddresses.Voting()); //call the functions inside of Voting contracts

    uint256 expectedLocationId = 8; //This is the expected voted location for these test

    address expectedVotedLocation = address(this); //return the address of the voted location

    function testUserCanVoteLocation() public {
        uint256 returnedId = voting.vote(expectedLocationId); // calling the function vote from the voting contract. And then we set the expectedLocationId to 8

        Assert.equal(
            returnedId,
            expectedLocationId,
            "User was able to vote for the expected location and expectedVotedLocation should match what is returned."
        );
    }

    function testGetVotedLocationAddressByLocationId() public {
        address location = voting.locations(expectedLocationId); //return the address in the blockchain for this location ID

//  compare the address in the blockchain of the location that was voted with the one that we are expecting
        Assert.equal(
            location,
            expectedVotedLocation,
            "Voted Location of the expected location should be this contract"
        );
    }

//get the location in memory rather than in contract storage since the memory attribute means Solidity will temporarily store the value in memory.
    function testGetVotedLocationAddressByLocationIdInArray() public {
        address[16] memory locations = voting.getLocations(); //return the array of the locations

        Assert.equal(
            locations[expectedLocationId],
            expectedVotedLocation,
            "Voted location of the expected location should be this contract"
        );
    }
}