pragma solidity >=0.4.21 <0.7.0;

import "./SCFContracts.sol";

contract ContractRecords{

    mapping(bytes32=>SCFContracts) contracts;

    constructor() public{}

    function addToContractRecords(address _address, bytes32 _id) public{
        contracts[_id] = new SCFContracts(_address, _id);
    }

    function getContractRecordsPart1(bytes32 _id) public view returns(address, address, uint, bytes32,
    bytes32){
        return (contracts[_id].getBuyer(), contracts[_id].getSeller(),
                contracts[_id].getInvestors().length, contracts[_id].getDeliveryDate(),
                contracts[_id].getPaymentDate());
    }

    function getContractRecordsPart2(bytes32 _id) public view returns(bytes32, uint, uint, uint, uint, bool, bool){
        return (contracts[_id].getWorkingCapitalDeadline(),
                 contracts[_id].getOrderAmt(), contracts[_id].getWorkingCapital(),
                 contracts[_id].getInterestRate(), contracts[_id].getBackingPercent(), contracts[_id].getOrderCompletion(), contracts[_id].getBuyerApproval());
    }
    

}