`include "uvm_macros.svh"
import uvm_pkg::*;

class fuzzy_sequence extends uvm_sequence #(fuzzy_transaction);

  `uvm_object_utils(fuzzy_sequence)

  function new(string name="fuzzy_sequence");
    super.new(name);
  endfunction

  virtual task body();

    fuzzy_transaction tr;

    repeat (1000) begin

      tr = fuzzy_transaction::type_id::create("tr");

      start_item(tr);

      assert(tr.randomize());

      finish_item(tr);

    end

  endtask

endclass