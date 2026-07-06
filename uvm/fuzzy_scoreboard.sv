`include "uvm_macros.svh"
import uvm_pkg::*;

class fuzzy_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(fuzzy_scoreboard)

    uvm_analysis_imp #(fuzzy_transaction,fuzzy_scoreboard) imp;

    function new(string name,uvm_component parent);

        super.new(name,parent);

        imp=new("imp",this);

    endfunction

    virtual function void write(fuzzy_transaction tr);

        `uvm_info("SCOREBOARD",
        $sformatf("History=%0d Frequency=%0d Reason=%0d Prediction=%0b",
        tr.history,tr.frequency,tr.reason,tr.prediction),
        UVM_LOW)

    endfunction

endclass