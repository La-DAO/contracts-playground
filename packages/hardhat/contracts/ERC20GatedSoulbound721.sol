// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ERC20GatedSoulbound721 is
	ERC721,
	ERC721Enumerable,
	ERC721URIStorage,
	ERC721Burnable,
	Ownable
{
	using Counters for Counters.Counter;

	Counters.Counter private _tokenIdCounter;
	uint256 public requiredBalERC20;
	address public requiredERC20;
	mapping(string => address) public usernameToAddress;
	mapping(address => string) public addressToUsername;
	string public imageUri;
	uint256 constant maxBalance = 1;

	constructor(
		string memory name_,
		string memory symbol_,
		string memory imageUri_,
		address requiredTokenAddress_,
		uint256 requiredTokenBal_,
		address newOwner_
	) ERC721(name_, symbol_) {
		imageUri = imageUri_;
		requiredERC20 = requiredTokenAddress_;
		requiredBalERC20 = requiredTokenBal_;
		transferOwnership(newOwner_);
	}

	function safeMint(
		address to_,
		string memory uri_,
		string memory username_
	) public onlyHolders {
		require(
			usernameToAddress[username_] == address(0),
			"ERC20GatedSoulbound721: Username already exists"
		);
		require(
			balanceOf(to_) < maxBalance,
			"ERC20GatedSoulbound721: Max balance reached"
		);
		usernameToAddress[username_] = to_;
		addressToUsername[to_] = username_;
		uint256 tokenId = _tokenIdCounter.current();
		_tokenIdCounter.increment();
		_safeMint(to_, tokenId);
		_setTokenURI(tokenId, uri_);
	}

	function setRequiredERC20(
		address newRequiredTokenAddress_
	) public onlyOwner {
		requiredERC20 = newRequiredTokenAddress_;
	}

	function setRequiredBalERC20(
		uint256 newRequiredTokenBal_
	) public onlyOwner {
		requiredBalERC20 = newRequiredTokenBal_;
	}

	// Modifier: used to define a set of rules that must be met before or after a function is executed
	// Check the withdraw() function
	modifier onlyHolders() {
		require(
			IERC20(requiredERC20).balanceOf(_msgSender()) >= requiredBalERC20,
			"ERC20GatedSoulbound721: Not enough ERC20 balance"
		);
		_;
	}

	// The following functions are overrides required by Solidity.

	function _beforeTokenTransfer(
		address from,
		address to,
		uint256 tokenId,
		uint256 batchSize
	) internal override(ERC721, ERC721Enumerable) {
		require(
			from == address(0) || to == address(0),
			"ERC20GatedSoulbound721: Token is Souldbound"
		);
		super._beforeTokenTransfer(from, to, tokenId, batchSize);
	}

	function _burn(
		uint256 tokenId
	) internal override(ERC721, ERC721URIStorage) {
		super._burn(tokenId);
	}

	function tokenURI(
		uint256 tokenId
	) public view override(ERC721, ERC721URIStorage) returns (string memory) {
		return super.tokenURI(tokenId);
	}

	function supportsInterface(
		bytes4 interfaceId
	) public view override(ERC721, ERC721Enumerable) returns (bool) {
		return super.supportsInterface(interfaceId);
	}
}
