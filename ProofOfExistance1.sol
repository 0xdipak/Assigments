//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ProofOfExistance1 {
    bytes32 public proof;

    function storeProof(bytes32 proof) public {

    }

    function notarize(string memory document) public {
        bytes32 proof = proofFor(document);
        storeProof(proof);

    }

    function proofFor(string memory document) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(document));
    }
}
