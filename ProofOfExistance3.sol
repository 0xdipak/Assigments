//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ProofOfExistance3 {

    mapping(bytes32 => bool) proofs;

    function storeProof(bytes32 proof) internal {
        proofs[proof] = true;
    }

    function notarize(string memory document) public {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    function proofFor(string memory document) pure private returns(bytes32) {
        return keccak256(abi.encodePacked(document));
    }

    function checkDocument(string memory document) public  returns(bool) {
        bytes32 proof = proofFor(document);
        return hasProof(proof);
    }

    function hasProof(bytes32 proof) public returns(bool) {
        return proofs[proof];
    }
}
