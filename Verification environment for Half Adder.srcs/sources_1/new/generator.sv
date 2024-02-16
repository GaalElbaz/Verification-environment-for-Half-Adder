`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: generator
//////////////////////////////////////////////////////////////////////////////////


class generator;
    transaction tr;
    mailbox #(transaction) mbx; // generator to driver
    
    int num_of_tests = 0;
    
    event done;
    event next;
    
    int i = 1;
    // custome constructor 
    function new (mailbox #(transaction) mbx);
        this.mbx = mbx;
        tr = new();
    endfunction
    
    task run();
        repeat(num_of_tests) begin
            assert (tr.randomize) else $error("[GEN] : Randomization failed");
            $display("Iteration %0d",i);
            tr.display("GEN");
            mbx.put(tr.copy());
            @(next);
            i++;
        end
        ->done;
    endtask;
endclass
