Per Order Terran Guild Registry and Vocational Trust:
You’re holding this guide because someone, somewhere, believes you could be useful in ship engineering.
Not as a hero. Not as a genius. As a competent pair of hands and a steady mind—someone who can look at a system, understand what it’s trying to do, and keep it doing that while the universe does its best to disagree.
This pamphlet won’t certify you as an engineer, and it won’t teach you every subsystem worth knowing. It will give you the orientation layer: what the major assemblies are, how they fail, how they’re monitored, and where “good enough” stops being good.
The work is precise. The hours are strange. The margin for sloppy is… not.

## The Eight Work Domains
*These are the major genres of ship engineering. If you learn the boundaries between them, you’ll stop breaking things that are working.*

1) Coil Management
What it is: The ringframe, the coil stages, and the choreography that keeps corridor compression stable.
What you touch: ring timing, actuator health, brick alignment, calibration routines, drift tracking.
How it fails: thermal creep, phase slip, synchronization loss, and the subtle kind of error that only becomes loud later.

2) Power and Thermal
What it is: Where energy comes from, where it goes, and where the heat is allowed to die.
What you touch: generation, storage, bus segmentation, load shedding, heat loops, radiators.
How it fais: hot spots, runaway demand, cascading trips, and the classic mistake: “we had power” ≠ “we could afford to use it.”

3) Structures and Mechanisms
What it is: Everything that holds shape while everything else moves.
What you touch: ringframe integrity, mounts, bearings, vibration isolation, rotating hab hardware.
How it fails: fatigue, resonance, microfractures, and misalignment that looks harmless until it isn’t.

4) Recycling and Environment (ECLSS)
What it is: Air, water, pressure, temperature, hygiene, and waste—kept boring on purpose.
What you touch: filters, scrubbers, pumps, humidity control, reclaim loops, contamination protocols.
How it fails: slow poisoning, pressure leaks, biofouling, and “it smells weird” (a legitimate alarm condition).

5) Plumbing and Electrical Distribution
What it is: The ship’s arteries and nerves. Pipes, cables, manifolds, connectors.
What you touch: routing, isolation, leak/fault detection, grounding, EMI shielding, harness maintenance.
How it fails: hidden shorts, pinhole leaks, connector creep, and the special hell of intermittent faults.

6) Transit and Handling
What it is: Moving people, tools, and mass through the ship without turning the ship into a hazard.
What you touch: internal rails/lifts, cargo handling, docking interfaces, cranes, tool-courier paths.
How it fails: jammed paths, uncontrolled loads, misalignment at interfaces, and “the corridor is blocked” becoming a life-support problem.
Hab Transport and Gravity Interfaces
Some ships keep habitat modules in rotating cubes riding an oversized cam-track system.
Purpose: stable gravity and orientation for crew while the coil structure stays phase-stable
Engineering work: cam-track wear, alignment, locks/detents, emergency stops, docking sleeves, access planning
Cross-link: structural loads and vibration belong to Structures and Mechanisms.

7) Robotics and Automation
What it is: Remote hands, inspection eyes, and the routines that do the boring work consistently.
What you touch: inspection drones, maintenance bots, manipulator arms, calibration rigs, safety interlocks.
How it fails: sensor drift, edge-case logic, “it worked last time,” and automation that assumes the world is tidy.

8) Diagnostics and Communications (Isolation)
What it is: Knowing what’s true without letting comms touch flight-critical systems.
What you touch: sensors, diagnostic buses, firmware, logging, test rigs, partition boundaries.
How it fails: bad data, clock drift, bus contention, and systems that talk when they should shut up.
