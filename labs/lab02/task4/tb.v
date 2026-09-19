`timescale 1ns/1ps

module tb;

    reg a;
    reg b;
    wire y;

    // Instantiate DUT
    and_df dut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin

        $monitor("Time=%0t | a=%b | b=%b | y=%b",
                 $time, a, b, y);

        // Test 1: 0 & 0 = 0
        a = 0; b = 0;
        #10;

        // Test 2: 0 & 1 = 0
        a = 0; b = 1;
        #10;

        // Test 3: 1 & 0 = 0
        a = 1; b = 0;
        #10;

        // Test 4: 1 & 1 = 1
        a = 1; b = 1;
        #10;

        $finish;

    end

endmodule