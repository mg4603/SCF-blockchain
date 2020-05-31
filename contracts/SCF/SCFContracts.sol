pragma solidity >=0.4.21 <0.7.0;

import "../token/Token.sol";

contract SCFContracts {
    Token private token;

    bytes32 _id;
    address buyer;
    address seller;
    mapping(address => uint256) investments;
    address[] investors;

    bytes32 deliveryDate;
    bytes32 paymentDate;
    bytes32 workingCapitalDeadline;
    uint256 orderAmount;
    uint256 workingCapital;
    bool approvalSeller;

    uint256 interestRate;
    uint256 backingPercent;

    bool approvalBuyer;
    bool orderCompletion;

    constructor(address _address, bytes32 id) public {
        seller = _address;
        _id = id;

    }


    ////////////////////////////////////////////
    function setInterestRate(uint256 _interestRate)
        public
    {
        interestRate = _interestRate;
    }

    function setDeliveryDate(bytes32 _deliveryDate)
        public
    {
        deliveryDate = _deliveryDate;
    }
    function setBackingPercent(uint256 _backingPercent)
        public
    {
        backingPercent = _backingPercent;
    }

    function setOrderAmt(uint256 _orderAmt) public{
        orderAmount = _orderAmt;
    }

    /////////////to update


    function setWorkingCapital(uint256 _workingCapital)
        public
    {
        workingCapital = _workingCapital;
    }

    function setPaymentDate(bytes32 _paymentDate)
        public
    {
        paymentDate = _paymentDate;
    }

    function setOrderCompletion(bool _orderCompletion)
        public
    {
        orderCompletion = _orderCompletion;
    }

    function getOrderCompletion() public view returns(bool){
        return orderCompletion;
    }

    ///////////////////////////////////////////////////
    function setWorkingCapitalDeadline(bytes32 _deadline)
        public
    {
        workingCapitalDeadline = _deadline;
    }
    function getWorkingCapitalDeadline()
        public
        view
    returns (bytes32)
    {
        return workingCapitalDeadline;
    }
    function setBuyer(address _buyer)
        public
    {
        buyer = _buyer;
    }

    function getBuyer() public view returns (address) {
        return buyer;
    }
    function getSeller()
        public
        view
    returns (address)
    {
        return seller;
    }

    function getInvestors()
        public
        view
    returns (address[] memory)
    {
        return investors;
    }

    function getDeliveryDate()
        public
        view
        returns (bytes32)
    {
        return deliveryDate;
    }

    function getPaymentDate()
        public
        view
        returns (bytes32)
    {
        return paymentDate;
    }

    function getOrderAmt() public view returns (uint256) {
        return orderAmount;
    }
    
    function getWorkingCapital() public view returns (uint256) {
        return workingCapital;
    }
    function getApprovalSeller() public view returns (bool) {
        return approvalSeller;
    }
    function getInterestRate() public view returns (uint256) {
        return interestRate;
    }
    function getBackingPercent() public view returns (uint256) {
        return backingPercent;
    }

    function getBuyerApproval() public view returns (bool) {
        return approvalBuyer;
    }


    function addInvestor(address _investor, uint256 _investment)
        public
    {
        investors.push(_investor);
        investments[_investor] = _investment;

        workingCapital -= _investment;
        paymentToSeller(_investor, _investment);

    }

    function getInvestment(address _investor) public view returns (uint256) {
        return investments[_investor];
    }

    function setApprovalSeller(bool _approvalSeller)
        public
    {
        approvalSeller = _approvalSeller;
    }

    function setApprovalBuyer(bool _approvalBuyer)
        public
    {
        approvalBuyer = _approvalBuyer;
    }

    ////////////////////////////////////// ESCROW

    // function transferFrom(address _from, address _to, uint256 tokens) public{
    //     token.transferFrom(_from, _to, tokens);
    // }

    function paymentToSeller(address _investor, uint256 _investment)
        public
    {
        token.transferFrom(_investor, seller, _investment);
    }

    function finalPayment() public {
        for (uint256 i = 0; i < investors.length; i++) {
            orderAmount -= investments[investors[i]];
            token.transferFrom(buyer, investors[i], investments[investors[i]]);
        }

        token.transferFrom(buyer, seller, orderAmount);

    }

    // trasnferfrom

}


