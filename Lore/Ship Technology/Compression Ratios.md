# Speed Charts

[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

## Global Modeling Assumptions

These are **structural assumptions**, not variables. They exist to keep each layer focused only on the math it directly determines.

1. **Standard bricks:** Bricks have fixed dimensions (**T × A × R_thickness**) and do not shrink.
    
2. **Rigid tiling per ring:** Bricks on a single ring do **not** overlap circumferentially; they tile the circumference edge-to-edge.
    
3. **Axisymmetric corridor:** The effective corridor boundary at a ring stage is treated as axisymmetric.
    
4. **Radial actuation (“shovel” model):** Bricks translate radially inward during a compression stroke, moving the corridor boundary from **Rmax → Rmin**.
    
5. **Sequential stages:** Rings act as time-multiplexed stages on the same corridor payload. Adjacent rings may overlap **in time**, but not **in space**.
    
6. **No simultaneous adjacent collapse:** A downstream ring begins compression only after the upstream ring has completed re-extension (handoff complete).
    
7. **Linear compression:** Corridor length scales linearly with radius; compression ratio is **TCR = Rmin / Rmax**.
    
8. **Ideal coupling (Layers 1–2):** No leakage, shear, angular interference, or loss terms are modeled until Layer 3.
    

## Layer 0 — Patent Basis

Based on the works of _Von Reyner Del Lupis_ and the patented framework on **Casimir Propagation Technologies**, which establishes controllable Casimir-force actuation as a given.

## Layer 1 — Compression Geometry (TCR)

### Conventions (Layer 1 only)

Layer 1 determines **compression ratio** from geometry. Layer 1 does **not** reference throughput variables.

**Chosen inputs (root variables):**

- **Coil Length** (ship spec)
    
- **RTC** — ring tiling count (segments per ring)
    
- **N** — rings per coil
    
- **Gmin, Gmax** — tangential gap at **Rmin** and **Rmax**
    

**Fixed brick constant:**

- **T = 0.3 m** (brick tangential length)
    

### Math (Layer 1)

**Tangential gap per brick at radius R:**

- **g(R) = (2πR / RTC) − T**
    

**Gap constraints:**

- **Gmin = g(Rmin)**
    
- **Gmax = g(Rmax)**
    

**Solve radii from gaps:**

- **Rmin = (RTC / 2π) · (T + Gmin)**
    
- **Rmax = (RTC / 2π) · (T + Gmax)**
    

**Stroke and stage compression:**

- **Brick Stroke = Rmax − Rmin**
    
- **TCR_stage = Rmin / Rmax**
    

> With gap‑parameterization, **TCR_stage = (T + Gmin) / (T + Gmax)** (RTC cancels). RTC still scales absolute radii and stroke.

**Axial spacing (derived here; used in Layer 2):**

- **ΔZ = Coil Length / N**
    

### Compression Table

| Ship    | Coil Length (m) | RTC | Rings/Coil (N) | Brick Stroke (m) | Rmin (m) | Rmax (m) | TCR_stage | Gaps (Gmin / Gmax) |
| ------- | --------------- | --- | -------------- | ---------------- | -------- | -------- | --------- | ------------------ |
| Nimbus  | 70              | 360 | 200            | 1.67             | 17.53    | 19.20    | 0.9130    | ≈6 mm / ≈3.5 cm    |
| Zephyr  | 100             | 480 | 400            | 2.2918           | 23.6823  | 25.9741  | 0.9118    | 1 cm / 4 cm        |
| Stratus | 270             |     |                |                  |          |          |           |                    |
| Atlas   | 500             |     |                |                  |          |          |           |                    |

_Actuation life (Layer 1 bookkeeping): values are stated per ****brick actuator**** at nominal load unless otherwise specified._

## Layer 2 — Effective Speed (v_ship)

### Conventions (Layer 2)

Layer 2 determines **effective speed** using frozen Layer‑1 outputs.

**Assumed from Layer 1 (inputs to Layer 2):**

- **N**
    
- **ΔZ = Coil Length / N**
    
- **TCR_stage = Rmin / Rmax**
    

**Chosen in Layer 2 (ops variables):**

- **P** — handoffs per stroke
    
- **F** — duty cycles/sec (full mechanical cycle rate = **F/2**)
    

**Current comparison convention:**

- Use **F = 2 duty cycles/sec** unless explicitly comparing multiple modes.
    

### Math (Layer 2)

- **LPS = P · ΔZ · (F/2)**
    
- **TCR_total = (TCR_stage)^N**
    
- **v_ship = LPS / TCR_total**
    

### Velocity Table

|Ship|Coil Length (m)|N|Rmin (m)|Rmax (m)|P|F (Hz, duty)|LPS (m/s)|v_ship (m/s)|
|---|---|---|---|---|---|---|---|---|
|Nimbus|70|200|17.53|19.20|5|2|1.75|1.40e8|
|Zephyr|100|400|23.6823|25.9741|5|2|1.25|1.37e16|
|Stratus|270||||||||
|Atlas|500||||||||

### Timing note (latency only)

- **t_transit ≈ Coil Length / LPS**