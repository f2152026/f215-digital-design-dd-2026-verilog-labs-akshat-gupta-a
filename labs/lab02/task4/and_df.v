module and_df(input a , b , output y);
    assign y = 1'b1;
    assign #5 y = a & b;
endmodule
