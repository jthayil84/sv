module tb();
  uvm_barrier ba;
  
  task automatic process(input string p_name, int delay);
    
    $display($time," [%s] Strating the process",p_name);
    $display($time," [%s] Injecting the delay of %0d",p_name,delay);
    #delay;
    
    $display($time," [%s] Before the wait_for",p_name);
    ba.wait_for();
    $display($time," [%s] After the wait_for",p_name);
  endtask
  
  initial begin
    ba = new("ba",3);
    
    fork
      process("A",30);
      process("B",10);
      process("C",20);
      process("D",5);
    join
  end

endmodule