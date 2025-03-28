module hexa_to_bcd_converter(
    input [6:0] hexa,
    input clk, reset,
    output reg [3:0] units_place,
    output reg [3:0] tens_place
);
    always@(posedge clk or posedge reset)
        begin
            if(reset)
                begin
                    tens_place <= 4'b0000;
                    units_place <= 4'b0000;
                end
            else
                begin
                    tens_place <= hexa/10;
                    units_place <= hexa%10;
                end
        end
endmodule