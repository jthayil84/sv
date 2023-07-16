// Code your testbench here
// or browse Examples


module tb();
  int i;        // Regular array
  typedef bit [5:0] bsix;
  bsix b6 = 3;
  bsix b6_1 =31;
  bsix b6_2 =15;
  logic [0:31] lpa = 32'hx;
  bit clk = 0;
  bit clk1 = 0;
  bit[7:0]pa1[4] = '{8'ha, 8'hb, 8'hc, 8'hc};
  
  int arr1[4];       // Regular array1
  
  bit [3:0][31:0]pa; // Packed array 4 of 32-bits
  int da[];  		 // Dynamic array
  int q[$];			 // Queue
  int j = 5;         // Integer 
  int asso[int];
  
  // Clock
  always#10 clk = ~clk;
  always#20 clk1 = ~clk1;
  
  initial begin

    $dumpfile("dump.vcd");
    $dumpvars;
    
    // Random numbers
    i = $urandom;
    $display("The $urandom value is %d\n",i);
    
    randcase
      10 : $display("10%");
      20 : $display("20%");
      30 : $display("30%");
      50 : $display("50%");
    endcase
       
    i = $urandom_range(33,2);
    $display("The $urandom_range value is %d\n",i);
    
    $display("The typedef value is %d\n",b6);
    // $ cast
    $cast(b6,i);
    $display("The cast value is %d\n",b6);
    
    // inside
    if (b6 inside {b6_1,b6_2})
      $display("b6 value is b6_1 or b6_2 value");
    
    b6 = 20;
    if (b6 inside {[b6_2:b6_1]})
      $display("b6 value is inside range of b6_2 to b6_1 [lower:higher]");
    
    // iff - Waits for the next posedge (event) and checks condition
    @(posedge clk iff(clk1));
    $display("At time %0t clock is pos",$realtime);
    
    @(posedge clk iff(clk1));
    $display("At time %0t clock is pos",$realtime);

    // 4 type comparison
    #70;
    lpa = 32'h1;
    if(lpa === 1) begin
      $display("Logic type lpa not X");
    end
    #30;
    
    // Immediate Assertion 
    imm_lpa_check:              // assertion name
    assert(lpa === 32'h0);       // expression to be checked
      //else
        //$display("Immediate lpa failed");// (optional) custom error message
    #10;
    
    //Repeat
    repeat(5)
      $display("Repeat");
    
    // For each
    foreach(pa1[a_val])
      $display("For each array value: %d", pa1[a_val]);
    
    $dumpvars;
    $finish;
    
  end
  
  // Assertion Concurrent
  con_lpa_check:                          // assertion label
    assert property(@(posedge clk)lpa === 32'hx);
  
endmodule