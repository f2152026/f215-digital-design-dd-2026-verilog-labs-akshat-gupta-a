module and_beh_before(input a , b, output reg y);
    always @(*) begin
       #5 y = a & b;
    end
endmodule