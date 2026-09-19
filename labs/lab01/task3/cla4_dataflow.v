// cla4_dataflow.v
// The same 4-bit CLA as cla4.v, rewritten using dataflow modeling
// (continuous `assign` statements) instead of gate primitives. Compare
// the line count and readability of this file to cla4.v.
//
// TODO: add a delay to every assign statement (e.g. assign #(2) ...) --
// same default-delay expectation as everywhere else from Task 2 onward.
//   assign #(2) p = a ^ b;
//   assign #(2) g = a & b;
//   assign #(2) c1   = g[0] | (p[0] & cin);
//   assign #(2) c2   = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
//   assign #(2) c3   = ... (same pattern, one more term)
//   assign #(2) cout = ... (same pattern, one more term)
//   assign #(2) sum  = p ^ {c3, c2, c1, cin};


module cla4_dataflow(
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout
);

  wire [3:0] j, g;
  wire c1, c2, c3;

  // TODO: your dataflow (assign) statements go here.
  assign #2 g = a & b;

  assign #2 j = a ^ b;
  assign #2 c1 = (cin & j[0]) | g[0];
  assign #2 c2 = (cin & j[0] & j[1] ) | ( j[1] & g[0]) | (g[1]);
  assign #2 c3 = (cin & j[0] & j[1] & j[2]) | (g[0] & j[1] & j[2]) | (g[1] & j[2]) | (g[2]);
  assign #2 cout = (cin & j[0] & j[1] & j[2] & j[3])| (g[0] & j[1] & j[2] & j[3])| (g[1] & j[2] & j[3]) | (g[2] & j[3]) | (g[3]);
  assign #2 sum = j ^{c3,c2,c1,cin};

endmodule
