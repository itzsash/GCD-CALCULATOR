module gcd_calculator (
    input wire clk,              // Clock input
    input wire rst,              // Reset input
    input wire start,            // Start signal to initiate GCD calculation
    input wire [7:0] a,          // First 8-bit input
    input wire [7:0] b,          // Second 8-bit input
    output reg [7:0] gcd_out,     // Output for GCD result
    output reg done              // Done signal to indicate completion
);
    reg [7:0] x;                 // Internal register for first number
    reg [7:0] y;                 // Internal register for second number
    reg [1:0] state;             // State variable for FSM

    // State definitions
    localparam IDLE = 2'b00;      // Idle state
    localparam COMPUTE = 2'b01;   // Compute state
    localparam DONE = 2'b10;       // Done state

    // Main logic for GCD calculation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            gcd_out <= 0;          // Reset GCD output
            done <= 0;             // Reset done signal
            state <= IDLE;         // Reset state to IDLE
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin  // Start GCD calculation on start signal
                        x <= a;        // Load first input
                        y <= b;        // Load second input
                        state <= COMPUTE; // Transition to COMPUTE state
                        done <= 0;     // Reset done signal
                    end
                end
                COMPUTE: begin
                    if (y != 0) begin  // Continue while y is not zero
                        if (x > y)      // If x is greater, subtract y from x
                            x <= x - y;
                        else             // If y is greater or equal, subtract x from y
                            y <= y - x;
                    end else begin
                        gcd_out <= x;   // GCD found when y becomes zero
                        state <= DONE;  // Transition to DONE state
                    end
                end
                DONE: begin
                    done <= 1;         // Set done signal to indicate completion
                    state <= IDLE;     // Reset state to IDLE for next calculation
                end
            endcase
        end
    end
endmodule