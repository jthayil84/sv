// Code your testbench here
// or browse Examples


module tb();
  int i;
  bit clk = 0;
  
  // Clock
  always#10 clk = ~clk;
  
  initial begin

    $dumpfile("dump.vcd");
    
    // Fork
    $display("Fork");
    fork 
      begin
        #10
        $display("Time A is %t:",$realtime);
      end
      begin
        #10
        $display("Time B is %t:",$realtime);
    end
    join // Waits for all
    
    $display("Fork join_any");
    fork 
      begin
        #10
        $display("Time A1 is %t:",$realtime);
      end
      begin
        #20
        $display("Time B1 is %t:",$realtime);
    end
    join_any // Waits for the first then continues. Other processes continue as well
    $display("Time C1 is %t:",$realtime);
    #20
 
    $display("Fork join_none");
    fork 
      begin
        #10
        $display("Time A2 is %t:",$realtime);
      end
      begin
        #20
        $display("Time B2 is %t:",$realtime);
    end
    join_none  // Continues without waiting. All processes go
    $display("Time C2 is %t:",$realtime);
    #30
    
    $display("Wait fork");
    fork 
      begin
        #10
        $display("Time A3 is %t:",$realtime);
      end
      begin
        #20
        $display("Time B3 is %t:",$realtime);
      end
    join_any
    $display("Time C3 is %t:",$realtime);
    //wait fork;  // Waits for all forks to complete
      
    $display("Disable fork");
    fork 
      begin
        #10
        $display("Time A3 is %t:",$realtime);
      end
      begin
        #20
        $display("Time B3 is %t:",$realtime);
      end
    join_any
    $display("Time C3 is %t:",$realtime);
    //disable fork;  // Disables forks
    #20

    display("Barrier"); 
    
    
      
//    $display("Threads"); 
//    process threads[] = new[2];
//      foreach (threads[i])
//      begin
//      fork
//        int thread_index = i;
//        begin
//          threads[thread] = process::self();
//          case (thread_index)
//            0: begin
//             //#10
//              $display("Thread 0");
//            end
//            1: begin
//              //#20
//              $display("Thread 1");
//            end
//          endcase 
//        end
//      join_any
//    end
//      foreach(threads[i]) wait (threads[i] !=null); // Cleans up threads

    $dumpvars;
    $finish;
    
  end

endmodule