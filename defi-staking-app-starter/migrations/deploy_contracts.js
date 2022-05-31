const Tether = artifacts.require('Terher')

module.exports = async function (deployer) {
    await deployer.deploy(Tether)
};
