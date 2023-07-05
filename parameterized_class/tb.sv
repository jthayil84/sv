// Code your testbench here
// or browse Examples

import uvm_pkg::*;
`include "uvm_macros.svh"

class param_class #(type d_type = int, int count=5);
  local d_type data[count-1:0];
  
  function void run();
    `uvm_info("param class", $sformatf("The size of array is %d",$size(data)), UVM_FULL);
    for(int i = 0; i < $size(data); i++) begin
      data[i] = i+2;
      `uvm_info("param class", $sformatf("The value is %d",data[i]), UVM_LOW);
    end
  endfunction : run
endclass
  


module tb;
  
  initial begin
    param_class #(.d_type(int), .count(12)) p_class = new;
    //p_class = new();
    p_class.run();
  end
endmodule : tb