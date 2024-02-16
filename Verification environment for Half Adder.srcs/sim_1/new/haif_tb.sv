`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: haif_tb
//////////////////////////////////////////////////////////////////////////////////


module haif_tb;
    ha_if haif();
    half_adder dut(haif.DUT);
    
    environment env;
    
    initial begin
        env = new(haif);
        env.gen.num_of_tests = 10;
        env.run();
    end

endmodule
