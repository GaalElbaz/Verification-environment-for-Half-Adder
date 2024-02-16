`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: driver
//////////////////////////////////////////////////////////////////////////////////


class driver;
    transaction data;
    mailbox #(transaction) mbx; // generator to driver
    virtual ha_if haif;
    
    event dut_ready;
    
    // custome constructor 
    function new (mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction
    
    task run();
        forever begin
            mbx.get(data);
            haif.a <= data.a;
            haif.b <= data.b;
            data.display("DRV");     
        end
    endtask;
    
endclass
