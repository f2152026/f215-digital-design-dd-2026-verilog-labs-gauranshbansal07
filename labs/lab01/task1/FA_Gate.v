// FA_Gate.v
// Gate-level model of a 1-bit full adder. No delays yet -- that starts in
// Task 2. This task is purely about gate ordering.
//
// Part (a): leave this file exactly as it is, compile, and simulate.
// Part (b): AFTER completing part (a), come back and reorder the five gate
//           instantiations below into any different sequence, then
//           re-simulate with the same tb.v and compare.

module FA_Gate(
  input  a,
  input  b,
  input  cin,
  output sum,
  output cout
);
  wire ps, pc1, pc2;

  xor (ps,  a,   b);
  and (pc1, a,   b);
  xor (sum, cin, ps);
  and (pc2, cin, ps);
  or  (cout, pc1, pc2);

endmodule


// In Task 1(b), reordering the gate instantiations does not change the 
// circuit behavior because Verilog gate-level primitives are concurrent
// statements, not sequential statements. The simulator responds to signal 
// changes and schedules the gates accordingly, so the source-code order does
// not determine the logical result. In Task 1(c), adding delays changes the
// waveform timing because each gate output is updated after its specified
// propagation delay. The final sum and cout values remain those of a full
// adder, but their transitions occur later and intermediate propagation
// effects/glitches may be visible in the waveform.