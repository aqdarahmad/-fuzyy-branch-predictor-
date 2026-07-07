`include "uvm_macros.svh"
import uvm_pkg::*;


class regression_sequence extends uvm_sequence #(fuzzy_transaction);


    `uvm_object_utils(regression_sequence)



    function new(string name="regression_sequence");

        super.new(name);

    endfunction




    task send_case(
        input int case_num,
        input bit [7:0] history,
        input bit [7:0] frequency,
        input bit [1:0] reason,
        input bit expected
    );


        fuzzy_transaction tr;


        tr = fuzzy_transaction::type_id::create(
             $sformatf("case_%0d",case_num)
        );


        start_item(tr);



        tr.history   = history;
        tr.frequency = frequency;
        tr.reason    = reason;



        finish_item(tr);



       `uvm_info(
"REGRESSION",
$sformatf(
"\n=============================\n\
 TEST CASE %0d\n\
-----------------------------\n\
 History    : %0d\n\
 Frequency  : %0d\n\
 Reason     : %0d\n\
 Expected   : %0d\n\
=============================",
case_num,
history,
frequency,
reason,
expected),
UVM_LOW)


    endtask





    virtual task body();


        int c = 1;



        // ==================================
        // Rule 1:
        // History High + Reason Loop
        // Expected: Taken (1)
        // ==================================

        send_case(c++,70,10,2,1);
        send_case(c++,80,50,2,1);
        send_case(c++,100,100,2,1);



        // ==================================
        // Rule 2:
        // History Low + Error Check
        // Expected: Not Taken (0)
        // ==================================

        send_case(c++,0,80,0,0);
        send_case(c++,20,50,0,0);
        send_case(c++,30,100,0,0);



        // ==================================
        // Rule 3:
        // History High + Frequency High
        // Expected: Taken (1)
        // ==================================

        send_case(c++,70,70,0,1);
        send_case(c++,85,90,1,1);
        send_case(c++,100,100,2,1);



        // ==================================
        // Rule 4:
        // History Medium + IF Statement
        // Expected: Taken (1)
        // ==================================

        send_case(c++,31,20,1,1);
        send_case(c++,50,50,1,1);
        send_case(c++,69,80,1,1);



        // ==================================
        // Rule 5:
        // History Low + Frequency Low
        // Expected: Not Taken (0)
        // ==================================

        send_case(c++,0,0,2,0);
        send_case(c++,20,10,1,0);
        send_case(c++,30,30,0,0);



        `uvm_info(
            "REGRESSION",
            "==============================",
            UVM_LOW
        )


        `uvm_info(
            "REGRESSION",
            "Regression Testing Completed Successfully",
            UVM_LOW
        )


    endtask


endclass
