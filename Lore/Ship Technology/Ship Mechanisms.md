[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

# Ship Engineering — Mechanisms Spec

## Scope
This document is **mechanics-first**: each section gives the one-minute broad-strokes of how the ship’s major assemblies work, what they interface with, and what typically limits them. Crew roles, procedures, and operational culture belong in **Ship Tech**.

## 1) ISCD Coil Hull (Containment Lattice)
The coil hull is the ship: a ringframe containment lattice that defines a bounded internal corridor where traversal distance is shortened. Rings hand off a compression phase-front down the coil by cycling between **Rmax → Rmin** and back, while the corridor interior itself stays empty during operation. The brick–piston–ringframe partition matters: bricks are precision boundary units, pistons carry fatigue loads, and the ringframe closes the force loop and holds alignment.

## 2) Realspace Propulsion (Injection Drive + Trim Thrusters)
Realspace propulsion is split into a high-energy injection drive for major Δv and small trim thrusters for docking and fine attitude work. Canon architecture here is **fuel = propellant**: dense fissile feedstock is metered into a reaction channel that briefly goes supercritical, flash-heating into plasma (“explosion”), then an electromagnetic stage collimates and post-accelerates that plume into a directed jet (“throw”). Cruise and sprint are not different engines; they are different operating points (reactivity, mass flow, and EM field intensity) bounded by heat and liner wear.

## 3) Power Generation & Conditioning
Power is not just “generation,” it is delivery: segmented buses, isolation domains, and pulse-cap banks that can feed both distributed coil drivers and the injection drive’s burst loads without letting transients cascade across the ship. Conditioning exists to keep phase timing stable, prevent brownouts at the wrong moment, and ensure failure stays local instead of propagating through shared rails.

## 4) Thermal Architecture (Hot Loops, Sinks, Radiators)
Thermal is the rate limiter for almost everything ambitious. High-temperature hot loops pull heat from the injection channel, EM stages, and coil electronics; phase-change sinks buffer short sprint windows; radiators reject that stored heat over longer time constants. The goal is not “make things cold,” it is to keep sharp gradients away from alignment-critical structures and to prevent thermal creep from becoming phase slip.

## 5) Structure & Alignment (Spine, Ring Bays, Vibration Control)
Structure is designed around stiffness, buckling avoidance, and keeping a kilometer-scale instrument aligned while it cycles. Spines/longerons carry global bending; ring bays react local piston loads; mounts are kinematic (constrain only the needed degrees of freedom) to avoid overconstraint and thermal warp. Continuous metrology (baselines, gauges, thermal compensation) turns “straight enough” into an actively maintained state, not a one-time build quality.

## 6) Habitat Gravity (Rotation System)
Crew gravity is provided by rotation, deliberately decoupled from coil operation so warp timing doesn’t dictate biology. Rotating habitats interface to the non-rotating structure through bearing stacks and transfer vestibules; the engineering problem is managing vibration, wear, and safe handoff corridors between frames without injecting torque or resonance back into the coil lattice.

## 7) Internal Transport (Rails, Cam Tracks, Cargo Handling)
Internal transport is the ship’s logistics skeleton: rails, cranes, lifts, and (where used) cam-track modules that move mass without blocking service access to the coil. The design constraint is routing: cargo paths, maintenance corridors, and rotating-hab interfaces must not intersect in ways that turn a jam into a life-support or propulsion failure.

## 8) Diagnostics & Isolation (Sensing, Logging, Hard Partitions)
Diagnostics exist to tell you what’s true without letting external networks touch flight-critical control. Sensors, timing references, and logging are segmented by fault domain; advisory systems can recommend and predict, but critical actuation remains locally controllable and physically partitioned from comms. The mechanical intent is survivable failure: when data lies or links die, the ship remains understandable and recoverable.
