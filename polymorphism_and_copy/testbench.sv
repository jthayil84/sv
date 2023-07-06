// Code your testbench here
// or browse Examples

// Pure Virtual Class as base only for inheritence
virtual class person;
  pure virtual function void v_run();
endclass


// Employee class extends person 
class employee_record extends person;
  int age;
  string name;
 
  // Constructor
  function new (input string name, input int age);
    this.age  = age;
    this.name = name;
  endfunction
 
  function void run();
    $display("Employee");
  endfunction
 
  function void v_run();
    $display("Employee");
  endfunction
endclass
 
// contractor class extends person 
class contractor_record extends person;
  int age;
  string name;
 
  // Constructor
  function new (input string name, input int age);
    this.age  = age;
    this.name = name;
  endfunction
 
  function void run();
    $display("Contractor");
  endfunction
 
  function void v_run();
    $display("Contractor");
  endfunction
endclass

// hardware class extends employee
class hardware extends employee_record;
 
  function new(input string name,input int age);
    super.new(name,age);
  endfunction
 
  function void run();
    $display("Employee: Hardware \t::\t Name : %0s \t::\t Age : %0d",name,age);
  endfunction
  
function void v_run();
    $display("Employee: Hardware \t::\t Name : %0s \t::\t Age : %0d",name,age);
  endfunction
 
endclass
 
// software class extends employee
class software extends employee_record;
 
function new(input string name,input int age);
super.new(name,age);
endfunction
 
function void run();
  $display("Employee : Software \t::\t Name : %0s \t::\t Age : %0d",name,age);
endfunction
 
function void v_run();
  $display("Employee : Software \t::\t Name : %0s \t::\t Age : %0d",name,age);
endfunction
  
endclass

// tech class extends hardware
class tech extends hardware;
 
  function new(input string name,input int age);
    super.new(name,age);
  endfunction
 
  function void run();
    $display("Employee : Hardware \t::\t Position : Tech \t::\t Name : %0s \t::\t Age : %0d",name,age);
  endfunction
 
  function void v_run();
    $display("Employee : Hardware \t::\t Position : Tech \t::\t Name : %0s \t::\t Age : %0d",name,age);
  endfunction
  
endclass

// design class extends hardware
class dsn extends hardware;
 
  function new(input string name,input int age);
    super.new(name,age);
  endfunction
 
  function void run();
    $display("Employee : Hardware \t::\t Position : design \t::\t Name : %0s \t::\t Age : %0d",name,age);
  endfunction

  function void v_run();
    $display("Employee : Hardware \t::\t Position : design \t::\t Name : %0s \t::\t Age : %0d",name,age);
  endfunction
  
endclass

module tb;
  person p;
  employee_record e1, e2;
  contractor_record c1, c2;
  hardware h1,h2;
  software s1,s2;
  tech t1, t2;
  dsn d1, d2;
 
  initial begin
    c1 = new("Kim", 22);
    h1 = new("Jason", 25);
    s1 = new("George", 25);
    t1 = new("Jane", 22);
    d1 = new("Jimmy",39);
    
    // Employee record 
    e1 = h1;
    e1.run();   // Resolves to handle e1
    e1.v_run(); // Resoves to contents h1
    
    // tech
    e1 = t1;
    e1.run();   // Resolves to handle e1
    e1.v_run(); // Resoves to contents t1
    h2 = t1;
    h2.run();   // Resolves to handle h2
    h2.v_run(); // resolves to contents t1
    
    // person can resolve to anyone
    $display("person can resolve to any child");
    p = h1;
    p.v_run();
    p = c1;
    p.v_run();
    p = s1;
    p.v_run();
    p = d1;
    p.v_run();
    
    // Reference copy vs clone
    $display("Reference copy");
    e1 = h1;
    h2 = new h1;
    h1.age = 44;
    $display("Updating age of h1");
    h1.v_run();
    $display("e1 is a reference copy so it points to same location. Has updated age");
    e1.v_run();
    $display("h2 is aclone so it value hasn't been altered. Clone not deep in case it points to other classes");
    h2.v_run();
    
  end
 
endmodule