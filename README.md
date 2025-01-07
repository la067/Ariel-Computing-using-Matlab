# Ariel-Computing-using-Matlab

# Drone Simulation Mobility Models

This repository contains two projects related to simulating drone mobility models. The first project focuses on simulating drone movement in 3D space, and the second project implements two mobility models: Random Waypoint (RWP) and Privacy-Preserving Random (PPR).

## Projects Overview

### 1. A Mobility Model for Drone Simulation

This project implements a mobility model for drone path simulation using MATLAB. The simulation generates a 3D plot of a drone's path in space, calculates the total distance traveled, and visualizes the movement step by step. The program provides insights into drone dynamics and path planning in 3D space.

Key Features:
- 3D path simulation of a drone's movement.
- Distance calculation based on the drone's velocity.
- Step-by-step visualization of the drone's movement.
- Interactive 3D plot to observe the path.

### 2. RWP and PPR Mobility Models

This project simulates two mobility models for drone movement: Random Waypoint (RWP) and Privacy-Preserving Random (PPR).

- **Random Waypoint (RWP)**: A drone randomly selects a destination within a defined network, flies to it, pauses for a specified duration, and then chooses a new destination.
- **Privacy-Preserving Random (PPR)**: Similar to RWP, but the drone takes a path that includes dummy points within a rectangle defined by the current and target locations to obscure its actual movement.

Key Features:
- Simulation of drone movement using RWP and PPR models.
- Randomly generated destinations within a 1,000 x 1,000 meter network.
- Visual representation of drone movement using markers for start and current positions.
- Real-time plotting of the drone's path and position.


