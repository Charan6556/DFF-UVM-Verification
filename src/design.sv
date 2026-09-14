module dff ( input clk, rst, d,
            output logic q);
  always_ff @(posedge clk)
    begin
      if(rst)
      q<= 0;
      else
        q<=d;
    end
endmodule