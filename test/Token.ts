import {
    time,
    loadFixture,
  } from "@nomicfoundation/hardhat-toolbox/network-helpers";
  import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
  import { expect } from "chai";
  import { ethers } from "hardhat";

describe("Token", function() {

    const deployTokenContract = async () => {

        const name = "Mano_Token";
        const symbol = "M_T";
        const decimal = 18;
        const address = "0xc408235a9A01767d70B41C98d92F2dC7B0d959f4";

        const Token = await ethers.getContractFactory("TokenContract");
        const token = await Token.deploy(name, symbol, decimal);

        return {token, name, symbol, decimal, address};
    }

    describe("Minting $ Burning", function (){

        it("should not pass if value minting value is less than 1", async () => {
            const {token, address, symbol} = await loadFixture(deployTokenContract);
            await expect(token.mint(address, 0));
                // `The minimum value you can mint is ${symbol}1`
        })
    })

})