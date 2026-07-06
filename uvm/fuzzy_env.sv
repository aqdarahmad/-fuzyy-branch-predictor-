`include "uvm_macros.svh"
import uvm_pkg::*;

class fuzzy_env extends uvm_env;

    `uvm_component_utils(fuzzy_env)

    fuzzy_agent agent;

    fuzzy_scoreboard sb;

    function new(string name,uvm_component parent);

        super.new(name,parent);

    endfunction

    virtual function void build_phase(uvm_phase phase);

        agent=fuzzy_agent::type_id::create("agent",this);

        sb=fuzzy_scoreboard::type_id::create("sb",this);

    endfunction

    virtual function void connect_phase(uvm_phase phase);

        agent.monitor.ap.connect(sb.imp);

    endfunction

endclass