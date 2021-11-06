require('@nomiclabs/hardhat-waffle')

module.exports = {
  solidity: {
    version: '0.8.9',
    settings: {}
  },
  networks: {
    hardhat: {
      chainId: 0x1234,
    },
    goerli: {
      url: 'http://192.168.1.198:9545',
      accounts: ['0x18ef552014cb0717769838c7536bc1d3b1c800fe351aa2c38ac093fa4d4eb7d6'],
    }
  }
}
