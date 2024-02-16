`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: transaction
//////////////////////////////////////////////////////////////////////////////////


class transaction;
    // declaring data and control signals   
    rand bit a;     // randomized input bit
    rand bit b;     // randomized input bit
    bit sum;
    bit carry;
    
    function transaction copy();
        copy = new();
        copy.a = this.a;
        copy.b = this.b;
        copy.sum = this.sum;
        copy.carry = this.carry;
    endfunction
    
    
    function void display(string name);
        $display("[%s] a : %b b : %b sum : %d carry : %d", name, a,b, sum,carry);
    endfunction
    
endclass
