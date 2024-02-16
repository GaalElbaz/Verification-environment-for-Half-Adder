`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: scoreboard
//////////////////////////////////////////////////////////////////////////////////


class scoreboard;
    transaction tr;
    mailbox #(transaction) mbx; // monitor to scoreboard
    
    event next;
        
    // custome constructor 
    function new (mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction
    
    task run();
        forever begin
            mbx.get(tr);
            tr.display("SCO");
            ->next;
            $display("-----------------------------");         
        end
    endtask;
    
endclass
