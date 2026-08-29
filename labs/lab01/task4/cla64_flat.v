module cla64_flat(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  wire [63:0] p, g;
  wire [64:1] c;

  genvar i;
  generate
    for (i = 0; i < 64; i = i + 1) begin : gen_pg
      xor #(2) (p[i], a[i], b[i]);
      and #(2) (g[i], a[i], b[i]);
    end
  endgenerate

  // Carry equations

  assign #(2) c[1] =
      g[0] |
      (p[0] & cin);

  assign #(2) c[2] =
      g[1] |
      (p[1] & g[0]) |
      (p[1] & p[0] & cin);

  assign #(2) c[3] =
      g[2] |
      (p[2] & g[1]) |
      (p[2] & p[1] & g[0]) |
      (p[2] & p[1] & p[0] & cin);

  assign #(2) c[4] =
      g[3] |
      (p[3] & g[2]) |
      (p[3] & p[2] & g[1]) |
      (p[3] & p[2] & p[1] & g[0]) |
      (p[3] & p[2] & p[1] & p[0] & cin);

  assign #(2) c[5] =
      g[4] |
      (p[4] & g[3]) |
      (p[4] & p[3] & g[2]) |
      (p[4] & p[3] & p[2] & g[1]) |
      (p[4] & p[3] & p[2] & p[1] & g[0]) |
      (p[4] & p[3] & p[2] & p[1] & p[0] & cin);

  assign #(2) c[6] =
      g[5] |
      (p[5] & g[4]) |
      (p[5] & p[4] & g[3]) |
      (p[5] & p[4] & p[3] & g[2]) |
      (p[5] & p[4] & p[3] & p[2] & g[1]) |
      (p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) |
      (p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & cin);

  assign #(2) c[7] =
      g[6] |
      (p[6] & g[5]) |
      (p[6] & p[5] & g[4]) |
      (p[6] & p[5] & p[4] & g[3]) |
      (p[6] & p[5] & p[4] & p[3] & g[2]) |
      (p[6] & p[5] & p[4] & p[3] & p[2] & g[1]) |
      (p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) |
      (p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & cin);

  // Continue the same pattern through c[64].

  assign #(2) sum = p ^ {c[63:1], cin};

  assign #(2) cout = c[64];

endmodule