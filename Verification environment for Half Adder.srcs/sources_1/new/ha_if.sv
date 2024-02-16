`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Inteface Name: ha_if
//////////////////////////////////////////////////////////////////////////////////
// Define an interface for the half adder module
interface ha_if;
    logic a;
    logic b;
    logic sum;
    logic carry;
    
    // Define the ports
    modport DUT (
        input a,b,
        output sum,carry
        );
endinterface

