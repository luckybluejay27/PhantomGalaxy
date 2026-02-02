[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

# Speed Charts

## Global Modeling Assumptions (apply to all layers unless explicitly overridden)

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

## Layer 1 — Ideal Propagation Kinematics

### Acronyms and Conventions

- **RSBL** — bricks per ring.
- **Rings/Coil (N)** — count of rings along the coil length.
- **Brick Stroke** — radial one-way travel per brick during the **compression (extension) duty cycle**.
    - **Brick Stroke = Rmax − Rmin**.
- **F (Hz)** — ring undulation rate, defined as **duty cycles/sec**, where one duty cycle is **one half-cycle** (**extend** or **retract**).
    - A full mechanical cycle (**extend + retract**) spans **two duty cycles**, so the full-cycle rate is **F/2**.
    - _Layer‑1 convention:_ Compression occurs only during the **extend** duty cycle; **F is not a compression rate**.
- **P** — propagation step setting: **ring-to-ring handoffs per compression stroke**.
- **V_ext (m/s)** — average brick **extension** (compression) speed during the **extend duty cycle**.
    - One extend duty cycle lasts **1/F** seconds, so **V_ext = Brick Stroke · F**.
- **ΔZ (m/ring)** — axial spacing between adjacent rings.
    - **ΔZ = Coil Length / Rings/Coil**.
- **LPS (m/s)** — axial phase propagation speed down the coil.
    - Compression occurs once per **full mechanical cycle**, so in Layer 1–2 ideal coupling:
    - **LPS = P · ΔZ · (F/2)**.
    - _Layer‑1 note:_ LPS is a **phase-front speed**, not ship translation speed.

### Ring geometry and corridor compression (purpose of Rmin / Rmax)

- **Rmax** — effective corridor radius at **maximum extension** (least compressed state).
- **Rmin** — effective corridor radius at **minimum extension** (most compressed state).
- **Ring action (“shovel” model):** Standard bricks translate radially **inward** during a compression stroke, reducing the corridor radius from **Rmax → Rmin**. Bricks do **not** shrink.
- **Linear compression (from global assumptions):**
    - **Stage compression ratio:** **TCR_stage = Rmin / Rmax** (0 < TCR_stage ≤ 1).
    - This is the compression applied by **one ring acting once** on the payload.

#### Axisymmetric corridor slice volume (per ring stage)

Assume the corridor cross-section at a ring stage is axisymmetric and treated as a disk of radius **R**. For an axial slice thickness **ΔZ**:
- **V(R) = π R² ΔZ**

Then the **linear (length) compression ratio** for the corridor payload at that stage is:
- **TCR = L_compressed / L_real = Rmin / Rmax** (dimensionless, 0 < TCR ≤ 1)
    
and the corresponding **cross-section / volume factor** is:
- **TCR_V = V(Rmin) / V(Rmax) = (Rmin / Rmax)² = TCR²**
    

> **Important:** In Layer 1 we only define the **per-ring** compression factor (**TCR_stage = Rmin / Rmax**). How multiple rings combine into **TCR_total** is a **Layer 2** rule.

#### Standard Brick (unit definition)
- **Brick dimensions (T × A × R):** 0.3 m (tangential) × 0.1 m (axial) × 0.1 m (radial thickness).
- **Active face area (A_face):** **T × A**.
- **Per-stroke displaced volume (V_stroke):** **A_face × Brick Stroke**.
    
## Requirements (Layer 1 variables only)

|Ship|Coil Length (m)|RSBL|Rings/Coil (N)|Brick Stroke (m)|Rmin (m)|Rmax (m)|TCR_stage (=Rmin/Rmax)|Notes|
|---|---|---|---|---|---|---|---|---|
|Nimbus|70|360|200|1.67|17.53|19.20|0.9130||
|Zephyr|100||||||||
|Stratus|270||||||||
|Atlas|500||||||||

_Actuation life (Layer 1 bookkeeping): values are stated per **brick actuator** at nominal load unless otherwise specified._

## Layer 2 — Ideal Spacetime Hand-Off (Velocity)

### Step 1 — Definitions

- **TCR_stage** — per-ring linear compression factor:
    - **TCR_stage = Rmin / Rmax**
- **TCR_total** — total linear compression after **N** stages:
    - **TCR_total = (TCR_stage)^N**
- **ΔZ** — axial spacing between rings:
    - **ΔZ = Coil Length / N**
- **F (Hz)** — ring undulation rate, **duty cycles/sec** (one **extend** or **retract**).
    - Full mechanical cycle rate is **F/2**.
- **P** — propagation steps per compression stroke.
- **LPS** — compressed-payload propagation speed down the coil:
    - **LPS = P · ΔZ · (F/2)**
- **Ship velocity (ideal):**
    - **v_ship = LPS / TCR_total**

### Requirements (Layer 2 variables + resulting speed)

|Ship|Coil Length (m)|N|Rmin (m)|Rmax (m)|P|F (C/E/S) (Hz, duty)|LPS (C/E/S) (m/s)|v_ship (C/E/S) (m/s)|
|---|---|---|---|---|---|---|---|---|
|Nimbus|70|200|17.53|19.20|5|0.5 / 2 / 4|0.4375 / 1.75 / 3.50|3.50e7 / 1.40e8 / 2.80e8|
|Zephyr|100||||||||
|Stratus|270||||||||
|Atlas|500||||||||

### Reference Operating Profile — Nimbus (Duty-Cycle Definition)

| Mode   | F (Hz, duty cycles/sec) | P (handoffs/stroke) |
| ------ | ----------------------- | ------------------- |
| Cruise | 0.5                     | 5                   |
| Econ   | 2                       | 5                   |
| Sprint | 4                       | 5                   |

### Timing note (latency only)

- **t_transit ≈ Coil Length / LPS**