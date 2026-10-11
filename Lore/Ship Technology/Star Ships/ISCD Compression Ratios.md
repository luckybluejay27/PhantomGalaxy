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

Based on the works of *Von Reyner Del Lupis* and the patented framework on Casimir Propagation Technologies.

Terran engineering treats the Del Lupis framework as the resolved bridge between local Casimir boundary manipulation and ship-scale metric compression: properly phased Casimir surfaces can be locked into a propagating internal compression corridor rather than remaining mere plate-to-plate forces.

This sheet assumes that coupling is valid and tracks its mechanical consequences. The unresolved leap is the coupling itself: ordinary Casimir plates do not, by themselves, imply useful spacetime dragging or macroscopic traversal shortening.

## Layer 0 — Reference Mechanics: Coil-Based Casimir-Repulsion Drive

Layer 0 defines the local actuation mechanism. It separates internal CNT sheet-pair motion from macroscopic brick stroke so the ship-scale compression math does not confuse actuator bookkeeping with corridor compression.

### Propulsion System


| Field               | Value                                      | Notes                                                                         |
| ------------------- | ------------------------------------------ | ----------------------------------------------------------------------------- |
| Drive type          | Coil-based Casimir-Repulsion Drive         | ISCD reference actuation mechanism                                            |
| Active component    | 1 cm² CNT sheet-pairs                      | Casimir-repulsion surfaces                                                    |
| Sheet types         | Doped superconducting + undoped CNT sheets | Paired active surfaces                                                        |
| Brick architecture  | 9.72k pair brick                           | 9,720 CNT sheet-pairs per brick                                               |
| Ring tile count     | 360 bricks/ring                            | Bricks tile the ring circumference                                            |
| Baseline pulse rate | 1 kHz                                      | Internal active-cell pulse rate; separate from the 1 s ring compression cycle |


*Note: the 1 Hz ring cycle is the macroscopic compress-reset cadence. Internal 1 kHz CNT pulses occur within each brick and do not define coil propagation timing.*

### CNT Pair and Brick Actuation


| Metric                                  | Value             | Notes                                                                                        |
| --------------------------------------- | ----------------- | -------------------------------------------------------------------------------------------- |
| Sheet-pair gap cycle                    | 500 nm to 1000 nm | Sheets move together/apart across the pulse cycle                                            |
| Per-pair gap displacement               | 500 nm/pulse      | Local CNT sheet-pair actuation distance                                                      |
| Pair count per brick                    | 9,720             | Current rib-aware active-cell count                                                          |
| Aggregate internal pair displacement    | 4.86 mm/pulse     | 500 nm × 9,720; bookkeeping value, not brick travel                                          |
| Full stroke envelope                    | 1.68 m            | Maximum radial span from shortest/fully-inward position to fully-extended position           |
| Brick unit height / radial thickness    | 0.1 m             | Physical radial thickness of the brick body                                                  |
| Minimum clearance / inter-brick spacing | 0.05 m            | 5 cm required spacing, converted to meters                                                   |
| Net brick physical stroke               | 1.53 m            | 1.68 m - 0.1 m - 0.05 m; usable macroscopic radial travel of each brick during inward stroke |


### Ring-Stage Actuation


| Metric                      | Value                   | Notes                                                                             |
| --------------------------- | ----------------------- | --------------------------------------------------------------------------------- |
| Bricks per ring             | 360                     | Full ring tile count                                                              |
| Active cells per brick      | 9,720                   | Current rib-aware brick lading count                                              |
| Active cells per ring       | 3,499,200               | 9,720 cells/brick × 360 bricks/ring                                               |
| Full stroke envelope        | 1.68 m                  | Maximum radial span before subtracting brick unit height                          |
| Brick unit height           | 0.1 m                   | Physical radial thickness of the brick body                                       |
| Minimum clearance           | 0.05 m                  | 5 cm required spacing, converted to meters                                        |
| Net ring radial stroke      | 1.53 m                  | Same usable macroscopic inward stroke applied by each brick                       |
| Corridor boundary motion    | Rmax to Rmin            | Defined by brick physical stroke                                                  |
| Stage compression ratio     | TCR_stage = Rmin / Rmax | Derived from ship/ring geometry, not directly from internal actuation bookkeeping |
| Full-ring cell pulse energy | 3,499.2 J/pulse         | 3,499,200 cells/ring × 0.001 J/cell pulse                                         |


### Energy Metrics


| Metric                                       | Value                | Notes                                                                                  |
| -------------------------------------------- | -------------------- | -------------------------------------------------------------------------------------- |
| Cell pulse energy / heat load                | 0.001 J/cell pulse   | Current per-cell heat/work bookkeeping assumption                                      |
| Pulse energy per 9.72k pair brick            | 9.72 J/brick pulse   | 9,720 cells × 0.001 J/cell pulse                                                       |
| Full-ring pulse energy                       | 3,499.2 J/ring pulse | 360 bricks × 9.72 J/brick pulse                                                        |
| Ring power intake at 1 kHz                   | ~3.50 MW/ring        | 3,499.2 J/pulse × 1,000 pulses/sec, before overhead margin                             |
| Heat dissipation required at 1 kHz           | ~3.50 MW/ring        | Steady-state thermal rejection load before overhead margin                             |
| Nimbus active-cell pulse energy, all rings   | ~699.84 kJ/pulse     | 200 rings × 3,499.2 J/ring pulse                                                       |
| Nimbus active-cell power at 1 kHz, all rings | ~699.84 MW           | Assumes all 200 rings pulse at 1 kHz simultaneously; actual ring schedule may be lower |


*Macro-stroke cycling note: The effective 1 Hz ring cycle determines the sequential coil propagation cadence. Internal 1 kHz CNT pulses do not require additional corridor-level mechanical cycling.*

### Compression Physics


| Metric                                | Value                     | Notes                                                                                                                  |
| ------------------------------------- | ------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Internal actuation ratio              | 1:600                     | CNT pair/brick internal actuation ratio                                                                                |
| Internal crunch fraction              | ~0.16%                    | Internal actuator effect; do not use as ship-scale TCR_stage by itself                                                 |
| Ship-scale compression driver         | Net brick physical stroke | 1.53 m radial boundary motion determines Rmin/Rmax after subtracting brick unit height and required clearance          |
| Spatial contraction per radial meter  | 0.07631 m/m               | Realspace corridor radius contracts by \(76.31\text{ mm}\) for every physical meter of radius during a ring stage compression (Ship Total... p. 29). |


### Thermal and Material Specs


| Metric                                  | Value      | Notes                                                               |
| --------------------------------------- | ---------- | ------------------------------------------------------------------- |
| CNT specific heat capacity              | 0.83 J/g·K | Standard CNT baseline                                               |
| CNT thermal limit in vacuum             | ~3,400 K   | Operational limit restricted by dopants                             |
| Required heat rejection per active ring | ~3.50 MW   | At 1 kHz steady-state operation with current 9,720-cell brick count |


## Layer 1 — Ship-Class RTD Mechanics

Layer 0 defines the RTD unit hardware, pulse energetics, CNT material limits, compression ratio, and baseline 1 kHz ring behavior. Layer 1 only applies those reference mechanics to ship-class coil geometry.

### Layer 1 Variables


| Variable               | Meaning                                                                                                                                                                                                    |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| N                      | Total ring count along the active coil                                                                                                                                                                     |
| ΔZ                     | Axial ring spacing. Current reference: ΔZ = (1.4 × brick axial length) + 0.05 m gap                                                                                                                        |
| Rmax                   | Corridor radius before a ring compresses                                                                                                                                                                   |
| Brick Stroke           | Usable macroscopic radial inward travel after subtracting brick unit height and minimum clearance. Current reference: 1.53 m from 1.68 m full stroke envelope - 0.1 m brick unit height - 0.05 m clearance |
| Rmin                   | Corridor radius after inward stroke: Rmin = Rmax - Brick Stroke                                                                                                                                            |
| TCR_stage              | Single-ring compression factor: TCR_stage = Rmin / Rmax                                                                                                                                                    |
| TCR_total              | Compounded corridor compression after all rings: TCR_total = TCR_stage^N                                                                                                                                   |
| Compression Multiplier | Apparent distance/speed multiplier from total corridor compression: Compression Multiplier = 1 / TCR_total                                                                                                 |
| v_orbital              | Assumed safe fast realspace velocity for idealized comparison. Current reference: 7,800 m/s                                                                                                                |
| v_effective_orbital    | Apparent corridor-adjusted velocity at orbital realspace speed: v_effective_orbital = v_orbital / TCR_total                                                                                                |


*Macro-stroke frequency note: The effective brick-level stroke is 1 Hz; this determines minimum corridor cooling requirements. Internal 1 kHz CNT pulses occur inside the bricks and do not impose additional macro cooling requirements.*

### Compression-Factor Speed Comparison

**Notes:** This is an ideal comparison table, not the phase-front handoff speed model. Effective speed is calculated from orbital reference velocity and total compression factor.