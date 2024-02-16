`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: monitor
//////////////////////////////////////////////////////////////////////////////////


class monitor;
    transaction data;
    mailbox #(transaction) mbx; // monitor to scoreboard
    virtual ha_if haif;
    
    event dut_ready;
        
    // custome constructor 
    function new (mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction
    
    task run();
        data = new();
        forever begin
            #30;
            data.a = haif.a;
            data.b = haif.b;
            data.sum = haif.sum;
            data.carry = haif.carry;
            mbx.put(data);          
            data.display("MON");         
        end
    endtask;
    
endclass
