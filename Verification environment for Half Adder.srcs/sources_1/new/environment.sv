`timescale 1ns / 1ps
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "ha_if.sv"
//////////////////////////////////////////////////////////////////////////////////
// Class Name: environment
//////////////////////////////////////////////////////////////////////////////////



class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sco;
    
    event next;
    event dut_ready;
    
    mailbox #(transaction) gdmbx;   // gen -> driver
    mailbox #(transaction) msbx;    // mon -> sco
    
    virtual ha_if haif;
    
    function new(virtual ha_if haif);
        gdmbx = new();        
        gen = new(gdmbx);
        drv = new(gdmbx);
        
        msbx = new();
        mon = new(msbx);
        sco = new(msbx);
        
        // connecting interface to classes
        this.haif = haif;
        drv.haif = this.haif;
        mon.haif = this.haif;
        
        // initial event
        gen.next = next;
        sco.next = next;
        
        drv.dut_ready = dut_ready;
        mon.dut_ready = dut_ready;
    endfunction
    
    // before sending the stimuli
    task pre_test();
        $display("SETTING CONFIG");
        $display("----------------------------");
    endtask
    
    // main test
    task test();
        fork
            gen.run();
            drv.run();
            mon.run();
            sco.run();
        join_any
    endtask
    
    // after sending all stimuli
    task post_test();
        wait(gen.done.triggered);
        $finish();
    endtask
    
    task run();
        pre_test();
        test();
        post_test();
    endtask
endclass
