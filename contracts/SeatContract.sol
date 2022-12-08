pragma solidity ^0.8.12;

contract SeatContract {

  uint seatCounter = 0;
  uint userCounter = 0;
  uint ticketCounter = 0;

  struct Seat {
    string id;
    string row;
    string column;
    string idTicket;
  }

  struct User {
    string id;
    string name;
    string email;
    string password;
  }

  struct Ticket {
    string id;
    string idSeat;
    string idUser;
  }

  constructor () {
    createUsers();
    createSeats();
  }

  event LoopSeat ( 
    uint inst
  ); 

  mapping (uint => User) public users;
  mapping (uint => Seat) public seats;
  mapping (uint => Ticket) public tickets;

  // Create at the beginning
  function createUsers () private {
    createUser("01a5c7e2", "Andre Lizaran", "andrelizaran@gmail.com", "HelloWorld123");
    createUser("63274626", "Yelitza Magali", "yelitzamagali@gmai.com", "HelloWorld123");
    createUser("ec073f01", "Marco Cortes", "marcocortes@gmai.com", "HelloWorld123");
  }

  function createSeats () private {
    createSeat("0ee0ff36", "1", "A");
    createSeat("3a03f97f", "1", "B");
    createSeat("3765447a", "1", "C");
    createSeat("d2456ef7", "1", "D");
    createSeat("6d16282e", "1", "E");
    createSeat("25223433", "1", "F");
    createSeat("5a631ea9", "1", "G");
    createSeat("2564b5bc", "1", "H");
    createSeat("6e5b384d", "1", "I");
    createSeat("7a480974", "1", "J");
    createSeat("9949da2f", "1", "K");
    createSeat("574af37c", "1", "L");
    createSeat("de93ded3", "2", "A");
    createSeat("53833d66", "2", "B");
    createSeat("fc66da87", "2", "C");
    createSeat("58eb95c9", "2", "D");
    createSeat("0481ccb4", "2", "E");
    createSeat("e01dcf2d", "2", "F");
    createSeat("b7aa8774", "2", "G");
    createSeat("3ea079a0", "2", "H");
    createSeat("78591cb7", "2", "I");
    createSeat("48adcf31", "2", "J");
    createSeat("e97b2f47", "2", "K");
    createSeat("ebad6966", "2", "L");
  }

  function createUser (string memory _id, string memory _name, string memory _email, string memory _password) public {
    users[userCounter] = User(_id, _name, _email, _password);
    userCounter++;
  }

  function createSeat (string memory _id, string memory _row, string memory _column) public {
    seats[seatCounter] = Seat(_id, _row, _column, '');
    seatCounter++;
  }

  function createTicket (string memory _id, string memory _idSeat, string memory _idUser) public {
    tickets[ticketCounter] = Ticket(_id, _idSeat, _idUser);
    ticketCounter++;
  }

  function signIn (string memory _email, string memory _password) public view returns (User memory) {
    User memory selectedUser = User("", "", "", "");
    for (uint i = 0; i < userCounter; i++) {
      bool compareEmails = stringsEquals(_email, users[i].email);
      bool comparePasswords = stringsEquals(_password, users[i].password);
      if (compareEmails && comparePasswords) { selectedUser = users[i]; }
    }
    return selectedUser;
  }

  function sellTicket (string memory _idTicket, string memory _idSeat, string memory _idUser) public {
    Seat memory newSeat = Seat("", "", "", "");
    for (uint i = 0; i < seatCounter; i++) {  
      bool comparedId = stringsEquals(_idSeat, seats[i].id);
      if (comparedId) { 
        newSeat.id = seats[i].id;
        newSeat.row = seats[i].row;
        newSeat.column = seats[i].column;
        newSeat.idTicket = _idTicket;
        seats[i] = newSeat;
      }
    }
    createTicket(_idTicket, _idSeat, _idUser);
  }

  function removeTicket (string memory _idSeat) public {
    Seat memory newSeat = Seat("", "", "", "");
    for (uint i = 0; i < seatCounter; i++) {  
      bool comparedId = stringsEquals(_idSeat, seats[i].id);
      if (comparedId) { 
        newSeat.id = seats[i].id;
        newSeat.row = seats[i].row;
        newSeat.column = seats[i].column;
        newSeat.idTicket = '';
        seats[i] = newSeat;
      }
    }
  }

  function getUserTickets (string memory _idUser) public view returns(string memory) {
    string memory idsArray = "";
    Ticket memory ticket = Ticket("", "", "");
    for (uint i = 0; i < ticketCounter; i++) {
      ticket = tickets[i];
      if (stringsEquals(ticket.idUser, _idUser)) { 
        idsArray = string.concat(idsArray, ticket.id); 
        idsArray = string.concat(idsArray, ","); 
      }
    }
    return idsArray;
  }

  function getSeat (uint _position) public view returns (Seat memory) {
    return seats[_position];
  }

  function stringsEquals(string memory s1, string memory s2) private pure returns (bool) {
    return keccak256(abi.encodePacked(s2)) == keccak256(abi.encodePacked(s1));
  }

}