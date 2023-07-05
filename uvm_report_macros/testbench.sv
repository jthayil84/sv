// Code your testbench here
// or browse Examples

import uvm_pkg::*;
module tb;

  `include "uvm_macros.svh"
  initial begin
    // Trying various report macro levels
    `uvm_info("Test 1","Hello World", UVM_NONE);
    `uvm_info("Test 2","Hello World", UVM_LOW);
    `uvm_info("Test 3","Hello World", UVM_MEDIUM);
    `uvm_info("Test 4","Hello World", UVM_HIGH);
    `uvm_info("Test 5","Hello World", UVM_FULL);
    `uvm_info("Test 1","Hello World", UVM_DEBUG);
    uvm_report_info("TEST 2", "This is Reporting MEDIUM", UVM_MEDIUM);
    `uvm_error("BAD", "This is an error");
    `uvm_warning("W", "This is a warning");
    `uvm_fatal("MOD", "This is Fatal");
    `uvm_info("MOD","This is reporting 2", UVM_NONE);  
  end
  
endmodule