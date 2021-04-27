pragma solidity ^0.5.0;

import './IERC1155Metadata_URI.sol';
import './HasTokenURI.sol';

/**
    Note: The ERC-165 identifier for this interface is 0x0e89341c.
*/
contract ERC1155Metadata_URI is IERC1155Metadata_URI, HasTokenURI {

    constructor(string memory _tokenURIPrefix) HasTokenURI(_tokenURIPrefix) public {

    }

    function uri(uint256 _id) external view returns (string memory) {
        return _tokenURI(_id);
    }
}