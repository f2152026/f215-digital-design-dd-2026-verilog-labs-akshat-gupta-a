// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
  reg  [1:0] t_i; // inputs
  wire [7:0] t_o;// outputs 
  // TODO: instantiate DUT here
  lut DUT(
    .sel(t_i),
    .dout(t_o)
  );
  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // TODO: apply different input combinations
       t_i = 2'b00 ;
    #5 t_i = 2'b01 ;
    #5 t_i = 2'b10 ;
    #5 t_i = 2'b11 ;
    $finish;
  end

  initial
    $monitor($time, " Sel = {%b , %b } | Out = %b", t_i[0], t_i[1], t_o); // change as required

endmodule
