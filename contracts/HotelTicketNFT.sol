// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library Counters {
    struct Counter {
        uint256 _value;
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter._value;
    }

    function increment(Counter storage counter) internal {
        unchecked {
            counter._value += 1;
        }
    }

    function decrement(Counter storage counter) internal {
        uint256 value = counter._value;
        require(value > 0, "Counter: decrement overflow");
        unchecked {
            counter._value = value - 1;
        }
    }

    function reset(Counter storage counter) internal {
        counter._value = 0;
    }
}

library Concat {
    function concat(string memory _base, string memory _value) internal pure returns (string memory) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);

        uint i;
        uint j;

        for(i=0; i<_baseBytes.length; i++) {
            _newValue[j++] = _baseBytes[i];
        }

        for(i=0; i<_valueBytes.length; i++) {
            _newValue[j++] = _valueBytes[i];
        }

        return string(_newValue);
    }

}

pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/utils/Strings.sol";

contract HotelTicketNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    using Concat for string;
    using Strings for uint256;

    Counters.Counter private _tokenIds;

    mapping(uint256 => string) private _tokenURIs;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    /**
     * @dev Creates a new NFT and assigns ownership to `to`.
     * @param to The address of the new owner.
     */
    function mint(address to) external virtual onlyOwner {
        uint256 tokenId = Counters.current(_tokenIds);

        string memory baseURI = _baseURI();
        string memory _tokenURI = baseURI.concat('types/before/tokens/').concat(Strings.toString(tokenId));

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, _tokenURI);

        Counters.increment(_tokenIds);
    }

    /**
     * @dev Updates the URI of a specific token.
     * @param tokenId The ID of the token to update.
     */
    function updateTokenURI(uint256 tokenId) public onlyOwner {
        string memory baseURI = _baseURI();
        string memory updatedTokenURI = baseURI.concat('types/after/tokens/').concat(Strings.toString(tokenId));

        _setTokenURI(tokenId, updatedTokenURI);
    }

    /**
     * @dev Returns the base URI for all token IDs.
     */
    function _baseURI() internal view virtual override returns (string memory) {
        return "https://test-voucher-api.wafflestay.kr/v1/api/vouchers/";
    }

    /**
     * @dev Updates the token URI for a specific token.
     * @param tokenId The ID of the token to update.
     * @param _tokenURI The new URI for the token.
     */
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), 'HotelTicketNFT: URI set for nonexistent token');

        _tokenURIs[tokenId] = _tokenURI;
    }

    /**
     * @dev Returns the URI for a specific token.
     * @param tokenId The ID of the token to query.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), 'HotelTicketNFT: URI query for nonexistent token');

        return _tokenURIs[tokenId];
    }

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() public view returns (uint256) {
        return _tokenIds.current();
    }
}