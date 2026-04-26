[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)
# Speed Charts

## Global Modeling Assumptions

These are **structural assumptions**, not variables. They exist to keep each layer focused only on the math it directly determines.

1. **Standard bricks:** Bricks have fixed dimensions (**T × A × R_thickness**) and do not shrink.
2. **Rigid tiling per ring:** Bricks on a single ring do **not** overlap circumferentially; they tile the circumference edge-to-edge.
3. **Axisymmetric corridor:** The effective corridor boundary at a ring stage is treated as axisymmetric.
4. **Radial actuation ("shovel" model):** Bricks translate radially inward during a compression stroke, moving the corridor boundary from **Rmax → Rmin**.
5. **Sequential stages:** Rings act as time-multiplexed stages on the same corridor payload. Adjacent rings may overlap **in time**, but not **in space**.
6. **No simultaneous adjacent collapse:** A downstream ring begins compression only after the upstream ring has completed re-extension (handoff complete).
7. **Linear compression:** Corridor length scales linearly with radius; compression ratio is **TCR = Rmin / Rmax**.
8. **Ideal coupling (Layers 1–2):** No leakage, shear, angular interference, or loss terms are modeled until Layer 3.

## Layer -1 — Patent Basis

Based on the works of _Von Reyner Del Lupis_ and the patented framework on **Casimir Propagation Technologies**.
Terran engineering treats the Del Lupis framework as the resolved bridge between local Casimir boundary manipulation and ship-scale metric compression: properly phased Casimir surfaces can be locked into a propagating internal compression corridor rather than remaining mere plate-to-plate forces.
This sheet assumes that coupling is valid and tracks its mechanical consequences.

## Layer 0 — RTD Reference Mechanics: Coil-Based Casimir-Repulsion Drive

Layer 0 defines the local actuation mechanism. It separates **internal CNT sheet-pair motion** from **macroscopic brick stroke** so the ship-scale compression math does not confuse actuator bookkeeping with corridor compression.

### Propulsion system

|Field|Value|Notes|
|---|---|---|
|Drive type|Coil-based Casimir-Repulsion Drive|ISCD reference actuation mechanism|
|Active component|1 cm² CNT sheets|Casimir-repulsion surfaces|
|Sheet types|Doped superconducting + undoped CNT sheets|Paired active surfaces|
|Brick architecture|1k pair brick|1,000 CNT sheet-pairs per brick|
|Ring tile count|360 bricks/ring|Bricks tile the ring circumference|
|Baseline pulse rate|1 kHz|Current fastest rate without proper cooling|

### CNT pair and brick actuation

|Metric|Value|Notes|
|---|---|---|
|Sheet-pair gap cycle|500 nm ↔ 1000 nm|Sheets move together/apart across the pulse cycle|
|Per-pair gap displacement|500 nm/pulse|Local CNT sheet-pair actuation distance|
|Pair count per brick|1,000|Internal actuation stack count|
|Aggregate internal pair displacement|0.5 mm/pulse|500 nm × 1,000; bookkeeping value, not brick travel|
|Full stroke envelope|1.68 m|Maximum radial span from shortest/fully-inward position to fully-extended position|
|Brick unit height / radial thickness|0.1 m|Physical radial thickness of the brick body|
|Minimum clearance / inter-brick spacing|0.05 m|5 cm required spacing, converted to meters|
|Net brick physical stroke|1.53 m|1.68 m − 0.1 m − 0.05 m; usable macroscopic radial travel of each brick during inward stroke|

### Ring-stage actuation

| Metric                    | Value                   | Notes                                                                       |
| ------------------------- | ----------------------- | --------------------------------------------------------------------------- |
| Bricks per ring           | 360                     | Full ring tile count of a base model, subject to change                     |
| Full stroke envelope      | 1.68 m                  | Maximum radial span before subtracting brick unit height                    |
| Brick unit height         | 0.1 m                   | Physical radial thickness of the brick body                                 |
| Minimum clearance         | 0.05 m                  | 5 cm required spacing, converted to meters                                  |
| Net ring radial stroke    | 1.53 m                  | Same usable macroscopic inward stroke applied by each brick                 |
| Corridor boundary motion  | Rmax → Rmin             | Defined by brick physical stroke                                            |
| Stage compression ratio   | TCR_stage = Rmin / Rmax | Derived from ship/ring geometry, not directly from 1:600 internal actuation |
| Full-ring mechanical work | 1.8 J/pulse             | 360 bricks × 0.005 J/brick pulse                                            |

### Energy metrics

|Metric|Value|Notes|
|---|---|---|
|Mechanical work per 1k pair brick|0.005 J/pulse|Per brick pulse event|
|Full-ring mechanical work|1.8 J/pulse|360 bricks × 0.005 J|
|System power intake at 1 kHz|1.81 kW|Mechanical + electrical overhead baseline|
|Heat dissipation required at 1 kHz|~1,811 W|Steady-state thermal rejection load|

### Compression physics

|Metric|Value|Notes|
|---|---|---|
|Internal actuation ratio|1:600|CNT pair/brick internal actuation ratio|
|Internal crunch fraction|~0.16%|Internal actuator effect; do not use as ship-scale TCR_stage by itself|
|Ship-scale compression driver|Net brick physical stroke|1.53 m radial boundary motion determines Rmin/Rmax after subtracting brick unit height and required clearance|
|Spatial displacement per drive length||Pending recalculation under corrected brick-stroke model|

### Thermal and material specs

|Metric|Value|Notes|
|---|---|---|
|CNT specific heat capacity|0.83 J/g·K|Standard CNT baseline|
|CNT thermal limit in vacuum|~3,400 K|Operational limit restricted by dopants|
|Required heat rejection|~1,811 W|At 1 kHz steady-state operation|

## Layer 1 — Ship-Class RTD Mechanics

Layer 0 defines the RTD unit hardware, pulse energetics, CNT material limits, compression ratio, and baseline 1 kHz ring behavior. Layer 1 only applies those reference mechanics to ship-class coil geometry.

### Layer 1 variables

- **N** — total ring count along the active coil.
- **ΔZ** — axial ring spacing. Current reference: **ΔZ = (1.4 × brick axial length) + 0.05 m gap**.
- **Rmax** — corridor radius before a ring compresses.
- **Brick Stroke** — usable macroscopic radial inward travel after subtracting brick unit height and minimum clearance. Current reference: **1.53 m** from **1.68 m full stroke envelope − 0.1 m brick unit height − 0.05 m clearance**.
- **Rmin** — corridor radius after inward stroke: **Rmin = Rmax − Brick Stroke**.
- **TCR_stage** — single-ring compression factor: **TCR_stage = Rmin / Rmax**.
- **TCR_total** — compounded corridor compression after all rings: **TCR_total = TCR_stage^N**.
- **Compression Multiplier** — apparent distance/speed multiplier from total corridor compression: **Compression Multiplier = 1 / TCR_total**.
- **v_orbital** — assumed safe fast realspace velocity for idealized comparison. Current reference: **7,800 m/s**.
- **v_effective_orbital** — apparent corridor-adjusted velocity at orbital realspace speed: **v_effective_orbital = v_orbital / TCR_total**.

### Ship-class effective-speed mechanics

**Notes:** Effective speed assumes **v_orbital = 7,800 m/s** as the safe fast realspace comparison velocity.

|Ship|Coil Length (m)|Ring Count (N)|ΔZ (m/ring)|Rmax (m)|Brick Stroke (m)|Rmin (m)|TCR_stage|TCR_total|Compression Multiplier|Effective Speed at Orbital Velocity (m/s)|Notes|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Nimbus|38|200|0.19|20.05|1.53|18.52|0.92369|1.27e-7|7.85e6×|6.12e10||
|Zephyr|57|300|0.19|20.05|1.30|18.75|0.93516|1.85e-9|5.42e8×|4.23e12||
|Stratus|76|400|0.19|20.05|1.01|19.04|0.94963|1.05e-9|9.53e8×|7.43e12||
|Atlas|114|600|0.19|20.05|0.80|19.25|0.96010|2.45e-11|4.08e10×|3.18e14||

## Layer 2 — Errors and Assumption Failures.