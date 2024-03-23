module mod_adder #
(
    parameter WIDTH = 8,
    parameter M = 255
)
(
    input  logic [WIDTH-1 : 0] x,
    input  logic [WIDTH-1 : 0] y,
    output logic [WIDTH-1 : 0] z
);

logic [WIDTH : 0] s1, s2;
logic c;

assign s1 = {1'b0, x} + y;
assign s2 = s1 - M;
assign c = s2[WIDTH];
assign z = (c == 1'b0) ? s2[WIDTH - 1 : 0] : s1[WIDTH - 1 : 0];

endmodule