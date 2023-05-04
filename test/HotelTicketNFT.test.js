const HotelTicketNFT = artifacts.require('HotelTicketNFT');

async function errException(promise) {
	try {
		await promise;
	} catch (error) {
		return error.reason;
	}
	assert.fail('Expected throw not received');
}

contract('HotelTicketNFT', (accounts) => {
	const [owner, user] = accounts;
	const baseURI = 'https://test-voucher-api.wafflestay.kr/v1/api/vouchers/';
	let hotelTicketNFT;

	beforeEach(async () => {
		hotelTicketNFT = await HotelTicketNFT.new('Waffle Stay Hotel Accommodation Voucher', 'WSV');
	});

	it('should must mint a new nft', async () => {
		await hotelTicketNFT.mint(user, { from: owner });

		const tokenId = (await hotelTicketNFT.totalSupply()) - 1;

		const tokenURI = await hotelTicketNFT.tokenURI(tokenId);
		const expectedURI = baseURI.concat('types/before/tokens/').concat(tokenId);

		assert.equal(tokenURI, expectedURI);
		assert.equal(await hotelTicketNFT.ownerOf(tokenId), user);
	});

	it('should must update the token URI', async () => {
		await hotelTicketNFT.mint(user, { from: owner });

		const tokenId = (await hotelTicketNFT.totalSupply()) - 1;

		await hotelTicketNFT.updateTokenURI(tokenId, { from: owner });

		const tokenURI = await hotelTicketNFT.tokenURI(tokenId);
		const expectedURI = baseURI.concat('types/after/tokens/').concat(tokenId);

		assert.equal(tokenURI, expectedURI);
	});

	it('should must revert when querying the URI for a nonexistent token', async () => {
		const nonexistentTokenId = 999;

		await errException(hotelTicketNFT.tokenURI(nonexistentTokenId, { from: owner }));
	});

	it('should must revert when updating the URI for a nonexistent token', async () => {
		const nonexistentTokenId = 999;

		await errException(hotelTicketNFT.updateTokenURI(nonexistentTokenId, { from: owner }));
	});
});
