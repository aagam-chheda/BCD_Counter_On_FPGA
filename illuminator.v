module illuminator(
    input clk, reset,
    input[3:0] units, tens,
    output reg[7:0] illuminate,
    output reg[7:0] segment
);
    reg ps, ns;
    parameter s0=0, s1=1;

    reg[17:0] temp;

    always@(posedge clk or posedge reset)
        begin
            if(reset) temp<=17'b00000000000000000;
            else
                begin
                    if(temp==17'd99999)
                        temp<=17'b00000000000000000;
                    else
                        temp<=temp+1;
                end
        end

    always@(posedge clk or posedge reset)
        begin
            if(reset) ps<=s0;
            else
                begin
                    if(temp==10'd99999)
                        ps<=ns;
                    else
                        ps<=ps;
                end
        end
    
    always@(*)
        case(ps)
            s0: ns=s1;
            s1: ns=s0;
            default: ns=s0;
        endcase

    always@(*)
        case(ps)
            s0: begin
                    illuminate=8'b11111110;
                    case(units)    // abcdefgh
                        0: segment=8'b00000011;
                        1: segment=8'b10011111;
                        2: segment=8'b00100101;
                        3: segment=8'b00001101;
                        4: segment=8'b10011001;
                        5: segment=8'b01001001;
                        6: segment=8'b01000001;
                        7: segment=8'b00011111;
                        8: segment=8'b00000001;
                        9: segment=8'b00001001;
                        default: segment=8'b11111111;
                    endcase
                end

            s1: begin
                    illuminate=8'b11111101;
                    case(tens)    // abcdefgh
                        0: segment=8'b00000011;
                        1: segment=8'b10011111;
                        2: segment=8'b00100101;
                        3: segment=8'b00001101;
                        4: segment=8'b10011001;
                        5: segment=8'b01001001;
                        6: segment=8'b01000001;
                        7: segment=8'b00011111;
                        8: segment=8'b00000001;
                        9: segment=8'b00001001;
                        default: segment=8'b11111111;
                    endcase
                end

            default:begin
                        illuminate=8'b11111110;
                        case(units)    // abcdefgh
                            0: segment=8'b00000011;
                            1: segment=8'b10011111;
                            2: segment=8'b00100101;
                            3: segment=8'b00001101;
                            4: segment=8'b10011001;
                            5: segment=8'b01001001;
                            6: segment=8'b01000001;
                            7: segment=8'b00011111;
                            8: segment=8'b00000001;
                            9: segment=8'b00001001;
                            default: segment=8'b11111111;
                        endcase
                    end
        endcase
endmodule