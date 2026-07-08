`include "uvm_macros.svh"
import uvm_pkg::*;

class fuzzy_sequencer extends uvm_sequencer #(fuzzy_transaction);

  `uvm_component_utils(fuzzy_sequencer)

  function new(string name="fuzzy_sequencer",
               uvm_component parent=null);
    super.new(name,parent);
  endfunction

endclass
