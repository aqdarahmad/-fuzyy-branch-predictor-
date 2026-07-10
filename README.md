# 🧠 Fuzzy Branch Predictor

<p align="center">

![SystemVerilog](https://img.shields.io/badge/SystemVerilog-HDL-blue)
![Verilog](https://img.shields.io/badge/Verilog-RTL-red)
![UVM](https://img.shields.io/badge/UVM-Verification-green)
![Cadence](https://img.shields.io/badge/Cadence-Xcelium-orange)
![Status](https://img.shields.io/badge/Status-Completed-success)

</p>

---

## 📌 Overview

The **Fuzzy Branch Predictor** is a hardware prediction system implemented in **Verilog/SystemVerilog** and verified using the **Universal Verification Methodology (UVM)**.

Instead of relying solely on branch history, the predictor applies **Fuzzy Logic** to estimate whether a branch should be **Taken** or **Not Taken** using multiple behavioral factors.

---

## ✨ Features

* ✅ RTL Design
* ✅ UVM Verification Environment
* ✅ Functional Coverage
* ✅ Scoreboard with Reference Model
* ✅ Smoke Testing
* ✅ Regression Testing
* ✅ Modular Architecture
* ✅ Reusable Verification Components

---

## 🏗️ System Architecture

```text
                 +----------------+
                 |   History      |
                 +----------------+
                         |
                         |
                 +----------------+
                 |  Frequency     |
                 +----------------+
                         |
                         |
                 +----------------+
                 | Branch Reason  |
                 +----------------+
                         |
                         ▼
               +----------------------+
               |  Fuzzy Rule Engine   |
               +----------------------+
                         |
                         ▼
                +------------------+
                | Branch Prediction|
                | Taken / Not Taken|
                +------------------+
```

---

## 📥 Inputs

| Input     | Description              |
| --------- | ------------------------ |
| History   | Previous branch behavior |
| Frequency | Execution frequency      |
| Reason    | Branch type              |

### Branch Reason Encoding

| Value | Type         |
| ----: | ------------ |
|     0 | Error Check  |
|     1 | IF Statement |
|     2 | Loop         |

---

## 📤 Output

| Output     | Description       |
| ---------- | ----------------- |
| Prediction | Taken / Not Taken |

---

## 🧩 Fuzzy Rules

| Rule                              | Decision  |
| --------------------------------- | --------- |
| History = High & Loop             | Taken     |
| History = Low & Error Check       | Not Taken |
| History = High & Frequency = High | Taken     |
| History = Medium & IF Statement   | Taken     |
| History = Low & Frequency = Low   | Not Taken |

---

## 📊 Membership Functions

| Level     | Range    |
| --------- | -------- |
| 🟢 Low    | 0 – 30   |
| 🟡 Medium | 31 – 69  |
| 🔴 High   | 70 – 100 |

---

## 🧪 Verification Environment

```
Sequence
    │
    ▼
Sequencer
    │
    ▼
 Driver
    │
    ▼
   DUT
    │
    ▼
 Monitor
    │
    ├────────► Coverage
    │
    ▼
Scoreboard
```

---

## 📂 Project Structure

```text
project/
│
├── rtl/
│   └── rtl.sv
│
├── uvm/
│   ├── interface.sv
│   ├── transaction.sv
│   ├── sequence.sv
│   ├── sequencer.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── agent.sv
│   ├── scoreboard.sv
│   ├── env.sv
│   ├── test.sv
│   ├── smoke_sequence.sv
│   ├── smoke_test.sv
│   ├── regression_sequence.sv
│   ├── regression_test.sv
│   └── top.sv
│
├── run.f
└── README.md
```

---

## ▶️ Run Simulation

### Smoke Test

```bash
xrun -f run.f +UVM_TESTNAME=smoke_test
```

### Regression Test

```bash
xrun -f run.f +UVM_TESTNAME=regression_test
```

---

## 🛠️ Technologies

| Technology      | Purpose                  |
| --------------- | ------------------------ |
| Verilog         | RTL Design               |
| SystemVerilog   | Advanced Hardware Design |
| UVM             | Functional Verification  |
| Cadence Xcelium | Simulation               |

---

## 🚀 Future Improvements

* Adaptive fuzzy membership functions
* Dynamic rule optimization
* Machine-learning-assisted prediction
* Higher functional coverage
* More constrained-random scenarios

---

## 👩‍💻 Author

**Aqdar Ahmad Abu Sufyan**

Computer Systems Engineering

Arab American University (AAUP)
