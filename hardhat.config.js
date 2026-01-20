/** @type {import("hardhat/config").HardhatUserConfig} */
const config = {
  solidity: "0.8.28",
  networks: {
    hardhat: {
      type: "edr-simulated",
      chainId: 1337,
    },
  },
};

export default config;
