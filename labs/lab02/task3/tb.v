module tb ;
  reg [1:0]t_A ;
  reg [1:0] t_B;// inputs
  wire t_P ,t_Q ,t_R;// outputs
  integer l,o;
  reg a;
  comp2 DUT(
    .A(t_A),
    .B(t_B),
    .P(t_P),
    .Q(t_Q),
    .R(t_R)
  );

  initial begin // Applying the inputs
    a=0;
    for( l=0 ; l<4 ; l=l+1) begin
      for( o=0 ; o<4 ; o=o+1)begin
        t_A = l;
        t_B = o;
        #5;
        if((t_P + t_Q + t_R )!= 1) begin
          a=a+1;
          $display($time , " A = {%b ,%b} , B = {%b ,%b}| P =%b , Q = %b , R =%b" 
                   ,t_A[1],t_A[0],t_B[1],t_B[0],t_P,t_Q,t_R);
        end
      end
    end 

    if(a==0)begin
      $display($time , " No errors." );
    end
    else begin
      $display("Errors = %d",a);
    end
  end
  
endmodule