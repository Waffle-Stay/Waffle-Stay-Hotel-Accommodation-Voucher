const HotelTicketNFT = artifacts.require('HotelTicketNFT');

module.exports = (deployer) => {
	deployer.deploy(HotelTicketNFT, 'Waffle Stay Hotel Accommodation Voucher', 'WSV');
};
