pragma solidity ^0.4.21;

//registry of contracts by name.
contract NameResistry{
  uint public numRegistry;

  struct ContractInfo{
    address owner;
    address contractAddress;
    string description;
  }

  mapping(bytes32 => ContractInfo) public contracts;


  // constractor
  function NameResistry(){
    numRegistry = 0;
  }

  // register the contract
  function register(bytes32 _name){
    if(!(contracts[_name]) != 0){

    numResistry++;
    contracts[_name].owner = msg.sender;
    }
  }

  // register contracgt address
  function registerAddress(bytes32 _name, address _contractAddress){
    contracts[_name].contractAddress = _contractAddress;
  }


  
}
