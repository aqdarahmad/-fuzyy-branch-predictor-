`timescale 1ns/1ps

`include "uvm_macros.svh"
import uvm_pkg::*;

class fuzzy_transaction extends uvm_sequence_item;

rand bit [7:0] history;

rand bit [7:0] frequency;

rand bit [1:0] reason;

bit prediction;



    `uvm_object_utils_begin(fuzzy_transaction)

        `uvm_field_int(history   , UVM_ALL_ON)
        `uvm_field_int(frequency , UVM_ALL_ON)
        `uvm_field_int(reason    , UVM_ALL_ON)
        `uvm_field_int(prediction, UVM_ALL_ON)

    `uvm_object_utils_end

function new(string name = "fuzzy_transaction");
super.new(name);

endfunction

endclass

