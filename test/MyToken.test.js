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
    TokenInstance = await TokenContract.connect(owner).deploy(
      50,
      "My Token",
      "MTN"
    );
  })

  describe("Initialization tests", function()  {
    it.only("initializes properly", async () =>{
      expect(await TokenInstance.name()).to.be.equal("My Token");
      expect(await TokenInstance.symbol()).to.be.equal("MTN");
      // expect(await TokenInstance.totalSupply()).to.be.equal(50)
    })
  })

  describe("_transfer function tests", function()  {
    it("", async () =>{
      
    })
  })

  

})
