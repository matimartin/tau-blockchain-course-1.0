pragma solidity >=0.4.22 <0.8.0;

contract Voting {
    address[16] public locations; //Every account and its smart contracts on the Ethereum blockchain has an address and can send and receive Ether to and from this address

    function vote(uint256 locationId) public returns(uint256) {
        require(locationId >= 0 && locationId <=15);
        locations[locationId] = msg.sender;

        return locationId;
    }

//The view keyword in the function declaration means that the function will not modify the state of the contract.
    function getLocations() public view returns (address[16] memory) { //specify the return type, in this case the type for locations is address[16] memory. memory gives the location in memory for the variable
        return locations;
    }
}