pragma solidity '^0.5.0';

contract Migrations {
    address public owner;
    uint public last_completed_migration;

    constructor() public {
        owner = msg.sender;
    }
    modifier restricted() {
        if (msg.sender == owner) _;   
    }

    function set_completed(uint completed) public restricted {
        last_completed_migration = completed;
    }
    functio n upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.set_completed(last_completed_migration);
    }

}