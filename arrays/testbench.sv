// Code your testbench here


module tb();
  int arr[4];        // Regular array
  int arr1[4];       // Regular array1
  bit[7:0]pa1[4] = '{8'ha, 8'hb, 8'hc, 8'hc};
  bit [3:0][31:0]pa; // Packed array 4 of 32-bits
  int da[];  		 // Dynamic array
  int q[$];			 // Queue
  int j = 5;         // Integer 
  int asso[int];
  
  initial begin

    $dumpfile("dump.vcd");
    $dumpvars;
    
    // Regular array
    arr = '{1,2,3,4};  // initialize entire array
    arr1 = arr;        // initialize entire array1
    foreach(arr[j])
      $display("Regular array = 0x%0h", arr[j]);
    arr[2:3] = '{8,8}; // Change middle values
    foreach(arr[j])
      $display("Regular array = 0x%0h", arr[j]);
    arr = '{4{7}}; // Change 4 values
    foreach(arr[j])
      $display("Regular array = 0x%0h", arr[j]);
    
    
    // Packed array
    pa = 64'hface_cafe_face_cafe; // Writes to 64 bits
    pa[1] = #20 32'hdead_cafe;    // Writes to only second 32 bits
    $display("Packed array pa = 0x%0h", pa);
    $display("Packed array pa[0] = 0x%0h", pa[0]);
    $display("Packed array pa[1] = 0x%0h", pa[1]);
    
    // Dynamic arrays
    da = new[5];   // Allocate 5 elements
    foreach (da[j]) da[j] = j; // Initialize elements
    foreach(da[j])
      $display("Dynamic array 1 da %h",da[j]);
    da = new[8] (da);   // Allocate 8  and copy over old
    foreach(da[j])
      $display("Dynamic array 2 da %h",da[j]);
    da = new[10];       // Reinitalize with 10 elements
    foreach(da[j])
      $display("Dynamic array 3 da %h",da[j]);
    
    // Queues
    $display("Queues");
    // Best of linked list and array
    // Variable sized fifo
    q = {1,2,3,4,5};  // No '
    $display("Queue size is %0d", q.size());
    j = q.pop_front();
    j = q.pop_back();
    q.push_front(0);
    q.push_back(6);
    q.insert(4,9);
    q.delete(1);
    foreach(q[i]) $display("\tq[%0d] = %0d",i,q[i]);
    
    
    // Associative array
    $display("Associative array");
    // For very big array, save memory. Stored as tree or hash table   
    asso = '{1:4,2:6};
    $display("asso is %p", asso);
    asso = '{};
    // Initialize with scattered values
    j = 1;
    do begin
      asso[j] = j;
      j = j << 1;
    end while (j != 0);
    // Display each value with foreach
    foreach (asso[j])
      $display("asso[%h] = %h", j, asso[j]);
    // Step through using functions
    if(asso.first(j)) // put first index in j if exists
      do
        $display("next asso[%h] = %h", j, asso[j]);
      while(asso.next(j)); // Next index as long as there is one
    // Delete and num
    $display("The asso array has %d elements", asso.num());
    asso.delete(2);
    $display("The asso array now has %d elements", asso.num());
    $display("asso is %p", asso);

    // Array functions
    $display("Array functions");
    //arr1 = arr;        // initialize entire array1
    arr = '{4,3,2,1};
    $display("arr is %p", arr);
    $display("find %p", arr.find(x) with (x < 3));
    $display("find_index %p", arr.find_index(x) with (x < 3));
    $display("find_first %p", arr.find_first(x) with (x < 3));
    $display("find_first_index %p", arr.find_first_index(x) with (x < 3));
    $display("find_last %p", arr.find_last(x) with (x < 3));
    $display("find_last_index %p", arr.find_last_index(x) with (x < 3));
    arr = '{4,4,6,1};
    $display("min %p", arr.min());
    $display("max %p", arr.max());
    $display("unique %p", arr.unique());
    $display("unique_index %p", arr.unique_index());
    arr.reverse();
    $display("reverse %p", arr);
    arr.sort();
    $display("sort %p", arr);
    arr.rsort();
    $display("rsort %p", arr);
    arr.shuffle();
    $display("shuffle %p", arr);
    // Reduction methods
    $display("sum %d", arr.sum());
    $display("product %d", arr.product());
    $display("and %h", arr.and());
    $display("or %h", arr.or());
    $display("xor %h", arr.xor());
    if (arr != arr1)
      begin
        $display("The arrays are not equal");
      end

    // Streaming operators
    $display("Streaming operators");
    pa = 4'he;
    j = { >> {pa1}};
    $display("Pack array is %h", j);
    j = { << {pa1}};
    $display("Pack array reverse is %h", j);
    
       
    $dumpvars;   
  end
  
  
  
endmodule
