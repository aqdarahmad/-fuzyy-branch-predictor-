`timescale 1ns/1ps

`include "uvm_macros.svh"

import uvm_pkg::*;

module top;

    fuzzy_if vif();

    design dut(

        .history(vif.history),
        .frequency(vif.frequency),
        .reason(vif.reason),
        .prediction(vif.prediction)

    );

    initial begin

        uvm_config_db#(virtual fuzzy_if)::set(null,"*","vif",vif);

      //  run_test("fuzzy_test");
        run_test("regression_test");

    end

endmodule