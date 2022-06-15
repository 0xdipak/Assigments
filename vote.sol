//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract cityPoll {

    struct City {
        uint cityId;
        string cityName;
        uint vote;
    }

    mapping(uint => City)  public cities;
    mapping(address => bool) public hasVoted;

    address owner;

    uint public cityCount = 0;

    constructor()  {
        owner == msg.sender;
        addCity("KTM");
        addCity("PKH");
        addCity("CTWN");
    }

    function addCity(string memory cityName) public {
        cityCount++;
        cities[cityCount] = City(cityCount, cityName, 0);
    } 

    function vote(uint _cityId) public {
        cities[_cityId].vote += 1;
        hasVoted[msg.sender] = true;
    }

    function getCity(uint _cityId) public view returns(string memory) {
        return cities[_cityId].cityName;
    }

    function getVote(uint _cityId) public view returns(uint) {
        return cities[_cityId].vote;
    }
}
