const TasksContract = artifacts.require("SeatContract");

module.exports = function (deployer) {
  deployer.deploy(TasksContract);
}