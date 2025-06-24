# Electronic Voting Machine (EVM) – Verilog

## Overview
This project implements a **4-candidate Electronic Voting Machine (EVM)** using Verilog HDL. The design simulates a real-world voting system where users can cast votes, and results can be displayed in a controlled manner. The system is modular, covering vote validation, counting, and result display.

The project was developed as part of an RTL design and verification learning initiative and is simulated using EDA Playground.

---

## Module Structure

### `evm.v` – RTL Design (All Modules)
- **`buttonControl`**  
  Debounces the user button input and generates a valid vote signal only after a sustained press duration (for noise immunity).

- **`voteLogger`**  
  Maintains vote counters for each of the four candidates and updates counts upon receiving a valid vote in **voting mode**.

- **`modeControl`**  
  Controls the output display using LEDs based on the selected candidate and system mode. In **result mode**, it shows vote count for a selected candidate.

- **`votingMachine`**  
  The top-level module that instantiates and connects all submodules. It manages inputs from user buttons and system mode selection.

---

### `evm_tb.v` – Testbench
- Provides simulation inputs for vote casting and mode changes.
- Verifies vote registration and LED output behavior.
- Designed for waveform observation and result validation.

---

## Features
- **Supports 4 candidates** with dedicated input buttons.
- **Vote validation logic** using press duration counter.
- **Two modes of operation**: voting and result display.
- Modular, reusable Verilog code for clarity and scalability.
- Simulated using [EDA Playground](https://edaplayground.com) or tools like ModelSim/GTKWave.

---

## ▶️ How to Run (EDA Playground)
1. Upload `evm.v` and `evm_tb.v` into your Verilog simulation environment.
2. Set `votingMachine` as the top module in your simulator.
3. Run the simulation and observe waveforms or `led` output behavior.
4. Optional: Use `$dumpfile`, `$dumpvars`, and GTKWave for visual debugging.

---

