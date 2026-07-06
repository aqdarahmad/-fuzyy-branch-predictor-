
`timescale 1ns/1ps

`include "uvm_macros.svh"
import uvm_pkg::*;

class fuzzy_driver extends uvm_driver#(fuzzy_transaction);

`uvm_component_utils(fuzzy_driver)

virtual fuzzy_if vif;

function new(string name = "fuzzy_driver", uvm_component parent=null);
super.new(name , parent);

endfunction 


virtual function void build_phase(uvm_phase phase);


super.build_phase(phase);


 if(!uvm_config_db#(virtual fuzzy_if)::get(this,"","vif",vif))
            `uvm_fatal("NOVIF","Virtual Interface not found")

endfunction


    virtual task run_phase(uvm_phase phase);

        forever begin

            seq_item_port.get_next_item(req);

            vif.history   = req.history;
            vif.frequency = req.frequency;
            vif.reason    = req.reason;

            #10;

            seq_item_port.item_done();

        end

    endtask


endclass
