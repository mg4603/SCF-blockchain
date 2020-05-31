pragma solidity >=0.4.21 <0.7.0;

import "./ContractRecords.sol";
import "./Registerations.sol";
import "./Users.sol";
contract Records {
    Registerations private user_register;
    Users private user_contracts;
    ContractRecords private contract_records;

    constructor()public{}

    function checkUser(address user) public view returns (bool) {
        return user_register.isRegistered(user);

    }

    function registerUser(address user) public {
        user_register.register(user);
    }

   function getRecords(address user) public view returns(bytes32[] memory){
       return user_contracts.getContracts(user);
   }

   function getContractDetails1(bytes32 _id) public view returns(address, address, uint, bytes32,
    bytes32) {
       return (contract_records.getContractRecordsPart1(_id));
   }

   function getContractDetails2(bytes32 _id) public view returns(bytes32, uint, uint, uint, uint, bool, bool) {
       return (contract_records.getContractRecordsPart2(_id));
   }

   function addContractToRecords(address _address, bytes32 _id) public{
        contract_records.addToContractRecords(_address, _id);
   }







}
