const hre = require("hardhat");
const fs = require('fs');

async function main() {
  const TokenContract = await hre.ethers.getContractFactory("MyToken");
  const tokenContract = await TokenContract.deploy(
    50,
    "My Token",
    "MTN"
  );
  await tokenContract.deployed();
  console.log("My Token deployed to:", tokenContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });