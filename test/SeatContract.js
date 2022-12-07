const SeatContract = artifacts.require("SeatContract");

contract("SeatContract", () => {

  before(async () => {
    this.seatContract = await SeatContract.deployed();
  });

  if("successful deploy", async () => {
    const address = this.seatContract.address;
    assert.notEqual(address, null);
    assert.notEqual(address, undefined);
    assert.notEqual(address, "");
  });

});
