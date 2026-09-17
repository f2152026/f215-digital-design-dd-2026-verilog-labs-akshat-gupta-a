// tb.v
// Starter testbench template -- YOU complete this file.
//
// Goal: apply all 8 combinations of I0, I1, S (5 time units apart) to DUT
// and observe the output. Fill in every TODO below.

module tb;

  // TODO: declare the three DUT inputs as the appropriate variable type.
  // Use exactly these names: t_i0, t_i1, t_ (needed by $monitor below).
  reg  t_i0 , t_i1 , t_;
  // TODO: declare the DUT output as the appropriate net type.
  // Use exactly this name: t_y (needed by $monitor below).
  wire  t_y;

  // TODO: instantiate DUT here, connecting t_i0, t_i1, t_, t_y to its ports
  DUT mux( 
    .I0(t_i0),
    .I1(t_i1),
    .S (t_),
    .Y (t_y)
  );
  // Waveform dump configuration
  //This basically creates a file storing the Waveforms.
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, mux);
    end
  end

  initial begin
    // TODO: apply all 8 combinations of t_i0, t_i1, t_, 5 time units apart,
    // then $finish. (Same pattern you used in Lab 1's tb.v.)
       t_i0 = 0 ; t_i1 = 0 ; t_ = 0;
    #5 t_i0 = 0 ; t_i1 = 0 ; t_ = 1;
    #5 t_i0 = 0 ; t_i1 = 1 ; t_ = 0;
    #5 t_i0 = 0 ; t_i1 = 1 ; t_ = 1;
    #5 t_i0 = 1 ; t_i1 = 0 ; t_ = 0;
    #5 t_i0 = 1 ; t_i1 = 0 ; t_ = 1;
    #5 t_i0 = 1 ; t_i1 = 1 ; t_ = 0;
    #5 t_i0 = 1 ; t_i1 = 1 ; t_ = 1;
    #5 $finish;
  end

  initial 
    $monitor($time, " I0=%b I1=%b S=%b | Y=%b", t_i0, t_i1, t_, t_y);

endmodule
