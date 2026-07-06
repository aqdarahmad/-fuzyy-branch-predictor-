

`timescale 1ns/1ps


module design(
input logic [7:0] history,
input logic [7:0] frequency,
input logic [1:0] reason,
output logic prediction

);

integer taken_score;

always_comb begin

    taken_score = 0;

    // Rule 1
    if(history >= 70 && reason == 2)
        taken_score += 40;

    // Rule 2
    if(history <= 30 && reason == 0)
        taken_score -= 40;

    // Rule 3
    if(frequency >= 60 && history >= 60)
        taken_score += 30;

    // Rule 4
    if(reason == 1 && history >= 40 && history <= 70)
        taken_score += 20;

    // Rule 5
    if(frequency <= 30 && history <= 40)
        taken_score -= 30;

    prediction = (taken_score > 0);

    $display("history=%0d freq=%0d reason=%0d score=%0d prediction=%0b",
             history, frequency, reason, taken_score, prediction);

end


endmodule
