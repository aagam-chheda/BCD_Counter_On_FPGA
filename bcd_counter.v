module bcd_counter(
    input clk, reset,
    output [7:0] seven_segment,
    output [7:0] illuminate
);
    wire[6:0] count;
    counter counter_module(
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    wire[3:0] units_place, tens_place;
    hexa_to_bcd_converter hexa_to_bcd_converter_module(
        .hexa(count),
        .clk(clk),
        .reset(reset),
        .units_place(units_place),
        .tens_place(tens_place)
    );

    illuminator illuminator_module(
        .clk(clk),
        .reset(reset),
        .units(units_place),
        .tens(tens_place),
        .illuminate(illuminate),
        .segment(seven_segment)
    );
endmodule