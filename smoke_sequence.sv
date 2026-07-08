
`include "uvm_macros.svh"
import uvm_pkg::*;

class smoke_sequence extends uvm_sequence #(fuzzy_transaction);


`uvm_object_utils(smoke_sequence)


function new(string name = "smoke_sequence");
super.new(name);
endfunction

task body();

fuzzy_transaction tr;

tr = fuzzy_transaction::type_id::create("tr");
start_item(tr);

tr.history = 8'h80;
tr.frequency = 8'h40;
tr.reason = 2'b01;

finish_item(tr);

endtask

endclass
