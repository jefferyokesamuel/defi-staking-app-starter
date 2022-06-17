pragma solidity ^0.5.0;

contract Tether {
    string public name = 'Tether';
    string public symbol = 'USDT';
    uint256 public totalSupply = 1000000000000000000000000; //1 million tokens
    uint8 public decimals = 18;

    event Transfer(
        address indexed sender,
        address indexed receiver,
        uint amount
    );

    event Approve (
        address indexed owner,
        address indexed spender,
        uint amount
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;  

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _reciever, uint256 _amount) public returns(bool success) {
        require(balanceOf[msg.sender] >= _amount, "Your balance is smaller than the amount");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_reciever] += _amount;
        emit Transfer(msg.sender, _reciever, _amount);
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success){
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
        allowance[msg.sender][_from] -= _amount;
        emit Transfer(_from, _to, _amount);
        return true;
    }
}
