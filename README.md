# 8-Bit GCD Calculator
This repository contains an **8-Bit GCD (Greatest Common Divisor) Calculator** implemented in Verilog. The GCD calculator is a fundamental component in arithmetic operations, used to find the largest positive integer that divides two given integers without leaving a remainder.

## What is GCD?
The **Greatest Common Divisor (GCD)** of two integers is the largest integer that can divide both numbers without any remainder. GCD is widely used in various applications, including number theory, cryptography, and simplifying fractions.

![gcd_entity (1)](https://github.com/user-attachments/assets/89c6d24e-53db-4929-abf1-c394bf783313)


## Key Features of the 8-Bit GCD Calculator
This design is parameterized to handle 8-bit input values, making it suitable for a range of applications.

### Supported Features:
- **8-Bit Input**: Accepts two 8-bit binary numbers as input for GCD calculation.
- **Idle, Complete, and Done States**: The calculator has state signals that indicate the operation status:
  - **Idle**: The system is not currently processing any inputs.
  - **Complete**: The GCD calculation has finished successfully.
  - **Done**: The result is ready for output.

### Operation:
1. **Input Operands**: The calculator takes two 8-bit binary numbers (`A` and `B`) as inputs.
2. **GCD Calculation**: The algorithm employs the Euclidean method, repeatedly replacing the larger number by the remainder of the division until one number becomes zero.
3. **State Machine**: A state machine controls the operation, transitioning through Idle, Calculate, Complete, and Done states.

## Design Considerations:
- **Efficiency**: The GCD algorithm is efficient for small integers, but performance can vary based on the input values.
- **Resource Utilization**: The design can be optimized for area or speed depending on the requirements.

## Advantages:
- **Fast Computation**: The Euclidean algorithm provides a quick method for calculating the GCD.
- **State Indication**: The inclusion of state signals allows for easier integration with larger systems and provides clear feedback on the operation status.

## Applications:
- **Arithmetic Operations**: Used in various arithmetic operations where GCD calculations are required, such as reducing fractions.
- **Cryptographic Algorithms**: Important in algorithms like RSA, which relies on number theory.
- **Digital Signal Processing**: Utilized in DSP applications for filtering and data processing.

## Testbench and Verification:
- **Simulation**: A Verilog testbench is provided to verify the functionality of the 8-Bit GCD Calculator. It tests various GCD scenarios, including edge cases.
- **Edge Cases**: The testbench ensures correct behavior for maximum values, minimum values, and common divisors.

## Key Components:
- **State Machine**: Manages the operation states (Idle, Calculate, Complete, Done) of the GCD calculator.
- **GCD Logic**: Implements the Euclidean algorithm to compute the GCD of the two input values.
- **Output Signals**: Provides the computed GCD as an output along with status signals indicating the operation state.

## Example Configuration:
- **Input Bit-Width**: 8 bits
- **Design Language**: Verilog
- **State Management**: Incorporates an efficient state machine for operation control.

## Outputs:

![Screenshot 2024-10-11 122304](https://github.com/user-attachments/assets/d256775c-7ee3-4914-9cd2-9390ed079da4)

![Screenshot 2024-10-11 122354](https://github.com/user-attachments/assets/78329bea-fac2-49d0-b506-83d44f5968f9)


## Future Enhancements:
- **Support for Larger Bit-Widths**: Enhancing the design to handle larger integers beyond 8 bits.
- **User Interface**: Implementing a simple user interface for easier input/output management.
- **Additional Algorithms**: Supporting more GCD algorithms for flexibility in computation methods.

## Contributing:
Contributions, suggestions, and improvements are welcome! Feel free to open issues or submit pull requests.
