pragma solidity ^0.8.6;

contract SeatContract {

  uint seatCounter = 0;

  event SeatCreated (
    uint id,
    string row,
    string column,
    bool inUse
  );

  struct Seat {
    uint id;
    string row;
    string column;
    bool inUse;
  }

  constructor () {
    createSeat("1", "A");
    createSeat("1", "B");
    createSeat("1", "C");
    createSeat("1", "D");
    createSeat("1", "E");
    createSeat("1", "F");
    createSeat("1", "G");
    createSeat("1", "H");
    createSeat("1", "I");
    createSeat("1", "J");
    createSeat("1", "K");
    createSeat("1", "L");
    
    createSeat("2", "A");
    createSeat("2", "B");
    createSeat("2", "C");
    createSeat("2", "D");
    createSeat("2", "E");
    createSeat("2", "F");
    createSeat("2", "G");
    createSeat("2", "H");
    createSeat("2", "I");
    createSeat("2", "J");
    createSeat("2", "K");
    createSeat("2", "L");
    
    // createSeat("3", "A");
    // createSeat("3", "B");
    // createSeat("3", "C");
    // createSeat("3", "D");
    // createSeat("3", "E");
    // createSeat("3", "F");
    // createSeat("3", "G");
    // createSeat("3", "H");
    // createSeat("3", "I");
    // createSeat("3", "J");
    // createSeat("3", "K");
    // createSeat("3", "L");
    
    // createSeat("4", "A");
    // createSeat("4", "B");
    // createSeat("4", "C");
    // createSeat("4", "D");
    // createSeat("4", "E");
    // createSeat("4", "F");
    // createSeat("4", "G");
    // createSeat("4", "H");
    // createSeat("4", "I");
    // createSeat("4", "J");
    // createSeat("4", "K");
    // createSeat("4", "L");
    
    // createSeat("5", "A");
    // createSeat("5", "B");
    // createSeat("5", "C");
    // createSeat("5", "D");
    // createSeat("5", "E");
    // createSeat("5", "F");
    // createSeat("5", "G");
    // createSeat("5", "H");
    // createSeat("5", "I");
    // createSeat("5", "J");
    // createSeat("5", "K");
    // createSeat("5", "L");
    
    // createSeat("6", "A");
    // createSeat("6", "B");
    // createSeat("6", "C");
    // createSeat("6", "D");
    // createSeat("6", "E");
    // createSeat("6", "F");
    // createSeat("6", "G");
    // createSeat("6", "H");
    // createSeat("6", "I");
    // createSeat("6", "J");
    // createSeat("6", "K");
    // createSeat("6", "L");
  }

  mapping (uint => Seat) public seats;

  function createSeat (string memory _row, string memory _column) private {
    seats[seatCounter] = Seat(seatCounter, _row, _column, false);
    seatCounter++;
    emit SeatCreated(seatCounter, _row, _column, true);
  }

  function toggleInUse (uint _id) public {
    Seat memory _seat = seats[_id];
    _seat.inUse = !_seat.inUse;
    seats[_id] = _seat;
  }

  function getSeat (uint _position) public view returns (Seat memory) {
    return seats[_position];
  }

}