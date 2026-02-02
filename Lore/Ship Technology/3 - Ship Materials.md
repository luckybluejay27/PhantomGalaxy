[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

# Ship Tech — Actuation & Materials

## Scope

This document covers **material science and mechanical survivability** for ship-scale actuation systems.

It is intentionally **decoupled from compression ratios, velocity math, and spacetime bookkeeping**. Those live elsewhere. This page exists to answer a narrower question:

> _What materials can repeatedly survive extreme inertial loads, high cycle counts, and precision constraints without shattering?_

---

## System Partitioning (Critical Clarification)

Ship actuation hardware is not a single monolithic component. For survivability analysis it is split into three distinct roles:

1. **Brick (Casimir Boundary Unit)** — defines and shapes the spacetime boundary
    
2. **Piston / Actuator (Force Transfer Element)** — physically moves the brick
    
3. **Frame / Mounting Structure** — reacts inertial loads into the hull
    

Only the **piston/actuator** is required to tolerate the full combination of:

- cyclic acceleration and deceleration
    
- alternating tensile and compressive loads
    
- long fatigue life at high cycle counts
    

---

## Brick Material (Resolved)

**Chosen configuration:**

- **Structural frame:** Silicon Carbide (SiC) or SiC Ceramic Matrix Composite (SiC/SiC)
    
- **Casimir-active layers:** Graphene-class conductive sheets
    
- **Spacers / dielectrics:** Hexagonal Boron Nitride (h-BN) or ALD-grown ceramics
    

The brick prioritizes:

- dimensional stability
    
- thermal tolerance
    
- flatness at micron-scale gaps
    

It is _not_ optimized for high inertial motion. That burden is carried elsewhere.

---

## Piston / Actuator Material (Primary Focus)

### Design Requirements

The piston must:

- Survive repeated inertial loading without brittle fracture
    
- Tolerate high-cycle fatigue (10^7–10^10 cycles lifetime)
    
- Maintain structural integrity under alternating acceleration
    
- Fail gradually rather than catastrophically
    
- Remain manufacturable and serviceable at ship scale
    

**Bulk compressibility is not the limiting factor.**  
The dominant failure modes are fatigue, buckling, joint stress, and thermal drift.

---

## Candidate Material Classes

### 1. Beta Titanium Alloys (Baseline Choice)

**Examples:** Ti-5Al-5Mo-5V-3Cr ("Ti-5553" class)

**Why:**

- High specific strength (strong relative to mass)
    
- Excellent fatigue resistance when properly stress-managed
    
- Good fracture toughness compared to ceramics
    
- Proven aerospace actuator and landing-gear usage
    

**Role:**

- Primary piston / pushrod material
    
- Best balance of inertia, durability, and manufacturability
    

---

### 2. Nickel-Based Superalloys (High-Temperature Option)

**Examples:** Inconel 718–class alloys

**Why:**

- Exceptional fatigue life at elevated temperatures
    
- Resistant to creep and thermal degradation
    
- Mature design and inspection ecosystem
    

**Tradeoff:**

- High density increases inertial loads
    

**Role:**

- Used only where thermal margins dominate over mass concerns
    

---

### 3. Ceramic Matrix Composite Struts (Stiffness-Focused, Conditional)

**Examples:** SiC/SiC structural members

**Why:**

- Extreme stiffness
    
- High temperature tolerance
    
- Low creep
    

**Caveat:**

- Ceramics dislike tensile stress concentrations and impact
    

**Role:**

- Used as guided struts or tension/compression members
    
- Must be paired with compliant joints or flexures
    

---

## Interfaces & Wear Surfaces

Where contact is unavoidable:

- **Coatings:** Diamond-Like Carbon (DLC)
    
- **Solid lubricants:** MoS₂ / WS₂
    
- **Guidance:** Ceramic rolling elements or flexure-based alignment
    

Sliding metal-on-metal interfaces are avoided wherever possible.

---

## Inertial Physics Constraint (Design Law)

Effective g-loads arise **only during acceleration and deceleration**, not steady motion.

For a fixed one-way stroke **S** and stroke time **t**, peak acceleration scales as:

[ a \propto \frac{S}{t^2} ]

Thus survivability is controlled by:

- stroke length
    
- cycle time
    
- acceleration profile smoothness
    

Material choice mitigates failure modes, but **cannot eliminate inertia**.

---

## Canonical Specification (Short Form)

> **Casimir Bricks** are SiC-framed graphene/h-BN laminates.
> 
> **Actuation pistons** are beta-titanium pushrods with DLC-coated interfaces and ceramic guidance, designed for extreme fatigue tolerance under cyclic inertial loads.

---

## Design Philosophy

The system is not built to be indestructible.

It is built to:

- survive long enough to matter
    
- fail predictably
    
- be inspectable, replaceable, and understood
    

In ship engineering, durability is not immortality. It is _managed mortality_.