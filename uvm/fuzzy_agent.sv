`include "uvm_macros.svh"
import uvm_pkg::*;

class fuzzy_agent extends uvm_agent;

    `uvm_component_utils(fuzzy_agent)

    fuzzy_driver driver;

    uvm_sequencer #(fuzzy_transaction) seqr;

    fuzzy_monitor monitor;

    function new(string name,uvm_component parent);

        super.new(name,parent);

    endfunction

    virtual function void build_phase(uvm_phase phase);

        driver=fuzzy_driver::type_id::create("driver",this);

        monitor=fuzzy_monitor::type_id::create("monitor",this);

        seqr=uvm_sequencer#(fuzzy_transaction)::type_id::create("seqr",this);

    endfunction

    virtual function void connect_phase(uvm_phase phase);

        driver.seq_item_port.connect(seqr.seq_item_export);

    endfunction

endclass