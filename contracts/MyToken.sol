//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MyToken {

    string public name;
    string public symbol;
    uint8 public decimals = 18;

    // Added a initialSupply variable for testing 
    uint256 public initialSupply;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    event Burn(address indexed from, uint256 value);

    constructor(uint256 initialSupply, string memory tokenName, string memory tokenSymbol) {

        totalSupply = initialSupply * 10**uint256(decimals);  // Update total supply with the decimal amount

        balanceOf[msg.sender] = totalSupply; // Give the creator all initial tokens

        name = tokenName; // Set the name for display purposes

        symbol = tokenSymbol; // Set the symbol for display purposes   
    }

    function _transfer(address _from, address _to, uint256 _value) internal {
        
        require(_to != address(0x0), "Unable to transfer to zero address");
       
        require(balanceOf[_from] >= _value, "Insufficient funds to send");
       
        require(balanceOf[_to] + _value >= balanceOf[_to], "Overflow error detected");
        
        uint256 previousBalances = balanceOf[_from] + balanceOf[_to];
        
        balanceOf[_from] -= _value;
        
        balanceOf[_to] += _value;

        emit Transfer(_from, _to, _value);
        
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {

        _transfer(msg.sender, _to, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender], "Transfer amount exceeds allowance");

        allowance[_from][msg.sender] -= _value;

        _transfer(_from, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function burn(uint256 _value) public returns (bool success) {

        require(balanceOf[msg.sender] >= _value, "Insufficient funds to send");

        balanceOf[msg.sender] -= _value; 

        totalSupply -= _value; 

        emit Burn(msg.sender, _value);

        return true;
    }

    function burnFrom(address _from, uint256 _value) public returns (bool success) {

        require(balanceOf[_from] >= _value); 

        require(_value <= allowance[_from][msg.sender]); 

        balanceOf[_from] -= _value; 

        allowance[_from][msg.sender] -= _value; 

        totalSupply -= _value;

        emit Burn(_from, _value);

        return true;
    }

    // Added a getTotalSupply function for testing as we need to get the total supply to test
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    } 
}


