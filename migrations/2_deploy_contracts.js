let Records = artifacts.require("./SCF/Records.sol");
let Token = artifacts.require("./token/Token.sol");

module.exports = function(deployer){
	deployer.deploy(Records);
	deployer.deploy(Token, 100000000000000, "SupplyCoin", 2, "SC");
};



/*
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol*/
