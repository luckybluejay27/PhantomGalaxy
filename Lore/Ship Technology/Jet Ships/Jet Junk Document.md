# Class A Jet Plane - Mathematical Foundation Document

## 1. Description of Math Involved

The Class A Civilian Jet Plane uses an **Axial Peristaltic Compression Model** derived from the Del Lupis Casimir framework. Unlike ship-scale ISCD systems that use radial ring-based compression, the jet plane employs linear piston pairs arranged in a chevron pattern along the aircraft's axis.

The compression mathematics follow a **geometric progression** where each sequential piston pair stage compounds the compression of the previous stage. This creates a traveling compression wave - as one piston pair completes its stroke and retracts, the next pair activates to capture and further compress the already-contracted space.

Three key modifications distinguish this from ship-scale formulas:
- **Axial stroke** replaces radial brick stroke (0.15m vs 1.53m)
- **Piston pair count** replaces ring count as the compression exponent (30 vs 200)
- **Operational frequency multiplier** accounts for peristaltic wave propagation (900Hz)

The voice coil derating factor (0.75) accounts for mechanical coupling inefficiency between piston motion and actual spacetime compression, analogous to real-world voice coil actuator efficiency ratings.

---

## 2. Raw Variable Math

### Primary Compression Formula

$$TCR_{\text{jet}} = \left(\frac{L_{\text{eff}}}{L_{\text{eff}} - \Delta L_{\text{stroke}}}\right)^{N_{\text{pairs}}} \times f_{\text{op}} \times \eta_{\text{vc}}$$

### Variable Definitions

| Variable | Symbol | Value | Unit | Source |
|----------|--------|-------|------|--------|
| Effective compression length | $L_{\text{eff}}$ | 7.5 | m | Jet length minus 0.5m safety margin |
| Half-brick stroke | $\Delta L_{\text{stroke}}$ | 0.15 | m | Half of 0.3m Casimir brick dimension |
| Piston pairs (total) | $N_{\text{pairs}}$ | 30 | count | 3 racks × 8 + 6 additional |
| Operating frequency | $f_{\text{op}}$ | 900 | Hz | 10% below 1kHz CNT limit |
| Voice coil derating | $\eta_{\text{vc}}$ | 0.75 | factor | Aerospace voice coil efficiency |

### Speed Calculation

$$v_{\text{effective}} = v_{\text{base}} \times TCR_{\text{jet}}$$

Where $v_{\text{base}} = \text{Mach 2}$ (baseline jet velocity)

### Power Calculation

$$P_{\text{total}} = P_{\text{casimir}} + P_{\text{voice-coil}}$$

$$P_{\text{casimir}} = N_{\text{pairs}} \times E_{\text{half-brick}} \times f_{\text{op}}$$

$$P_{\text{voice-coil}} = N_{\text{pairs}} \times P_{\text{per-pair}}$$

Where:
- $E_{\text{half-brick}} = 4.86$ J/pulse (half of 9.72 J/brick from ship documentation)
- $P_{\text{per-pair}} = 200$ W (estimated voice coil power per piston pair)

---

## 3. Class A Civilian Jet Plane - Complete Specification

### Overview
- **Size:** ~8-10 meters length
- **Crew:** 1-2 (Civilian licensed pilots)
- **Cargo Space:** Minimal (personal effects only)
- **Role:** High-speed personal transportation. Licensed civilian use only.

### Detailed Specifications

| Category | Metric | Value | Notes |
|----------|--------|-------|-------|
| **Aircraft Dimensions** | Length | ~8 m | Includes 0.5m safety margin |
| | Width | ~3 m | Typical light aircraft |
| | Height | ~2 m | Typical light aircraft |
| **Mass** | Dry mass | ~1.5 t | Lightweight jet frame |
| | Wet mass | ~2.0 t | Including fuel/CNT systems |
| **Power** | Battery bank | 50 kWh | Distributed capacitors |
| | Battery mass | ~50 kg | High-density storage |
| | Propulsion power | 137 kW | ISCD system requirement |
| | Casimir power | 131.2 kW | 30 pairs × 4.86 J × 900 Hz |
| | Voice coil power | 6 kW | 30 pairs × 200 W |
| **ISCD Geometry** | Compression length | 7.5 m | After safety margins |
| | Piston pairs | 30 | 3 racks × 8 + 6 pairs |
| | Piston length | 0.25 m | Physical piston unit length |
| | Piston stroke | 0.15 m | Half-brick compression |
| | Piston spacing | 0.25 m | Standardized mounting |
| | Brick geometry | 0.1×0.1×0.15 m | Half-brick dimensions |
| | Active face area | 0.03 m² | 0.1m × 0.3m face |
| **Compression** | TCR per stage | 1.0204 | (7.5/7.35) per stage |
| | Compression factor | 1,229.85× | Sequential compounded |
| | Operating frequency | 900 Hz | 10% safety margin |
| | Derating factor | 0.75 | Voice coil efficiency |

### ISCD Compression Performance

| Metric | Value |
|--------|-------|
| **Active compression length** | 7.5 m |
| **Piston pairs** | 30 |
| **Stroke per pair** | 0.15 m |
| **TCR per stage** | 1.0204 |
| **Total stages** | 30 |
| **Compression factor** | 1,229.85× |
| **Base velocity** | Mach 2 |
| **Effective speed** | Mach 2,459.7 |

### Calculation Verification

$$TCR_{\text{jet-A}} = \left(\frac{7.5}{7.5 - 0.15}\right)^{30} \times 900 \times 0.75$$

$$= (1.0204)^{30} \times 900 \times 0.75$$

$$= 1.822 \times 900 \times 0.75$$

$$= 1,229.85$$

$$v_{\text{effective}} = \text{Mach 2} \times 1,229.85 = \text{Mach 2,459.7}$$

---

*Note: Maximum performance rating. Normal operations require significant derating for human safety and structural integrity.*

---

#  Class A Civilian Jet Plane
- Size: ~8-10 meters length
- Crew: 1-2 (Civilian licensed pilots)
- Cargo Space: Minimal (personal effects only)
- Role: High-speed personal transportation. Licensed civilian use only.
# Class A Jet Detail
| Category | Metric | Value | Notes |
|---------|---------|---------|---------|
| Aircraft Dimensions | Length | ~8 m | Includes 0.5m safety margin |
| | Width | ~3 m | Typical light aircraft |
| | Height | ~2 m | Typical light aircraft |
| Mass | Dry mass | ~1.5 t | Lightweight jet frame |
| | Wet mass | ~2.0 t | Including fuel/CNT systems |
| Power | Battery bank | 50 kWh | Distributed capacitors |
| | Battery mass | ~50 kg | High-density storage |
| | Propulsion power | 137 kW | ISCD system requirement |
| ISCD Geometry | Compression length | 7.5 m | After safety margins |
| | Piston pairs | 30 | 3 racks × 8 + 6 pairs |
| | Piston stroke | 0.15 m | Half-brick compression |
| | Piston spacing | 0.25 m | Standardized mounting |
| Compression | TCR_per_stage | 1.0204 | (7.5/7.35) per stage |
| | Compression factor | 1,230× | Sequential compounded |
| | Operating frequency | 900 Hz | 10% safety margin |
# ISCD Compression Performance
Performance calculated using peristaltic sequential compression model. Effective speed represents theoretical maximum with full system utilization.
| Metric | Value |
|---------|---------|
| Active compression length | 7.5 m |
| Piston pairs | 30 |
| Stroke per pair | 0.15 m |
| TCR_per_stage | 1.0204 |
| Total stages | 30 |
| Compression factor | 1,230× |
| Effective speed at Mach 2 | Mach 2,460 |
Note: Maximum performance rating. Normal operations require significant derating for human safety and structural integrity.