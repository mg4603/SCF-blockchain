pragma solidity >=0.4.21 <0.7.0;



contract Registerations {
    mapping(address => bool) registered;
 
    constructor() public {
     }
    function isRegistered(address user) public view returns (bool) {
        return registered[user];

    }
   
    function register(address user) public {
        registered[user] = true;
    }

}
