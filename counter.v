module counter(
    input clk, reset,
    output reg[6:0] count
);
    reg [26:0] temp;

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                temp <= 27'b000000000000000000000000000;
            else
                if(temp==27'd99_999_999)
                    temp <= 27'b000000000000000000000000000;
                else
                    temp <= temp + 1;
        end

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                count <= 7'b00000000;
            else
                if(temp==27'd99_999_999)
                    begin
                        if(count==7'd99)
                            count <= 7'b00000000;
                        else
                            count <= count + 1;
                    end
                else
                    count <= count;
        end  
endmodule