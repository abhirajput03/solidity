// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;

contract StructDemo {
    struct Employee {
        uint256 empid;
        string name;
        string department;
        string designation;
    }
    Employee[] public emps;

    function addEmployee(
        uint256 _empid,
        string memory _name,
        string memory _department,
        string memory _designation
    ) public {
        emps.push(Employee(_empid, _name, _department, _designation));
    }

    function getEmployee(uint256 _empid)
        public
        view
        returns (
            string memory,
            string memory,
            string memory
        )
    {
       for(uint i = 0; i < emps.length; i++){
        if(emps[i].empid == _empid){
             return (emps[i].name,emps[i].department,emps[i].designation);
         }
         
       } 
        revert("No employee found");
    }
}
