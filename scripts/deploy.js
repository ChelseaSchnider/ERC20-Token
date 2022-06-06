const hre = require("hardhat");
const fs = require('fs');

async function main() {
  const TokenContract = await hre.ethers.getContractFactory("MyToken");
  const tokencontract = await TokenContract.deploy();
  await tokencontract.deployed();
  console.log("My Token deployed to:", tokencontract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });