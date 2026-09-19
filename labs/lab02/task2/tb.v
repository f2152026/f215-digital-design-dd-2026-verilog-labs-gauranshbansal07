`timescale 1ns/1ps

module tb;

    // Parameters
    parameter WIDTH = 8;
    parameter DEPTH = 4;

    // Inputs
    reg [$clog2(DEPTH)-1:0] sel;

    // Output
    wire [WIDTH-1:0] dout;

    // Instantiate DUT
    lut #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .sel(sel),
        .dout(dout)
    );

    // Test cases
    initial begin

        $monitor("Time=%0t | sel=%0d | dout=%0d",
                 $time, sel, dout);

        // Test sel = 0
        sel = 0;
        #10;

        // Test sel = 1
        sel = 1;
        #10;

        // Test sel = 2
        sel = 2;
        #10;

        // Test sel = 3
        sel = 3;
        #10;

        $finish;

    end

endmodule