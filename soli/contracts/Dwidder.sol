pragma solidity ^0.4.24;

import "./OWNABLE.sol";

contract LJTToken {
    address public owner;
    string public name = "LJTToken";
    string public symbol = "LJT";
    uint8 public decimals = 8;
    uint256 public totalSupply = 0;
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) internal allowed;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 amount);
    
    constructor() public {
        owner = msg.sender;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        
        // TODO: sender의 잔액을 감소시킨다.
        // TODO: _to의 잔액을 증가시킨다.
        // TODO: Transfer 이벤트를 발생시킨다.
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender,_to,_value);
        
        return true;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        
        // TODO: _owner의 잔액을 반환한다.
        return balances[_owner];
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        
        // TODO: _from의 잔액을 감소시킨다.
        // TODO: _to의 잔액을 증가시킨다.
        // TODO: _from으로부터 msg.sender로의 allowance를 _value 만큼 감소시킨다.
        // Transfer 이벤트를 발생시킨다.
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from,_to,_value);
        
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool) {
        
        // TODO: msg.sender로부터 _spender로의 allowance를 _value로 설정한다.
        // TODO: Approval 이벤트를 발생시킨다.
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256) {
        
        // TODO: _owner로부터 _spender로의 allowance를 반환한다.
        return allowed[_owner][_spender];
    }
    
    function mint(address _to, uint256 _amount) public returns (bool) {
        require(msg.sender == owner);
        
        // TODO: 총 공급량에 발행량을 추가한다.
        // TODO: _to의 잔액을 증가시킨다.
        // TODO: Mint 이벤트를 발생시킨다.
        // TODO: Transfer 이벤트를 발생시킨다.
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Mint(_to, _amount);
        emit Transfer(0, _to, _amount);
        
        return true;
    }

}