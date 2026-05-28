# 16x16 INT8 Systolic Array

## Overview

This project implements a 16×16 INT8 systolic array using Verilog/SystemVerilog.

The design consists of interconnected Processing Elements (PEs) performing parallel Multiply-Accumulate (MAC) operations. Data propagates through the array in a systolic fashion:

- `a_in` propagates horizontally
- `b_in` propagates vertically

Each PE performs:

```verilog
sum <= sum + (a_in * b_in);
```

This project demonstrates:
- Parallel MAC computation
- Systolic dataflow architecture
- PE mesh interconnection
- RTL design using generate loops
- Functional simulation in Vivado

---

## Architecture

### Dataflow

```text
A values → Left to Right
B values ↓ Top to Bottom
```

Each PE receives:
- `a_in`
- `b_in`

and produces:
- `a_out`
- `b_out`
- accumulated `sum`

---

## Processing Element (PE)

Each PE performs:
- INT8 multiplication
- INT32 accumulation

### Operation

\[
sum = sum + (a\_in \times b\_in)
\]

---

## Project Structure

```text
systolic-array/
│
├── rtl/
│   ├── pe.sv
│   └── systolic_array.sv
│
├── tb/
│   └── systolic_array_tb.sv
│
├── sim/
│   └── waveform.png
│
├── README.md
│
└── .gitignore
```

---

## Simulation

### Testbench Features

- Generates clock and reset
- Applies INT8 input vectors
- Verifies systolic propagation
- Displays PE outputs

### Example Inputs

```text
a_in = {1,2,3,...16}
b_in = {1,2,3,...16}
```

---

## Tools Used

- Vivado
- Verilog/SystemVerilog

---

## Future Improvements

Planned enhancements:
- Proper matrix multiplication scheduling
- Controller FSM
- AXI interface
- SRAM/BRAM buffering
- Output valid signaling
- Tensor-core-style tiled GEMM execution

---

## Author

Sai Shashank
ECE Undergraduate
B V Raju Institute of Technology
