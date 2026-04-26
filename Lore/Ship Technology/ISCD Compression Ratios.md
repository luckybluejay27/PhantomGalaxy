[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

# Speed Charts

## Global Modeling Assumptions

These are structural assumptions, not variables. They exist to keep each layer focused only on the math it directly determines.

1. Standard bricks: Bricks have fixed dimensions (T × A × R_thickness) and do not shrink.
    
2. Rigid tiling per ring: Bricks on a single ring do not overlap circumferentially; they tile the circumference edge-to-edge.
    
3. Axisymmetric corridor: The effective corridor boundary at a ring stage is treated as axisymmetric.
    
4. Radial actuation ("shovel" model): Bricks translate radially inward during a compression stroke, moving the corridor boundary from Rmax to Rmin.
    
5. Sequential stages: Rings act as time-multiplexed stages on the same corridor payload. Adjacent rings may overlap in time, but not in space.
    
6. No simultaneous adjacent collapse: A downstream ring begins compression only after the upstream ring has completed re-extension, meaning handoff is complete.
    
7. Linear compression: Corridor length scales linearly with radius; compression ratio is TCR = Rmin / Rmax.
    
8. Ideal coupling for Layers 1-2: No leakage, shear, angular interference, or loss terms are modeled until Layer 3.
    

## Layer -1 — Patent Basis

Based on the works of _Von Reyner Del Lupis_ and the patented framework on Casimir Propagation Technologies.

Terran engineering treats the Del Lupis framework as the resolved bridge between local Casimir boundary manipulation and ship-scale metric compression: properly phased Casimir surfaces can be locked into a propagating internal compression corridor rather than remaining mere plate-to-plate forces.

This sheet assumes that coupling is valid and tracks its mechanical consequences. The unresolved leap is the coupling itself: ordinary Casimir plates do not, by themselves, imply useful spacetime dragging or macroscopic traversal shortening.

## Layer 0 — RTD Reference Mechanics: Coil-Based Casimir-Repulsion Drive

Layer 0 defines the local actuation mechanism. It separates internal CNT sheet-pair motion from macroscopic brick stroke so the ship-scale compression math does not confuse actuator bookkeeping with corridor compression.

### Propulsion System

|Field|Value|Notes|
|---|---|---|
|Drive type|Coil-based Casimir-Repulsion Drive|ISCD reference actuation mechanism|
|Active component|1 cm² CNT sheet-pairs|Casimir-repulsion surfaces|
|Sheet types|Doped superconducting + undoped CNT sheets|Paired active surfaces|
|Brick architecture|9.72k pair brick|9,720 CNT sheet-pairs per brick|
|Ring tile count|360 bricks/ring|Bricks tile the ring circumference|
|Baseline pulse rate|1 kHz|Internal active-cell pulse rate; separate from the 1 s ring compression cycle|

_Note: the 1 Hz ring cycle is the macroscopic compress-reset cadence. Internal 1 kHz CNT pulses occur within each brick and do not define coil propagation timing._

### CNT Pair and Brick Actuation

|Metric|Value|Notes|
|---|---|---|
|Sheet-pair gap cycle|500 nm to 1000 nm|Sheets move together/apart across the pulse cycle|
|Per-pair gap displacement|500 nm/pulse|Local CNT sheet-pair actuation distance|
|Pair count per brick|9,720|Current rib-aware active-cell count|
|Aggregate internal pair displacement|4.86 mm/pulse|500 nm × 9,720; bookkeeping value, not brick travel|
|Full stroke envelope|1.68 m|Maximum radial span from shortest/fully-inward position to fully-extended position|
|Brick unit height / radial thickness|0.1 m|Physical radial thickness of the brick body|
|Minimum clearance / inter-brick spacing|0.05 m|5 cm required spacing, converted to meters|
|Net brick physical stroke|1.53 m|1.68 m - 0.1 m - 0.05 m; usable macroscopic radial travel of each brick during inward stroke|

### Ring-Stage Actuation

|Metric|Value|Notes|
|---|---|---|
|Bricks per ring|360|Full ring tile count|
|Active cells per brick|9,720|Current rib-aware brick lading count|
|Active cells per ring|3,499,200|9,720 cells/brick × 360 bricks/ring|
|Full stroke envelope|1.68 m|Maximum radial span before subtracting brick unit height|
|Brick unit height|0.1 m|Physical radial thickness of the brick body|
|Minimum clearance|0.05 m|5 cm required spacing, converted to meters|
|Net ring radial stroke|1.53 m|Same usable macroscopic inward stroke applied by each brick|
|Corridor boundary motion|Rmax to Rmin|Defined by brick physical stroke|
|Stage compression ratio|TCR_stage = Rmin / Rmax|Derived from ship/ring geometry, not directly from internal actuation bookkeeping|
|Full-ring cell pulse energy|3,499.2 J/pulse|3,499,200 cells/ring × 0.001 J/cell pulse|

### Energy Metrics

|Metric|Value|Notes|
|---|---|---|
|Cell pulse energy / heat load|0.001 J/cell pulse|Current per-cell heat/work bookkeeping assumption|
|Pulse energy per 9.72k pair brick|9.72 J/brick pulse|9,720 cells × 0.001 J/cell pulse|
|Full-ring pulse energy|3,499.2 J/ring pulse|360 bricks × 9.72 J/brick pulse|
|Ring power intake at 1 kHz|~3.50 MW/ring|3,499.2 J/pulse × 1,000 pulses/sec, before overhead margin|
|Heat dissipation required at 1 kHz|~3.50 MW/ring|Steady-state thermal rejection load before overhead margin|
|Nimbus active-cell pulse energy, all rings|~699.84 kJ/pulse|200 rings × 3,499.2 J/ring pulse|
|Nimbus active-cell power at 1 kHz, all rings|~699.84 MW|Assumes all 200 rings pulse at 1 kHz simultaneously; actual ring schedule may be lower|

_Macro-stroke cycling note: The effective 1 Hz ring cycle determines the sequential coil propagation cadence. Internal 1 kHz CNT pulses do not require additional corridor-level mechanical cycling._

### Compression Physics

|Metric|Value|Notes|
|---|---|---|
|Internal actuation ratio|1:600|CNT pair/brick internal actuation ratio|
|Internal crunch fraction|~0.16%|Internal actuator effect; do not use as ship-scale TCR_stage by itself|
|Ship-scale compression driver|Net brick physical stroke|1.53 m radial boundary motion determines Rmin/Rmax after subtracting brick unit height and required clearance|
|Spatial displacement per drive length|Pending|Pending recalculation under corrected brick-stroke model|

### Thermal and Material Specs

|Metric|Value|Notes|
|---|---|---|
|CNT specific heat capacity|0.83 J/g·K|Standard CNT baseline|
|CNT thermal limit in vacuum|~3,400 K|Operational limit restricted by dopants|
|Required heat rejection per active ring|~3.50 MW|At 1 kHz steady-state operation with current 9,720-cell brick count|

## Layer 1 — Ship-Class RTD Mechanics

Layer 0 defines the RTD unit hardware, pulse energetics, CNT material limits, compression ratio, and baseline 1 kHz ring behavior. Layer 1 only applies those reference mechanics to ship-class coil geometry.

### Layer 1 Variables

|Variable|Meaning|
|---|---|
|N|Total ring count along the active coil|
|ΔZ|Axial ring spacing. Current reference: ΔZ = (1.4 × brick axial length) + 0.05 m gap|
|Rmax|Corridor radius before a ring compresses|
|Brick Stroke|Usable macroscopic radial inward travel after subtracting brick unit height and minimum clearance. Current reference: 1.53 m from 1.68 m full stroke envelope - 0.1 m brick unit height - 0.05 m clearance|
|Rmin|Corridor radius after inward stroke: Rmin = Rmax - Brick Stroke|
|TCR_stage|Single-ring compression factor: TCR_stage = Rmin / Rmax|
|TCR_total|Compounded corridor compression after all rings: TCR_total = TCR_stage^N|
|Compression Multiplier|Apparent distance/speed multiplier from total corridor compression: Compression Multiplier = 1 / TCR_total|
|v_orbital|Assumed safe fast realspace velocity for idealized comparison. Current reference: 7,800 m/s|
|v_effective_orbital|Apparent corridor-adjusted velocity at orbital realspace speed: v_effective_orbital = v_orbital / TCR_total|

_Macro-stroke frequency note: The effective brick-level stroke is 1 Hz; this determines minimum corridor cooling requirements. Internal 1 kHz CNT pulses occur inside the bricks and do not impose additional macro cooling requirements._

### Compression-Factor Speed Comparison

**Notes:** This is an ideal comparison table, not the phase-front handoff speed model. Effective speed is calculated from orbital reference velocity and total compression factor.

```
Effective speed = v_orbital × Compression Factor
v_orbital = 7,800 m/s
Compression Factor = 1 / TCR_total

```

|Ship|Coil Length (m)|Ring Count (N)|Rmax (m)|Brick Stroke (m)|Rmin (m)|TCR_stage|TCR_total|Compression Factor*|Effective Speed at 7,800 m/s (m/s)|Notes|
|---|---|---|---|---|---|---|---|---|---|---|
|Nimbus|38|200|20.05|1.53|18.52|0.92369|1.27e-7|7.85e6×|6.12e10|Ideal orbital-velocity comparison|
|Zephyr|57|300|20.05|1.30|18.75|0.93516|1.85e-9|5.42e8×|4.23e12|Ideal orbital-velocity comparison|
|Stratus|76|400|20.05|1.01|19.04|0.94963|1.05e-9|9.53e8×|7.43e12|Ideal orbital-velocity comparison|
|Atlas|114|600|20.05|0.80|19.25|0.96010|2.45e-11|4.08e10×|3.18e14|Ideal orbital-velocity comparison|

*Compression Factor is listed at the baseline assumption of one completed ring compression cycle per second. The factor itself is geometric; faster cycling changes traversal throughput, not the per-cycle compression geometry.

## Layer 2 — Coil Energy Requirement and Recoverable Loss Budget

Layer 2 answers two separate questions in order:

1. **How much energy must be supplied to operate one ring stage?**
    
2. **How much of that supplied energy is unrecoverable waste heat or loss?**
    

Do not subtract total losses from the required energy. The active cells and piston system use different accounting rules:

- **Active-cell input** is treated as **100% waste heat**. It has no Layer 2 recovery term.
    
- **Piston input** is treated as gross kinetic actuation energy. A fraction is recovered by regenerative braking; the remainder is unrecoverable piston loss.
    
- **Layer 3 coupling losses** are not included here. Leakage, shear, angular interference, field coupling inefficiency, and phase-slip penalties belong to a later model.
    

### Material and Geometry Knowns

|Component|Known / Canon Value|Notes|
|---|---|---|
|Brick dimensions|0.1 m × 0.1 m × 0.3 m|Radial thickness × axial length × tangential width|
|Brick volume|0.003 m³|Geometric volume before internal cavities/layering|
|Completed Casimir Brick cassette mass|~2.407 kg/brick|From current Ship Materials Average Lading; excludes piston hardware and ringframe plumbing|
|Piston / pushrod geometry|65 mm OD × 55 mm ID × 2 m length|Hollow beta-titanium actuator tube|
|Piston / pushrod mass|~8.76 kg/unit|Per station; before moving magnetic assembly/load shoe additions|
|Sacrificial guidance / glide pipe geometry|72 mm OD × 66 mm ID × 2 m length|Replaceable polished-alumina guide sleeve|
|Sacrificial guidance / glide pipe mass|~5.14 kg/unit|Per station; fixed/replacement wear stock, not moving stroke mass|
|Ring tile count|360 bricks/ring|Standard full ring count|
|m_station_moving|21.207 kg/station|Brick cassette + pushrod + load shoe + RSL moving armature|
|m_ring_moving|7,635 kg/ring|21.207 kg/station × 360 stations|
|t_cycle|1.0 s/ring|One completed ring compress-reset cycle per sequential ring stage|
|t_in|0.5 s|Symmetric baseline: 0.5 s compression + 0.5 s reset|
|eta_recovery|0.65|First-pass regenerative braking analogue for piston recovery|

_Layer 2 moving mass is not the full fixed station lading. Fixed guide sleeves, fixed stators, ringframe supports, and external plumbing are ship-mass terms, not moving stroke-energy terms._

### Energy Accounting Rules

|Energy Bucket|Supplied Energy|Recovery Rule|Unrecoverable / Heat Rule|
|---|---|---|---|
|**Active-cell pulse system**|E_active_ring_cycle = 3,499,200 J/ring-cycle|No Layer 2 recovery term|100% of input becomes waste heat|
|**Piston mechanical actuation**|E_piston_gross = E_ring_peak|E_piston_recovered = E_ring_peak × eta_recovery|E_piston_loss = E_ring_peak × (1 - eta_recovery)|
|**Layer 2 total**|E_total_required = E_active_ring_cycle + E_piston_gross|Only piston recovery is credited|E_total_unrecoverable = E_active_ring_cycle + E_piston_loss|

### Piston / Brick Translation Variables

This table defines variables used by the piston energy budget. It is an audit reference, not the primary result table.

|Field|m_station_moving|m_ring_moving|S_mech|S_compression|t_cycle|t_in|t_duty_coil|a_peak|v_peak|E_ring_peak|eta_recovery|E_ring_loss|
|---|---|---|---|---|---|---|---|---|---|---|---|---|
|Meaning|Moving mass per actuator station|Total moving mass per ring|Mechanical piston travel across the full stroke envelope|Net compression-producing boundary motion used for Rmax to Rmin|Full compress-reset duration for one ring|Time available for one inward compression stroke|Time for one full sequential propagation through all rings|Peak acceleration from triangular stroke profile|Peak piston velocity during one inward stroke|Gross kinetic piston energy per ring before recovery|Fraction of recoverable kinetic energy returned|Unrecovered piston energy per ring stroke|
|Formula / Value|21.207 kg/station|m_station_moving × 360 = 7,635 kg/ring|Ship-specific|Ship-specific|1.0 s/ring|0.5 s|t_cycle × N|4 × S_mech / t_in^2|2 × S_mech / t_in|0.5 × m_ring_moving × v_peak^2|0.65|E_ring_peak × (1 - eta_recovery)|
|Layer 2 role|Moving mass input|Ring-level moving mass|Piston energy input|Compression geometry only|Ring cadence|Acceleration/velocity input|Coil propagation duration|Survivability check|Kinetic energy input|Gross piston input|Recovery credit|Piston waste/loss term|

### Piston Recovery Budget

This table answers: **how much piston energy must be supplied, and how much of it is unrecoverable after regenerative recovery?**

|Ship|Ring Count (N)|S_mech (m)|S_compression (m)|t_cycle (s/ring)|t_in (s)|t_duty_coil (s)|a_peak (m/s²)|v_peak (m/s)|E_piston_gross / E_ring_peak (J/ring-cycle)|eta_recovery|E_piston_recovered (J/ring-cycle)|E_piston_unrecoverable (J/ring-cycle)|Notes|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|Nimbus|200|1.68|1.53|1.0|0.5|200|26.88|6.72|172,381|0.65|112,048|60,333|One full coil duty cycle is 200 s|
|Zephyr|300|1.45|1.30|1.0|0.5|300|23.20|5.80|128,413|0.65|83,468|44,945|One full coil duty cycle is 300 s|
|Stratus|400|1.16|1.01|1.0|0.5|400|18.56|4.64|82,184|0.65|53,420|28,764|One full coil duty cycle is 400 s|
|Atlas|600|0.95|0.80|1.0|0.5|600|15.20|3.80|55,121|0.65|35,829|19,292|One full coil duty cycle is 600 s|

### Total Layer 2 Ring-Cycle Energy Budget

This table answers: **how much total energy is required, and how much of that requirement is lost as heat or unrecoverable waste?**

|Ship|E_active_cell_input (J/ring-cycle)|E_active_cell_heat (J/ring-cycle)|E_piston_gross (J/ring-cycle)|E_piston_recovered (J/ring-cycle)|E_piston_unrecoverable (J/ring-cycle)|E_total_required (J/ring-cycle)|E_total_unrecoverable (J/ring-cycle)|E_coil_duty_required (J)|E_coil_duty_unrecoverable (J)|P_coil_average_unrecoverable (W)|
|---|---|---|---|---|---|---|---|---|---|---|
|Nimbus|3,499,200|3,499,200|172,381|112,048|60,333|3,671,581|3,559,533|734,316,200|711,906,600|3,559,533|
|Zephyr|3,499,200|3,499,200|128,413|83,468|44,945|3,627,613|3,544,145|1,088,283,900|1,063,243,500|3,544,145|
|Stratus|3,499,200|3,499,200|82,184|53,420|28,764|3,581,384|3,527,964|1,432,553,600|1,411,185,600|3,527,964|
|Atlas|3,499,200|3,499,200|55,121|35,829|19,292|3,554,321|3,518,492|2,132,592,600|2,111,095,200|3,518,492|

### Layer 2 Interpretation

- **Required energy** is the gross energy that must be supplied to the active cells plus the piston system.
    
- **Recovered piston energy** is a credit against the piston portion only.
    
- **Unrecoverable energy** is what the ship must reject or absorb as heat/loss after recovery.
    
- **Active-cell input is always heat in this model.** It dominates the loss budget.
    
- **Piston recovery changes the correction term**, not the active-cell heat load.
    
- **Layer 3 remains separate.** Field-coupling losses, corridor leakage, phase slip, and spacetime-shear penalties are not part of this Layer 2 budget.
    

## Layer 3 — Non-Ideal Derating and Fault Behavior

Layer 3 applies proposed derating factors to Layer 1 compression and Layer 2 energy after ideal operation is calculated. It does not replace the ideal compression math or the Layer 2 required-energy budget.

Layer 3 should remain a risk-and-derating chart until enough test data exists to justify stronger equations.

|Failure Mode|Mechanism|Primary Consequence|Proposed Derating / Loss|Confidence|Mitigation|
|---|---|---|--:|---|---|
|Ringframe misalignment|Circumferential drift, ovalization, station phase error, or local actuator-bay deformation|Phase-front skew, local corridor shear, reduced realized compression|1-5% compression derating|Medium|Continuous metrology, active trim, ringframe strain monitoring, hard shutdown thresholds|
|Brick heat soak|Active-cell waste heat plus corridor-boundary heating; misaligned bricks receive extra radiative load proportional to corridor compression density, boundary temperature, exposure distance, and view angle|Gap drift, dielectric instability, cassette warping, local cell degradation|0.5-3% uptime or cell-output derating under normal alignment; higher under sustained misalignment|Medium-Low|Vapor-channel cooling, thermal maps, duty limits, emissive shielding, misalignment abort logic|
|Piston rack misalignment|Side-loading in glide pipe, bushing ovalization, uneven rack travel, or load-shoe angular error|Friction rise, incomplete stroke, guide cracking, actuator heating|1-10% piston unrecoverable-loss increase|Medium|Silicon-nitride bushings, load monitoring, replaceable glide sleeves, stroke symmetry checks|
|Cell short or degradation|Dielectric breakdown, coil short, CNT pair failure, local contamination, or fatigue damage|Local hot spot, dead-cell cluster, phase noise, uneven boundary actuation|Proportional to dead-cell fraction × clustering factor|Medium|Isolation fuses, cell health maps, bypass routing, cassette replacement doctrine|
|Timing jitter|Ring fires early/late, internal pulse timing slips, or handoff controller desynchronizes|Handoff inefficiency, phase-front raggedness, local compression loss|0.5-5% phase efficiency loss|Low-Medium|Hard timing bus, redundant clocks, phase monitors, conservative handoff windows|
|Field coupling inefficiency|Active cells pulse correctly but do not fully couple into stable corridor compression|Reduced realized compression; lower effective compression factor than ideal table|5-30% compression-effect derating|Low|Calibration runs, conservative compression limits, empirical correction curves|
|Thermal drift|Ringframe, piston sockets, or brick carriers expand unevenly during sustained operation|Rmax/Rmin error, piston-axis wander, phase slip, increased local heating|1-5% compression derating plus 1-5% piston-loss increase|Medium-Low|Thermal compensation, hot-loop regulation, staged cooldown, metrology feedback|
|Emergency instability|Adjacent collapse, unrecovered deformation, field coherence failure, or nullshock-like transient|Coil abort, ring isolation, possible structural damage|Not treated as efficiency loss; treated as abort condition|Low|Ring isolation gates, emergency re-extension, staged power dump, fault-domain separation|

### Layer 3 Interpretation

- **Compression derating** reduces the realized Compression Factor from the Layer 1 ideal table.
    
- **Energy derating** increases the Layer 2 unrecoverable heat/loss budget.
    
- **Abort conditions** are not efficiency penalties. They are operational failures requiring shutdown, isolation, or emergency reset.
    
- **Brick heat soak is corridor-sensitive:** higher compression implies a hotter/more energetic boundary environment. A misaligned brick couples to that boundary more strongly as exposure distance shrinks, view angle worsens, or radiative shielding fails.
    
- **Field coupling inefficiency is the broadest unknown.** Until tested, it should stay as a proposed derating range rather than a locked correction factor.