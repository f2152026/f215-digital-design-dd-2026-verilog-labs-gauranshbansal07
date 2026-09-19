`timescale 1ns/1ps

module tb;

  reg [1:0] A;
  reg [1:0] B;

  wire GT;
  wire LT;
  wire EQ;

  // Instantiate DUT
  comp2 dut (
    .A(A),
    .B(B),
    .GT(GT),
    .LT(LT),
    .EQ(EQ)
  );

  integer i;
  integer j;

  reg expected_GT;
  reg expected_LT;
  reg expected_EQ;

  initial begin

    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin

        A = i;
        B = j;

        #1;

        // Expected outputs
        expected_GT = (A > B);
        expected_LT = (A < B);
        expected_EQ = (A == B);

        // Self-check
        if (GT !== expected_GT ||
            LT !== expected_LT ||
            EQ !== expected_EQ) begin

          $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b | Expected: GT=%b LT=%b EQ=%b",
                   A, B, GT, LT, EQ,
                   expected_GT, expected_LT, expected_EQ);

        end
        else begin

          $display("PASS: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   A, B, GT, LT, EQ);

        end

      end
    end

    $finish;

  end

endmodule