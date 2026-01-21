# Electronic Voting Machine (EVM) on FPGA – Basys 3

## 📌Overview
This project implements a fully functional **Electronic Voting Machine (EVM)** on an FPGA using **Verilog HDL**, targeted for the **Basys 3 (Artix-7)** development board.  
The system supports **four candidates** and operates in **two modes**:
- Voting Mode
- Counting Mode

The design is modular, synchronous, and fully synthesizable, and has been successfully implemented on hardware.

---

## Features
- Supports **4 candidates**
- **Two operating modes**: Voting and Counting
- Debounced and validated push-button inputs
- Secure vote logging mechanism
- Multiplexed **4-digit 7-segment display**
- Binary to BCD conversion for display
- Implemented and tested on **Basys 3 FPGA board**

---

## System Architecture

Top Module  
├── Clock Divider  
├── Button Control  
├── Mode Control  
├── Voter Logger  
└── Display Controller  
&nbsp;&nbsp;&nbsp;&nbsp;├── Binary to BCD Converter  
&nbsp;&nbsp;&nbsp;&nbsp;└── Seven Segment Display Driver  

---

## Module Description

### 1. Clock Divider
- Divides the 100 MHz onboard clock to a lower frequency
- Provides stable timing for button control and display multiplexing

---

### 2. Button Control
- Handles push-button inputs
- Performs debouncing and validation
- Generates a single-cycle valid vote signal
- Prevents multiple counts from a single press

---

### 3. Mode Control
- Controls system operation between Voting Mode and Counting Mode
- Uses internal counters and flags for mode switching
- Drives LEDs to indicate current system state
- Routes valid votes to the appropriate candidate

---

### 4. Voter Logger
- Maintains vote count for each candidate
- Increments vote count only when:
  - System is in voting mode
  - Corresponding candidate button is pressed
  - Vote is validated
- Ensures reliable and accurate vote counting

---

### 5. Display Controller
Responsible for displaying vote counts on the Basys 3 7-segment display.

#### a) Binary to BCD Converter
- Converts binary vote count into:
  - Thousands
  - Hundreds
  - Tens
  - Ones
- Uses the shift-and-add-3 (Double Dabble) algorithm

#### b) Seven Segment Display Driver
- Drives the 4-digit multiplexed 7-segment display
- Rapid digit switching for continuous visual output
- Compatible with active-low anode and segment signals of Basys 3

---

## Operating Modes

### Voting Mode
- Enabled through mode control logic
- Voters cast votes using push buttons
- Validated votes are logged securely
- LEDs indicate voting activity

### Counting Mode
- Displays total votes of selected candidate
- Vote count shown on 7-segment display
- Candidate selection via push buttons

---

##  Hardware and Tools Used
- FPGA Board: **Basys 3 (Artix-7)**
- Inputs: Push buttons, switches
- Outputs: LEDs, 4-digit 7-segment display
- HDL: Verilog
- Toolchain: Xilinx Vivado

---
##  Future Enhancements
- Increase the number of supported candidates
- Add voter authentication using ID or password mechanism
- Store vote data in non-volatile memory (EEPROM / Flash)
- Integrate UART or LCD for external result display
- Add real-time clock (RTC) for timestamped voting
- Implement vote encryption for enhanced security
- Improve scalability and modularity for larger elections

## Author
**Sarath Srinivasan**  
B.Tech Electrical Engineering  
FPGA | Digital Design | Verilog | VLSI Enthusiast




