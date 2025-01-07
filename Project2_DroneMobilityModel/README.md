# Drone Mobility Models: RWP and PPR Simulation

This project simulates two simple mobility models for drones:

1. **Random Waypoint (RWP)**
2. **Privacy-Preserving Random (PPR)**

## Mobility Models

### Random Waypoint (RWP)
- In the **RWP** model, a drone randomly selects a destination within a 1000x1000 meter 2D network. The drone flies toward the destination and pauses for a specific time upon arrival. After pausing, the drone selects another random destination and repeats the process.
- **Parameters:**
  - **Mobility model**: RWP (0)
  - **Velocity**: 1 to 5 m/s
  - **Pausing time**: 0 to 10 seconds
  - **Number of dummy locations**: Not applicable

### Privacy-Preserving Random (PPR)
- In the **PPR** model, a drone selects a random destination, but instead of flying directly to the destination, it creates a virtual rectangle with a diagonal from the current position to the destination. The drone generates multiple dummy locations (k) within the rectangle and moves toward the destination through these dummy locations.
- **Parameters:**
  - **Mobility model**: PPR (1)
  - **Velocity**: 1 to 5 m/s
  - **Pausing time**: 0 to 10 seconds
  - **Number of dummy locations**: 2 or 3

## Example Commands
- To simulate **RWP** with a velocity of 2 m/s, 5 seconds of pausing time, and no dummy locations:
  ```matlab
  >> mobility(0, 2, 5, 0)  % RWP, 2 m/s, 5 secs pausing time, zero dummy location

## Visualization
For RWP:

The drone’s path is visualized as a solid line.
The drone’s starting position is marked with *.
The drone’s subsequent positions are marked with o at every second interval.
For PPR:

The drone’s path is visualized as a solid line, with its starting position marked by *.
Dummy locations are visualized as additional waypoints, and the drone moves from one dummy location to the next in the rectangle before heading to the destination.
Performance Metrics
Total flying distance: The distance covered by the drone from the origin (0, 0) to the destination.
Total flying time: The time taken by the drone to travel from the origin to the destination.
Running the Simulation:
To run the mobility simulation in MATLAB, use the following command structure:

```matlab
>> mobility(mobility_model, velocity, pausing_time, num_dummy_locations)

Where:
mobility_model: 0 for RWP, 1 for PPR
velocity: Drone's speed in m/s (1-5 m/s)
pausing_time: Time the drone stays at each destination (0-10 seconds)
num_dummy_locations: The number of dummy locations (2 or 3) for PPR only.
