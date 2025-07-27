# TRAFFIC LIGHT CONTROLER

## **- Project Title** 
Design and simulate a traffic light controller to manage vehicles at a intersections using Verilog. 

## **- Description** 
This project implements a traffic light controller using Verilog HDL. The system is designed to manage the flow of vehicles at a four-way intersection (crossroads), allowing safe and efficient traffic movement by alternating signals between the North-South (NS) and East-West (EW) directions.

## **- How to use** 
Tools required
* ISE Xilinx Design Suite: https://www.xilinx.com/support/download.html
* Virtual box: https://www.virtualbox.org/

## **- License** 
This project is open for learning and academic reference. Please check the LICENSE file (if available) for usage rights and restrictions.

## **- Detail**
The controller operates as a finite state machine (FSM) with four states:

NS Green – North-South light is green, East-West is red.

NS Yellow – North-South light is yellow, East-West remains red.

EW Green – East-West light is green, North-South is red.

EW Yellow – East-West light is yellow, North-South remains red.

Each green light lasts for 50 clock cycles, and each yellow light lasts for 10 clock cycles. After each cycle, the FSM transitions to the next state in the sequence.

<img width="625" height="430" alt="image" src="https://github.com/user-attachments/assets/6d6322d8-a264-407a-abf1-450439391783" />

## Timing Logic
A 16-bit counter is used to determine how long each state remains active. The counter resets whenever the state changes and increments otherwise.

##  I/O Block Diagram – Traffic Light Controller

<p align="center">
<img width="838" height="703" alt="image" src="https://github.com/user-attachments/assets/e00d1013-42e1-414b-931c-bed47de5134b" />


</p>

_The block diagram is for reference only. Some details in the design have been edited in the code, which may differ from the diagram._

## I/O Ports Description

Inputs:  
- `clk`: System clock (drives timing counter)  
- `reset`: Synchronous reset (resets state to NS_green)

Outputs:  
- `NS_light[2:0]`: North-South traffic light output (Red-Yellow-Green)  
- `EW_light[2:0]`: East-West traffic light output (Red-Yellow-Green)

Light encoding:
- `3'b100`: Red  
- `3'b010`: Yellow  
- `3'b001`: Green
## Simulation Result

The waveform below demonstrates the functional behavior of the traffic light controller:

<img width="1145" height="162" alt="image" src="https://github.com/user-attachments/assets/077b5a0a-dae4-4ca0-a1f0-cfa285c32c4c" />



###  Observations:
- At 0 ns, the system is in reset. NS_light = 001 (Green), EW_light = 100 (Red).
- Next NS_light is keeping at 001 (Green), EW_light = 100 (Red)
- At around 600 ns, NS_light becomes 010 (Yellow) — EW_green state begins.
- At around 70 ns, NS_light becomes 100 (Red) -- EW_light becomes 001 (green)
 This simulation confirms that the FIFO works correctly for sequential write and read operations.



