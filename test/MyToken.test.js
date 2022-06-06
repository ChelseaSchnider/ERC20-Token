const { expect } = require("chai");
const { ethers } = require("hardhat");

let TokenContract;
let TokenInstance;

let owner;
let ownerAddress;
let bob;
let bobAddress;
let chad;
let chadAddress;
let alice;
let aliceAddress;

describe("My Token Contract Tests", function () {

  beforeEach(async () => {
    [owner, bob, chad, alice] = await ethers.getSigners();
    ownerAddress = await owner.getAddress();
    bobAddress = await bob.getAddress();
    chadAddress = await chad.getAddress();
    aliceAddress = await alice.getAddress();

    TokenContract = await ethers.getContractFactory("MyToken");
    TokenInstance = await TokenContract.connect(owner).deploy();
    
  })

  

})
