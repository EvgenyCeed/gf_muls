module gf_mul_lut (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] z
);

logic [7:0] rev_a;
logic [7:0] rev_b;
logic [7:0] rev_z;
logic [7:0] degree_seq_z;

lut_rev lut_rev_a(
    .addr_i     (a),
    .data_o     (rev_a)
);

lut_rev lut_rev_b(
    .addr_i     (b),
    .data_o     (rev_b)
);

mod_adder u_mod_adder(
    .x(rev_a),
    .y(rev_b),
    .z(rev_z)
);

lut_degree_seq lut_degree_seq_z(
    .addr_i     (rev_z),
    .data_o     (degree_seq_z)
);

assign z = ((a == 0) || (b == 0)) ? 0 : degree_seq_z;

endmodule