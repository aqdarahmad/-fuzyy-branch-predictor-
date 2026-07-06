`include "uvm_macros.svh" 
import uvm_pkg::*;

class fuzzy_monitor extends uvm_monitor; 

`uvm_component_utils(fuzzy_monitor)


virtual fuzzy_if vif;

uvm_analysis_port #(fuzzy_transaction) ap;

function new(string name="fuzzy_monitor",uvm_component parent);
super.new(name,parent);
ap=new("ap",this);
endfunction


virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);

uvm_config_db#(virtual fuzzy_if)::get(this,"","vif",vif);

endfunction


virtual task run_phase(uvm_phase phase);
    fuzzy_transaction tr;
forever begin 
#10;
 tr=new();
 tr.history=vif.history; 
tr.frequency=vif.frequency; 
   tr.reason=vif.reason; 
tr.prediction=vif.prediction;
 ap.write(tr);
        end

endtask
endclass
