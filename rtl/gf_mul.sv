module gf_mul(
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] z
);

always_comb begin
    z[7] = a[7]&b[0] ^ a[6]&b[1] ^ a[5]&b[2] ^ a[4]&b[3] ^ a[3]&b[4] ^ a[2]&b[5] ^ a[1]&b[6] ^ a[0]&b[7] ^ a[7]&b[6] ^ a[6]&b[7] ^ a[7]&b[5] ^ a[6]&b[6] ^ a[5]&b[7] ^ a[7]&b[4] ^ a[6]&b[5] ^ a[5]&b[6] ^ a[4]&b[7];
    z[6] = a[6]&b[0] ^ a[5]&b[1] ^ a[4]&b[2] ^ a[3]&b[3] ^ a[2]&b[4] ^ a[1]&b[5] ^ a[0]&b[6] ^ a[7]&b[5] ^ a[6]&b[6] ^ a[5]&b[7] ^ a[7]&b[4] ^ a[6]&b[5] ^ a[5]&b[6] ^ a[4]&b[7] ^ a[7]&b[3] ^ a[6]&b[4] ^ a[5]&b[5] ^ a[4]&b[6] ^ a[3]&b[7];
    z[5] = a[5]&b[0] ^ a[4]&b[1] ^ a[3]&b[2] ^ a[2]&b[3] ^ a[1]&b[4] ^ a[0]&b[5] ^ a[7]&b[4] ^ a[6]&b[5] ^ a[5]&b[6] ^ a[4]&b[7] ^ a[7]&b[3] ^ a[6]&b[4] ^ a[5]&b[5] ^ a[4]&b[6] ^ a[3]&b[7] ^ a[7]&b[2] ^ a[6]&b[3] ^ a[5]&b[4] ^ a[4]&b[5] ^ a[3]&b[6] ^ a[2]&b[7];
    z[4] = a[4]&b[0] ^ a[3]&b[1] ^ a[2]&b[2] ^ a[1]&b[3] ^ a[0]&b[4] ^ a[7]&b[3] ^ a[6]&b[4] ^ a[5]&b[5] ^ a[4]&b[6] ^ a[3]&b[7] ^ a[7]&b[2] ^ a[6]&b[3] ^ a[5]&b[4] ^ a[4]&b[5] ^ a[3]&b[6] ^ a[2]&b[7] ^ a[7]&b[7] ^ a[7]&b[1] ^ a[6]&b[2] ^ a[5]&b[3] ^ a[4]&b[4] ^ a[3]&b[5] ^ a[2]&b[6] ^ a[1]&b[7];
    z[3] = a[3]&b[0] ^ a[2]&b[1] ^ a[1]&b[2] ^ a[0]&b[3] ^ a[7]&b[4] ^ a[6]&b[5] ^ a[5]&b[6] ^ a[4]&b[7] ^ a[7]&b[2] ^ a[6]&b[3] ^ a[5]&b[4] ^ a[4]&b[5] ^ a[3]&b[6] ^ a[2]&b[7] ^ a[7]&b[1] ^ a[6]&b[2] ^ a[5]&b[3] ^ a[4]&b[4] ^ a[3]&b[5] ^ a[2]&b[6] ^ a[1]&b[7] ^ a[7]&b[5] ^ a[6]&b[6] ^ a[5]&b[7];
    z[2] = a[2]&b[0] ^ a[1]&b[1] ^ a[0]&b[2] ^ a[7]&b[3] ^ a[6]&b[4] ^ a[5]&b[5] ^ a[4]&b[6] ^ a[3]&b[7] ^ a[7]&b[1] ^ a[6]&b[2] ^ a[5]&b[3] ^ a[4]&b[4] ^ a[3]&b[5] ^ a[2]&b[6] ^ a[1]&b[7] ^ a[7]&b[6] ^ a[6]&b[7] ^ a[7]&b[5] ^ a[6]&b[6] ^ a[5]&b[7];
    z[1] = a[1]&b[0] ^ a[0]&b[1] ^ a[7]&b[2] ^ a[6]&b[3] ^ a[5]&b[4] ^ a[4]&b[5] ^ a[3]&b[6] ^ a[2]&b[7] ^ a[7]&b[7] ^ a[7]&b[6] ^ a[6]&b[7];
    z[0] = a[0]&b[0] ^ a[7]&b[1] ^ a[6]&b[2] ^ a[5]&b[3] ^ a[4]&b[4] ^ a[3]&b[5] ^ a[2]&b[6] ^ a[1]&b[7] ^ a[7]&b[7] ^ a[7]&b[6] ^ a[6]&b[7] ^ a[7]&b[5] ^ a[6]&b[6] ^ a[5]&b[7];
end
endmodule


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