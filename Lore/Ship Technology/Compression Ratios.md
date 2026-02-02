[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

# Speed Charts

## Layer 0 — Patent Basis

Based on the works of _Von Reyner Del Lupis_ and the patented framework on **Casimir Propagation Technologies**, which establishes controllable Casimir-force actuation as a given.

## Layer 1 — Ideal Propagation Kinematics

### Acronyms and Conventions

- **RSBL** — bricks per ring.
    
    - (Derived geometry) **Ring circumference (approx.)** ≈ **RSBL × T** (assumes near-full tiling; gaps ignored).
        
- **Rings per Coil** — count of rings along the coil length.
    
- **Brick Stroke** — radial actuator travel per brick (**full-travel per stroke**; interpreted as the **effective radial displacement of the active interface**).
    
- **F (Hz)** — ring undulation rate, defined as **compression strokes/sec**, where **one stroke** is a full travel from fully extended to fully unextended (direction does not matter).
    
- **P** — propagation step setting: **number of ring-to-ring handoffs completed per stroke** (handoffs/stroke; dimensionless).
    
    - A _handoff_ is the transfer of the active compression phase from one ring to the next.
        
    - **P = 1** means the phase advances exactly one ring during a stroke; **P = N** advances N rings during that same stroke.
        
- **C (m/s)** — brick compression stroke speed (**Brick Stroke × F**).
    
- **LPS (m/s)** — axial phase propagation speed down the coil (**P × ΔZ × F**).
    
    - **ΔZ** appears here only as a geometric length scale converting handoffs into meters; no angular interference, phase tilt, or coupling effects are modeled in Layer 1.
        
- **ΔZ (m/ring)** — **axial spacing** between adjacent rings (center-to-center). This is the axial distance advanced by **one** ring-to-ring handoff. Defined by **ΔZ = Coil Length / Rings per Coil**.
    

#### Standard Brick (unit definition)

- **Brick dims (T × A × R)** = **0.3 m (tangential) × 0.1 m (axial) × 0.1 m (radial thickness)**.
    
- **Active face area (A_face)** = **T × A** (the face that “pushes” toward the next ring).
    
- **Per-stroke displaced volume (V_stroke)** = **A_face × Brick Stroke**.
    

## Requirements

|Ship|Coil Length|RSBL|Rings per Coil|Brick Stroke|Rmin|Rmax|Notes|
|---|---|---|---|---|---|---|---|
|Nimbus|70 m|360|200|1.67 m|17.53 m|19.20 m|Baseline small ship|
|Zephyr|100 m|||||||
|Stratus|270 m|||||||
|Atlas|500 m|||||||

## Speed

(Operating envelope. Use cruise / econ / sprint triplets for readability; anything computed is explicitly computed via the conventions above.)

|   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|
|Ship|F (cruise / econ / sprint) Hz|P (handoffs/stroke)|LPS (cruise/econ/sprint) m/s|C (cruise/econ/sprint) m/s|Actuation Life|Notes|
|Nimbus|0.5/2/4|5|0.875/3.50/7.00|0.835/3.34/6.68|8,000,000 strokes (per brick actuator, nominal load)||
|Zephyr|||||||
|Stratus|||||||
|Atlas|||||||

_Actuation Life (Layer 1 bookkeeping): values are stated per_ **_brick actuator_** _at nominal load unless otherwise specified._

## Notes

#### “Unaided” propagation (if someone wants to estimate speed from brick geometry)

Because **A_face × Brick Stroke** is a _volume per stroke_, turning that into a _speed_ requires an assumed corridor cross‑section:

- **Working corridor area (A_work)** — the effective cross-section of spacetime being “shoved” forward by the ring (declared per hull class or mission profile).
    
- **Ring flux (Q_ring)** = **RSBL × V_stroke × F** (m³/s).
    
- **Unaided propagation speed (UAPS)** = **Q_ring / A_work** (m/s).