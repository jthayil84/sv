program tb();
  
  bit b;			// 2-state single bit
  bit [31:0] b32;	// 2 state 32-bit packed array
  int unsigned ui;	// 2 state 32-bit unsigned int
  int i;			// 2 state 32-bit signed integer
  byte b8;			// 2 state 8-bit signed integer
  shortint s;		// 2 state 16-bit signed integer
  longint l;		// 2 state 64-bit signed integer
  real r;			// 2 state double precision floating point
  
  logic log;		// 4 state single bit, constantly driven
  integer i4; 		// 4 state 32-bit signed integer
  time t;			// 4 state 64-bit unsigned integer
  
  initial begin

    $dumpfile("dump.vcd");
    $dumpvars;
    
    
    // Assign values and print
    b = 1'b1;
    b32 = 32'hbeef_cafe;
    ui = 300;
    i = 300;
    b8 = 300;
    s = 300;
    l = 300;
    r =300;
    
    log = 1'b1;
    i4 = 32'hz1z;
    t = 32'hx;
    
    
    $display("b = 0x%0b", b);
    $display("b32 = 0x%0h", b32);
    $display("ui = 0x%0h", ui);
    $display("i = 0x%0h", i);
    $display("b8 = 0x%0h", b8);
    $display("s = 0x%0h", s);
    $display("l = 0x%0h", l);
    $display("r = 0x%0h", r);
    $display("log = 0x%0h", log);
    $display("i4 = 0x%0h", i4);
    $display("t = 0x%0h", t);


    
    $dumpvars;   
  end
  
  
  
endprogram