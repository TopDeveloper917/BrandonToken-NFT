pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import './Ownable.sol';
import './SignerRole.sol';
import './ERC1155Base.sol';

contract BrandonToken is Ownable, SignerRole, ERC1155Base {
    string public name;
    string public symbol;

    constructor(string memory _name, string memory _symbol, address signer, string memory contractURI, string memory tokenURIPrefix) ERC1155Base(contractURI, tokenURIPrefix) public {
        name = _name;
        symbol = _symbol;

        _addSigner(signer);
        _registerInterface(bytes4(keccak256('MINT_WITH_ADDRESS')));
    }

    function addSigner(address account) public onlyOwner {
        _addSigner(account);
    }

    function removeSigner(address account) public onlyOwner {
        _removeSigner(account);
    }

    function mint(uint256 id, uint8 v, bytes32 r, bytes32 s, Fee[] memory fees, uint256 supply, string memory uri) public {
        require(isSigner(ecrecover(keccak256(abi.encodePacked(this, id)), v, r, s)), "signer should sign tokenId");
        _mint(id, fees, supply, uri);
    }
}