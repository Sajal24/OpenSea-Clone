require("@nomicfoundation/hardhat-toolbox");
//initally they had @nomiclabs/hardhat-waffle
//so basically that was a module for building smart contract using waffle (a library for writing and testing smart contracts) in hardhat, now this toolbox is a single plugin for everything we'll be needing

const fs = require("fs");
//allow us to read from the local file system

const privateKey = fs.readFileSync(".secret").toString();

const projectAPI = "xGQ6eHH9wRdA_7iUIe3px8SWGj3IK3jw";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    hardhat: {
      chainId: 1337,
    },
    mumbai: {
      url: `https://polygon-mumbai.g.alchemy.com/v2/${projectAPI}`,
      accounts: [privateKey],
    },
  },

  solidity: "0.8.17",
};
