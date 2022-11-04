const { ethers } = require("hardhat");
require("dotenv").config({path: ".env"});

//using asynchronous function
async function main(){
  const nftContract = await ethers.getContractFactory("LizzyNFT")
  //deploy the contract
  const deployedNFTContract = await nftContract.deploy();

  //we wait for the contract to be deployed
  await deployedNFTContract.deployed()

    //here, we print the address of the deployed contract
    console.log("NFT Contract Address:", deployedNFTContract.address)

}
main()
.then(()=> process.exit(0))
.catch((error)=>{
  console.error(error);
  process.exit(1);
})