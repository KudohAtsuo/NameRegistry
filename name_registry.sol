pragma solidity ^0.4.21;

// registry of contracts by name.
// user can follow the contract address by its name even if owner updated the contract address
contract NameResistry{
  uint public numRegistry;

  struct ContractInfo{
    address owner;
    address contractAddress;
    bytes32 description;
  }

  // contrract name to address
  mapping(bytes32 => ContractInfo) public contracts;


  // constractor
  function NameResistry(){
    numRegistry = 0;
  }

  // to register the contract
  // this fucncion keeps its contract name only unique one
  function register(bytes32 _name) public{
    require(contracts[_name].owner == 0);

    numRegistry++;
    contracts[_name].owner = msg.sender;

  }

  //  to register contracgt address
  function registerAddress(bytes32 _name, address _contractAddress)public onlyOwner(_name){

    contracts[_name].contractAddress = _contractAddress;
  }

  // to register contract description
  function registerDescript(bytes32 _name, bytes32 _description) public onlyOwner(_name){

    contracts[_name].description = _description;
  }


  // to transfer ownership
  function transferOwnership(bytes32 _name, address _contractAddressTaker) public onlyOwner(_name){

    contracts[_name].contractAddress = _contractAddressTaker;
  }

  // to call contract owner address by name
  function getOwnerAddress(bytes32 _name) public view returns(address){
    return contracts[_name].owner;
  }

  // to call contract address by its name
  function getContract(bytes32 _name) public view returns(address){
    return contracts[_name].contractAddress;
  }

  // to call contract description by name
  function getDescript(bytes32 _name) public view returns(bytes32){
    return contracts[_name].description;
  }

  // to delete contract owner so that same contract name can be available by someone else
  // message is still available by accessing description
  function deleteContract(bytes32 _name) public onlyOwner(_name){

    contracts[_name].owner = 0;
  }

  // modifier only owner in local
  modifier onlyOwner(bytes32 _name){
    require(contracts[_name].owner == msg.sender);
    _;
  }

}
