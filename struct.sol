// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;
struct Person{
    uint age;
    string name;
}
contract Test{
    Person public p1;
    constructor(uint _age,string memory _name){
        p1.age = _age;
        p1.name = _name;
    }
    function setter(uint _age,string memory _name) public {
        p1.age = _age;
        p1.name = _name; 
    }
}