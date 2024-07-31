// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;

contract EventContract {
    uint256 public eventId;
    struct Event {
        address organiser;
        string name;
        uint256 date;
        uint256 totalTickets;
        uint256 ticketPrice;
    }
    mapping(uint256 => Event) public events;
    mapping(address => mapping(uint256 => uint256)) public tickets;

    function createEvent(
        string memory name,
        uint256 date,
        uint256 totalTickets,
        uint256 ticketPrice
    ) public {
        require(date > block.timestamp, "Invalid date");
        require((totalTickets >= 10), "Minimum 10 tickets are required!");
        require((ticketPrice >= 100), "Minimum Ticket Price is 100!");
        events[eventId++] = Event(
            msg.sender,
            name,
            date,
            totalTickets,
            ticketPrice
        );
    }

    function buyTickets(uint256 id, uint256 quantity) public payable {
        require(
            (events[id].date > block.timestamp),
            "Event has already occured or doesnt exist!"
        );
        require(quantity > 0, "Min 1 ticket is required!");
        require(
            (quantity < events[id].totalTickets),
            "Not enough tickets available"
        );
        require(msg.value == (events[id].ticketPrice * quantity));
        events[id].totalTickets -= quantity;
        tickets[msg.sender][id] += quantity;
    }

    function transferTicket(
        address to,
        uint256 id,
        uint256 quantity
    ) public {
        require(
            (events[id].date > block.timestamp),
            "Event has already occured or doesnt exist!"
        );
        require(quantity > 0, "Min 1 ticket is required!");
        require(
            (tickets[msg.sender][id] >= quantity),
            "Not enough tickets available"
        );
        tickets[msg.sender][id] -= quantity;
        tickets[to][id] += quantity;
    }
}
