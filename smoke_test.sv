`include "uvm_macros.svh"
import uvm_pkg::*;


class smoke_test extends fuzzy_test;


`uvm_component_utils(smoke_test)



function new(string name = "smoke_test", uvm_component parent = null);
super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);



smoke_sequence seq; 
phase.raise_objection(this); seq = 
    smoke_sequence::type_id::create("seq"); 
    seq.start(env.agent.seqr); 
    
phase.drop_objection(this);
  endtask

endclass
