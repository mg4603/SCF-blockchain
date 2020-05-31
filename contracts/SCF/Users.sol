pragma solidity >=0.4.21 <0.7.0;


contract Users{
    mapping(address=> bytes32[])  _user;

    constructor() public{}

    function addContracts(address user, bytes32 id) public{
        _user[user].push(id);
    }

    function getContracts(address user) public view returns(bytes32[] memory)
    {
        bytes32[] memory contracts = _user[user];
        return contracts;
    }

}