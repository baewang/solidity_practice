pragma solidity ^0.4.24;

contract DwidderToken {
    address public owner;
    string public name = "Dwidder";
    string public symbol = "DWD";
    uint8 public decimals = 8;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) internal allowed;


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 amount);

    contructor() public {
        owner = msg.sender;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function transferForm(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] -= _value;
        balances[_to] -= _value;

    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return 
    }


}