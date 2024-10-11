module gcd_calculator_tb;
    reg clk;                   // Clock signal
    reg rst;                   // Reset signal
    reg start;                 // Start signal for GCD calculation
    reg [7:0] a;               // First input value
    reg [7:0] b;               // Second input value
    wire [7:0] gcd_out;        // GCD output from the calculator
    wire done;                 // Done signal from the calculator

    // Instantiate the GCD calculator module
    gcd_calculator uut (
        .clk(clk),               // Connect clock signal
        .rst(rst),               // Connect reset signal
        .start(start),           // Connect start signal
        .a(a),                   // Connect first input
        .b(b),                   // Connect second input
        .gcd_out(gcd_out),       // Connect GCD output
        .done(done)             // Connect done signal
    );

    // Clock generation: toggle clock every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10 time units clock period
    end

    // Testbench stimulus
    initial begin
        // Reset and initial conditions
        rst = 1;                 // Assert reset
        start = 0;               // Deassert start
        a = 0;                   // Initialize a
        b = 0;                   // Initialize b
        #10;                     // Wait for 10 time units
        rst = 0;                 // Deassert reset

        // Test case 1: GCD of 54 and 24
        a = 54; b = 24; start = 1;  // Set inputs and assert start
        #10;                     // Wait for 10 time units
        start = 0;               // Deassert start
        wait(done);              // Wait until calculation is done
        #10;                     // Wait for 10 time units
        $display("GCD of 54 and 24: %d", gcd_out);  // Expected: 6

        // Test case 2: GCD of 81 and 27
        a = 81; b = 27; start = 1;  // Set inputs and assert start
        #10;                     // Wait for 10 time units
        start = 0;               // Deassert start
        wait(done);              // Wait until calculation is done
        #10;                     // Wait for 10 time units
        $display("GCD of 81 and 27: %d", gcd_out);  // Expected: 27

        // Test case 3: GCD of 32 and 48
        a = 32; b = 48; start = 1;  // Set inputs and assert start
        #10;                     // Wait for 10 time units
        start = 0;               // Deassert start
        wait(done);              // Wait until calculation is done
        #10;                     // Wait for 10 time units
        $display("GCD of 32 and 48: %d", gcd_out);  // Expected: 16

        // Test case 4: GCD of 45 and 15
        a = 45; b = 15; start = 1;  // Set inputs and assert start
        #10;                     // Wait for 10 time units
        start = 0;               // Deassert start
        wait(done);              // Wait until calculation is done
        #10;                     // Wait for 10 time units
        $display("GCD of 45 and 15: %d", gcd_out);  // Expected: 15

        // Test case 5: GCD of 100 and 50
        a = 100; b = 50; start = 1; // Set inputs and assert start
        #10;                     // Wait for 10 time units
        start = 0;               // Deassert start
        wait(done);              // Wait until calculation is done
        #10;                     // Wait for 10 time units
        $display("GCD of 100 and 50: %d", gcd_out); // Expected: 50

        // End simulation
        $stop;                   // Stop the simulation
    end
endmodule