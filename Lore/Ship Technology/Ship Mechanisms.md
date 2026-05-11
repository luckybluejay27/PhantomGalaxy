[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

## Scope

This document is **mechanics-first**: each section gives the one-minute broad-strokes of how the ship’s major assemblies work, what they interface with, and what typically limits them. Crew roles, procedures, and operational culture belong in **Ship Tech**.

---
## 1) [[ISCD Compression Ratios]]

The coil hull is the ship: a ringframe containment lattice that defines a bounded internal corridor where traversal distance is shortened. Rings hand off a compression phase-front down the coil by cycling between **Rmax → Rmin** and back, while the corridor interior itself stays empty during operation. The brick–piston–ringframe partition matters: bricks are precision boundary units, pistons carry fatigue loads, and the ringframe closes the force loop and holds alignment.

---
## 2) Realspace Propulsion

### 2.1 Fission Pulse Drive

The Fission Pulse Drive (FPD) is the ship’s primary realspace propulsion system, leveraging the existing **ISCD coil and magnetic containment infrastructure** to generate extreme thrust via controlled fission reactions. Canistered uranium or thorium plasma is **injected into the coil**, where it is **magnetically compressed to near-critical density** using the ringframe’s field. At the moment of ejection, a **trigger mechanism** (laser, particle beam, or magnetic pinch) induces supercriticality, and the resulting fission energy is **directed aft** as a high-velocity plasma jet.

**Interfaces**:
- **ISCD Coil**: Provides magnetic compression and containment.
- **Neutron Reflectors**: Beryllium/tungsten liners in the coil **scatter escaping neutrons** back into the plasma, increasing fission efficiency.
- **Ejection Mechanism**: Magnetic railgun or piston system **launches canisters** at high velocity before detonation.
- **Shielding**: The ship’s **meters-thick ringframe and hull** act as passive radiation shielding; additional **lead/lithium hydride layers** may line the coil.

**Limitations**:
- **Canister Integrity**: Must withstand **magnetic compression forces** and **fission energy release** without premature detonation.
- **Timing Precision**: Microsecond-level synchronization between **compression, ejection, and criticality trigger** is required to maximize thrust and minimize radiation leakage.
- **Thermal Load**: While fission occurs externally, **residual heat** from the coil and reflector systems must be managed via existing thermal architecture.
- **Fuel Handling**: Uranium/thorium storage and canister loading systems must prevent **accidental criticality** during non-operational states.

---
### 2.2 Trim Thrusters

**Primary**: Miniaturized electromagnetic thrusters using **tungsten dust** (orthogonally mounted coil rings; **high-impulse burns**).  
**Secondary**: Xenon ion thrusters (distributed clusters; **fine adjustments**).  
**Tertiary**: Compressed helium cold gas (emergency-only; **redundant control**).

**Placement**: Orthogonal to main ISCD coil (primary), distributed around torus (secondary/tertiary).

**Time Scales**:

- **Rotation**: <0.1°/second (minutes/hours for major reorientation).
- **Translation**: 0.1–1 second pulses for sideways/vertical movement.
- **Fine Adjustments**: Continuous low-thrust for docking/alignment.

---
## 3) Power Generation & Conditioning

Power is not just “generation,” it is delivery: segmented buses, isolation domains, and pulse-cap banks that can feed both distributed coil drivers and the injection drive’s burst loads without letting transients cascade across the ship. Conditioning exists to keep phase timing stable, prevent brownouts at the wrong moment, and ensure failure stays local instead of propagating through shared rails.

---
## 4) Thermal Architecture (Hot Loops, Sinks, Radiators)

Thermal is the rate limiter for almost everything ambitious. High-temperature hot loops pull heat from the injection channel, EM stages, and coil electronics; phase-change sinks buffer short sprint windows; radiators reject that stored heat over longer time constants. The goal is not “make things cold,” it is to keep sharp gradients away from alignment-critical structures and to prevent thermal creep from becoming phase slip.

---
## 5) Structure & Alignment (Spine, Ring Bays, Vibration Control)

Structure is designed around stiffness, buckling avoidance, and keeping a kilometer-scale instrument aligned while it cycles. Spines/longerons carry global bending; ring bays react local piston loads; mounts are kinematic (constrain only the needed degrees of freedom) to avoid overconstraint and thermal warp. Continuous metrology (baselines, gauges, thermal compensation) turns “straight enough” into an actively maintained state, not a one-time build quality.

---
## 6) Habitat Gravity (Rotation System)

Crew gravity is provided by rotation, deliberately decoupled from coil operation so warp timing doesn’t dictate biology. Rotating habitats interface to the non-rotating structure through bearing stacks and transfer vestibules; the engineering problem is managing vibration, wear, and safe handoff corridors between frames without injecting torque or resonance back into the coil lattice.

---
## 7) Internal Transport (Rails, Cam Tracks, Cargo Handling)

Internal transport is the ship’s logistics skeleton: rails, cranes, lifts, and (where used) cam-track modules that move mass without blocking service access to the coil. The design constraint is routing: cargo paths, maintenance corridors, and rotating-hab interfaces must not intersect in ways that turn a jam into a life-support or propulsion failure.

---
## 8) Diagnostics & Isolation (Sensing, Logging, Hard Partitions)

Diagnostics exist to tell you what’s true without letting external networks touch flig