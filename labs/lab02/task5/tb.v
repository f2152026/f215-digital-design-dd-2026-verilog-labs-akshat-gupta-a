module tb;
    reg [3:0] t_a;
    reg [3:0] t_b;
    reg optest;
    wire [3:0] t_result;
    integer l,a,b;
    integer k;
    alu DUT(
        .a(t_a),
        .b(t_b),
        .op(optest),
        .result(t_result)
    );
    initial begin
        k=0;
        for(b=0 ; b<2 ;b=b+1 ) begin
            for(a=0 ; a<4 ; a=a+1) begin
                for(l=0 ; l<2 ; l=l+1) begin
                    optest = b;
                    t_a = a;
                    t_b = l;
                    #5;
                    if(b == 0 && t_result !== (t_a+t_b)) begin
                        k = k+1;
                        $display($time ," OP = %b , a={%b} , b={%b} | result = %b",optest, t_a,t_b,t_result);
                    end
                    if(b == 1 && t_result !== (t_a - t_b))begin
                        k = k+1;
                        $display($time ," OP = %b , a={%b} , b={%b} | result = %b",optest, t_a,t_b,t_result);
                    end
                end
            end
        end
        if(k == 0)begin
            $display($time ," No errors.",);
        end
        else begin
            $display($time , " Errors = %d",k);
        end
    end
endmodule