pragma solidity >=0.4.22 < 0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {

	Adoption adpotion = Adoption(DeployedAddresses.Adoption());

	uint expectedPetId = 8;
	address expectedAdopter = address(this);

	function testUserCanAdoptPet() public {
		uint returnedId = adpotion.adopt(expectedPetId);
		Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
	}

	function testGetAdopterAddressByPetId() public {
		address adopter = adpotion.adopters(expectedPetId);
		Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
	}

	
}