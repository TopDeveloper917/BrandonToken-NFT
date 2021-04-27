const BrandonToken = artifacts.require('BrandonToken');

module.exports = async function (deployer, network, accounts) {
    let _name = "BrandonToken";
    let _symbol = "BRD";
    let signer = "0xBDA2e26669eb6dB2A460A9018b16495bcccF6f0a"; // Owner Address
    let contractURI = "";
    let tokenURIPrefix = "";
    await deployer.deploy(BrandonToken, _name, _symbol, signer, contractURI, tokenURIPrefix);
};