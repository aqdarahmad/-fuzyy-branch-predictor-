

`timescale 1ns/1ps


module tb;


logic [7:0] history;

logic [7:0] frequency;

logic [1:0] reason;

logic prediction;



design uut(.history(history),.frequency(frequency),.reason(reason),
.prediction(prediction));




 initial begin history = 80; frequency = 70; reason = 2; #10; 
    $display("P1 = %b", prediction); history = 30; frequency = 20; 
    reason = 0; 
#10;
 $display("P2 = %b", prediction); history = 60; 
    frequency = 80; reason = 1;
 #10;
 $display("P3 = %b", prediction); 
    $finish;
end
endmodule
