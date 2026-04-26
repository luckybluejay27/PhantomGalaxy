[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

# Speed Charts

## Global Modeling Assumptions

These are structural assumptions, not variables. They exist to keep each layer focused only on the math it directly determines.

1. Standard bricks: Bricks have fixed dimensions (T × A × R_thickness) and do not shrink.
    
2. Rigid tiling per ring: Bricks on a single ring do not overlap circumferentially; they tile the circumference edge-to-edge.
    
3. Axisymmetric corridor: The effective corridor boundary at a ring stage is treated as axisymmetric.
    
4. Radial actuation ("shovel" model): Bricks translate radially inward during a compression stroke, moving the corridor boundary from Rmax → Rmin.
    
5. Sequential stages: Rings act as time-multiplexed stages on the same corridor payload. Adjacent rings may overlap in time, but not in space.
    
6. No simultaneous adjacent collapse: A downstream ring begins compression only after the upstream ring has completed re-extension (handoff complete).
    
7. Linear compression: Corridor length scales linearly with radius; compression ratio is TCR = Rmin / Rmax.
    
8. Ideal coupling (Layers 1–2): No leakage, shear, angular interference, or loss terms are modeled until Layer 3.
    

## Layer -1 — Patent Basis

Based on the works of _Von Reyner Del Lupis_ and the patented framework on Casimir Propagation Technologies.

Terran engineering treats the Del Lupis framework as the resolved bridge between local Casimir boundary manipulation and ship-scale metric compression: properly phased Casimir surfaces can be locked into a propagating internal compression corridor rather than remaining mere plate-to-plate forces.

This sheet assumes that coupling is valid and tracks its mechanical consequences. The unresolved leap is the coupling itself: ordinary Casimir plates do not, by themselves, imply useful spacetime dragging or macroscopic traversal shortening.

## Layer 0 — RTD Reference Mechanics: Coil-Based Casimir-Repulsion Drive

Layer 0 defines the local actuation mechanism. It separates internal CNT sheet-pair motion from macroscopic brick stroke so the ship-scale compression math does not confuse actuator bookkeeping with corridor compression.

### Propulsion system

|Field|Value|Notes|
|---|---|---|
|Drive type|Coil-based Casimir-Repulsion Drive|ISCD reference actuation mechanism|
|Active component|1 cm² CNT sheet-pairs|Casimir-repulsion surfaces|
|Sheet types|Doped superconducting + undoped CNT sheets|Paired active surfaces|
|Brick architecture|9.72k pair brick|9,720 CNT sheet-pairs per brick|
|Ring tile count|360 bricks/ring|Bricks tile the ring circumference|
|Baseline pulse rate|1 kHz|Current fastest rate; note that macro stroke frequency is only 1 Hz; cooling minimums are based on macro stroke, not internal 1 kHz pulses|

_Note: the 1 Hz stroke is the actual brick-level cycling; internal 1 kHz CNT pulses occur within each brick without requiring macro cooling._

### CNT pair and brick actuation

|   |   |   |
|---|---|---|
|Metric|Value|Notes|
|Sheet-pair gap cycle|500 nm ↔ 1000 nm|Sheets move together/apart across the pulse cycle|
|Per-pair gap displacement|500 nm/pulse|Local CNT sheet-pair actuation distance|
|Pair count per brick|9,720|Current rib-aware active-cell count|
|Aggregate internal pair displacement|4.86 mm/pulse|500 nm × 9,720; bookkeeping value, not brick travel|
|Full stroke envelope|1.68 m|Maximum radial span from shortest/fully-inward position to fully-extended position|
|Brick unit height / radial thickness|0.1 m|Physical radial thickness of the brick body|
|Minimum clearance / inter-brick spacing|0.05 m|5 cm required spacing, converted to meters|
|Net brick physical stroke|1.53 m|1.68 m − 0.1 m − 0.05 m; usable macroscopic radial travel of each brick during inward stroke|

### Ring-stage actuation

|   |   |   |
|---|---|---|
|Metric|Value|Notes|
|Bricks per ring|360|Full ring tile count|
|Active cells per brick|9,720|Current rib-aware brick lading count|
|Active cells per ring|3,499,200|9,720 cells/brick × 360 bricks/ring|
|Full stroke envelope|1.68 m|Maximum radial span before subtracting brick unit height|
|Brick unit height|0.1 m|Physical radial thickness of the brick body|
|Minimum clearance|0.05 m|5 cm required spacing, converted to meters|
|Net ring radial stroke|1.53 m|Same usable macroscopic inward stroke applied by each brick|
|Corridor boundary motion|Rmax → Rmin|Defined by brick physical stroke|
|Stage compression ratio|TCR_stage = Rmin / Rmax|Derived from ship/ring geometry, not directly from internal actuation bookkeeping|
|Full-ring cell pulse energy|3,499.2 J/pulse|3,499,200 cells/ring × 0.001 J/cell pulse|

### Energy metrics

|   |   |   |
|---|---|---|
|Metric|Value|Notes|
|Cell pulse energy / heat load|0.001 J/cell pulse|Current per-cell heat/work bookkeeping assumption|
|Pulse energy per 9.72k pair brick|9.72 J/brick pulse|9,720 cells × 0.001 J/cell pulse|
|Full-ring pulse energy|3,499.2 J/ring pulse|360 bricks × 9.72 J/brick pulse|
|Ring power intake at 1 kHz|~3.50 MW/ring|3,499.2 J/pulse × 1,000 pulses/sec, before overhead margin|
|Heat dissipation required at 1 kHz|~3.50 MW/ring|Steady-state thermal rejection load before overhead margin|
|Nimbus active-cell pulse energy, all rings|~699.84 kJ/pulse|200 rings × 3,499.2 J/ring pulse|
|Nimbus active-cell power at 1 kHz, all rings|~699.84 MW|Assumes all 200 rings pulse at 1 kHz simultaneously; actual active-ring schedule may be lower|

_Macro-stroke cycling note:_ The effective 1 Hz brick-level stroke is the rate that determines macro cooling requirements; internal 1 kHz CNT pulses do not require additional corridor-level thermal dissipation.

### Compression physics

|   |   |   |
|---|---|---|
|Metric|Value|Notes|
|Internal actuation ratio|1:600|CNT pair/brick internal actuation ratio|
|Internal crunch fraction|~0.16%|Internal actuator effect; do not use as ship-scale TCR_stage by itself|
|Ship-scale compression driver|Net brick physical stroke|1.53 m radial boundary motion determines Rmin/Rmax after subtracting brick unit height and required clearance|
|Spatial displacement per drive length|Pending|Pending recalculation under corrected brick-stroke model|

### Thermal and material specs

|   |   |   |
|---|---|---|
|Metric|Value|Notes|
|CNT specific heat capacity|0.83 J/g·K|Standard CNT baseline|
|CNT thermal limit in vacuum|~3,400 K|Operational limit restricted by dopants|
|Required heat rejection per active ring|~3.50 MW|At 1 kHz steady-state operation with current 9,720-cell brick count|

## Layer 1 — Ship-Class RTD Mechanics

Layer 0 defines the RTD unit hardware, pulse energetics, CNT material limits, compression ratio, and baseline 1 kHz ring behavior. Layer 1 only applies those reference mechanics to ship-class coil geometry.

### Layer 1 variables

- N — total ring count along the active coil.
    
- ΔZ — axial ring spacing. Current reference: ΔZ = (1.4 × brick axial length) + 0.05 m gap.
    
- Rmax — corridor radius before a ring compresses.
    
- Brick Stroke — usable macroscopic radial inward travel after subtracting brick unit height and minimum clearance. Current reference: 1.53 m from 1.68 m full stroke envelope − 0.1 m brick unit height − 0.05 m clearance.
    
- Rmin — corridor radius after inward stroke: Rmin = Rmax − Brick Stroke.
    
- TCR_stage — single-ring compression factor: TCR_stage = Rmin / Rmax.
    
- TCR_total — compounded corridor compression after all rings: TCR_total = TCR_stage^N.
    
- Compression Multiplier — apparent distance/speed multiplier from total corridor compression: Compression Multiplier = 1 / TCR_total.
    
- v_orbital — assumed safe fast realspace velocity for idealized comparison. Current reference: 7,800 m/s.
    
- v_effective_orbital — apparent corridor-adjusted velocity at orbital realspace speed: v_effective_orbital = v_orbital / TCR_total.
    

_Macro-stroke frequency note:_ The effective brick-level stroke is **1 Hz**; this determines minimum corridor cooling requirements. Internal 1 kHz CNT pulses occur inside the bricks and do not impose additional macro cooling requirements.

### Ship-class effective-speed mechanics

**Notes:** Effective speed assumes **v_orbital = 7,800 m/s** and that macro brick-level stroke occurs at 1 Hz.*

|         |                 |                |             |          |                  |          |           |           |                        |                                           |       |
| ------- | --------------- | -------------- | ----------- | -------- | ---------------- | -------- | --------- | --------- | ---------------------- | ----------------------------------------- | ----- |
| Ship    | Coil Length (m) | Ring Count (N) | ΔZ (m/ring) | Rmax (m) | Brick Stroke (m) | Rmin (m) | TCR_stage | TCR_total | Compression Multiplier | Effective Speed at Orbital Velocity (m/s) | Notes |
| Nimbus  | 38              | 200            | 0.19        | 20.05    | 1.53             | 18.52    | 0.92369   | 1.27e-7   | 7.85e6×                | 6.12e10                                   | *     |
| Zephyr  | 57              | 300            | 0.19        | 20.05    | 1.30             | 18.75    | 0.93516   | 1.85e-9   | 5.42e8×                | 4.23e12                                   | *     |
| Stratus | 76              | 400            | 0.19        | 20.05    | 1.01             | 19.04    | 0.94963   | 1.05e-9   | 9.53e8×                | 7.43e12                                   | *     |
| Atlas   | 114             | 600            | 0.19        | 20.05    | 0.80             | 19.25    | 0.96010   | 2.45e-11  | 4.08e10×               | 3.18e14                                   | *     |
## Layer 2 — Coil Mechanical Energy

Layer 2 tracks the mechanical energy required to move the macroscopic coil hardware defined in Layer 1. This is separate from the CNT sheet-pair actuation bookkeeping in Layer 0. Results are intentionally left blank until piston/brick mass, acceleration profile, and recovery efficiency are defined.

### Material and Geometry Knowns

|Component|Known / Canon Value|Notes|
|---|---|---|
|Brick dimensions|0.1 m × 0.1 m × 0.3 m|Radial thickness × axial length × tangential width|
|Brick volume|0.003 m³|Geometric volume before internal cavities/layering|
|Completed Casimir Brick cassette mass|~2.407 kg/brick|From current Ship Materials Average Lading; excludes piston hardware and ringframe plumbing|
|Piston / pushrod geometry|65 mm OD × 55 mm ID × 2 m length|Hollow beta-titanium actuator tube|
|Piston / pushrod mass|~8.76 kg/unit|Per station; before moving magnetic assembly/load shoe additions|
|Sacrificial guidance / glide pipe geometry|72 mm OD × 66 mm ID × 2 m length|Replaceable polished-alumina guide sleeve|
|Sacrificial guidance / glide pipe mass|~5.14 kg/unit|Per station; fixed/replacement wear stock, not necessarily moving mass|
|Ring tile count|360 bricks/ring|Standard full ring count|
|Nimbus ring count|200 rings|Current Layer 1 Nimbus active coil count|
|Piston / actuator baseline material|Beta titanium alloy, Ti-5553 class|Primary pushrod / actuator material|
|Optional high-temperature actuator material|Inconel 718-class nickel superalloy|Higher thermal margin, higher mass penalty|
|Interface coatings|DLC, graphitic carbon, h-BN / MoS₂ / WS₂|Wear reduction and alignment control|

_Layer 2 moving mass is not the full fixed station lading. Use **m_brick_moving** for the brick plus load shoe, moving armature, moving linkage, and any carried guidance hardware. Fixed guide sleeves, fixed stators, ringframe supports, and external plumbing should be tracked separately._

### Piston / Brick Translation Variables

- **m_brick_moving** — moving mass per station, including the brick cassette, piston head/load shoe, moving magnetic assembly, linkages, and any carried guidance hardware.
- **m_station_fixed** — fixed per-station actuation mass, including glide pipe, stator coils, fixed mounts, and ringframe-side hardware.
- **m_ring_moving** — total moving mass per ring: **m_ring_moving = m_brick_moving × 360**.
- **m_ring_fixed** — total fixed station mass per ring: **m_ring_fixed = m_station_fixed × 360**, before shared ringframe structure.
- **Stroke** — usable macroscopic radial travel from Layer 1.
- **F_stroke** — full macroscopic stroke frequency. This may differ from CNT pulse frequency if CNT modulation and piston travel are decoupled.
- **t_stroke** — time available for one inward stroke.
- **a_peak** — peak acceleration required by the chosen stroke profile.
- **E_piston_brick** — energy required to drive one station through one stroke.
- **E_piston_ring** — energy required to drive all 360 stations in one ring through one stroke.
- **η_recovery** — fraction of kinetic/field energy recovered during deceleration or re-extension.
- **P_piston_ring** — mechanical power required per active ring.
- **P_piston_ship** — mechanical power required for the ship’s active ring schedule.

### Piston / Brick Mechanical Energy Table

|Ship|Ring Count (N)|Bricks/Ring|Stroke (m)|m_brick_moving (kg)|m_ring_moving (kg)|F_stroke (Hz)|t_stroke (s)|a_peak (m/s²)|E_piston_brick (J/stroke)|E_piston_ring (J/stroke)|η_recovery|P_piston_ring (W)|Active Rings|P_piston_ship (W)|Notes|
|---|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|---|
|Nimbus|200|360|1.53|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending||
|Zephyr|300|360|1.30|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending||
|Stratus|400|360|1.01|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending||
|Atlas|600|360|0.80|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending|Pending||

### Calculation placeholders

| Quantity                      | Formula                                                                    | Status                             |
| ----------------------------- | -------------------------------------------------------------------------- | ---------------------------------- |
| Ring moving mass              | **m_ring_moving = m_brick_moving × 360**                                   | Pending m_brick_moving             |
| Ring fixed station mass       | **m_ring_fixed = m_station_fixed × 360**                                   | Pending m_station_fixed            |
| Stroke time                   | **t_stroke = 1 / F_stroke**                                                | Pending F_stroke                   |
| Peak acceleration             | Profile-dependent                                                          | Pending stroke profile             |
| Brick stroke energy           | **E_piston_brick = f(m_brick_moving, Stroke, t_stroke, a_peak, recovery)** | Pending piston model               |
| Ring stroke energy            | **E_piston_ring = E_piston_brick × 360**                                   | Pending E_piston_brick             |
| Ring piston power             | **P_piston_ring = E_piston_ring × F_stroke**                               | Pending E_piston_ring and F_stroke |
| Ship piston power             | **P_piston_ship = P_piston_ring × Active Rings**                           | Pending active ring schedule       |
| Full ship moving station mass | **m_ship_moving = m_brick_moving × 360 × N**                               | Pending m_brick_moving             |
| Full ship fixed station mass  | **m_ship_fixed = m_station_fixed × 360 × N**                               | Pending m_station_fixed            |