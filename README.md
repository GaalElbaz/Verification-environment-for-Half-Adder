# Verification Environment for Half Adder

This verification project focuses on testing and validating the functionality of a Half Adder hardware design using SystemVerilog. The project consists of various components including a generator, driver, monitor, scoreboard, and an environment to orchestrate the verification process.

## Project Components:

### 1. `generator.sv`
- Generates input transactions for testing the Half Adder.
- Randomizes input values and sends them to the driver.

### 2. `driver.sv`
- Drives the input transactions to the Half Adder hardware.
- Interfaces with the Half Adder module through a virtual interface.

### 3. `monitor.sv`
- Monitors the behavior of the Half Adder during simulation.
- Captures the input and output signals of the Half Adder.

### 4. `scoreboard.sv`
- Compares the expected output with the actual output of the Half Adder.
- Verifies the correctness of the Half Adder's operation.

### 5. `ha_if.sv`
- Defines an interface for the Half Adder module.
- Specifies the input and output ports for connecting to the Half Adder.

### 6. `half_adder.sv`
- Implements the Half Adder hardware module.
- Performs binary addition operation on input signals.

### 7. `haif_tb.sv`
- Top-level module for the verification environment.
- Instantiates the Half Adder module and connects it to the verification components.


