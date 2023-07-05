// Code your testbench here
// or browse Examples

import uvm_pkg::*;
module tb;

  `include "uvm_macros.svh"
  initial begin
    `uvm_info("Test 1","Hello World", UVM_NONE);
    uvm_report_info("TEST 2", "This is Reporting", UVM_MEDIUM);
    uvm_report_info("TEST 2", "This is Reporting", UVM_FULL);
    `uvm_error("BAD", "This is an error");
    `uvm_warning("W", "This is a warning");
    `uvm_fatal("MOD", "This is Fatal");
    `uvm_info("MOD","This is reporting 2", UVM_NONE);  
  end
  
endmodule