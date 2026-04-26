[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

# Ship Tech — Actuation & Materials

## Scope

This document defines the major material choices for ISCD actuation hardware: what each part is made of, why that material is used, and what failure mode it is meant to survive.

---

# 1. Active Cell Lading

Cell lading covers material ordered per repeated actuator cell. Void gaps and active travel clearance are not material mass. DLC wear films and WS₂/MoS₂ dry lubricants are ordered as surface-treatment materials; unless coating thickness is later specified, lubricant is tracked as a procurement overage rather than bulk cell volume.

**Dry active cell mass, first pass:** approximately **0.1123 g/cell**, from sheet pair + copper coil + spacer supports + guide rails + SiC vacuum shell. This excludes shared brick cooling, brick frame, buswork, and piston hardware.

## 1.1 Per-Cell Material Allowances

|Part|Material Choice|Function|Per-Cell Volume Allowance|Per-Cell Mass Allowance|
|---|---|---|---|---|
|**Complete Packaged Active Cell Vacuum Envelope**|Packaged active cell envelope, excluding shared brick cooling|Total geometric envelope around active sheets, coil, rails/grooves, spacers, internal vacuum gap, and outer shell|**0.25 cm³/cell**|Not treated as solid mass; mass comes from listed materials plus outer vacuum shell coating|
|**Active Sheet Pair**|Two 1 µm anisotropic diamagnetic CNT / graphene / graphite-like carbon laminates|Produces controlled sheet separation when pulsed inside a magnetic field|**0.0002 cm³/cell**|**0.00028 g/cell** using 1.4 g/cm³ laminate density|
|**Copper Sleeve Coil**|Copper sleeve coil around both active sheets|Generates the pulsed magnetic field that drives the diamagnetic response of each active cell pair|**0.0072 cm³/cell**|**0.0645 g/cell** from 0.0072 cm³ copper × 8.96 g/cm³|
|**Dielectric / Spacer Material**|Silicon nitride spacer supports with h-BN / ALD ceramic liner|Maintains controlled sheet separation while resisting electrical leakage and thermal drift|**5.0e-7 cm³/cell**|**1.6e-6 g/cell** using 3.17 g/cm³ silicon nitride density; liner mass negligible at first pass|
|**Rails / Grooves / Local Struts**|Silicon nitride or polished alumina ceramic, DLC-coated contact faces, WS₂ dry-film lubricant with 10% procurement overage|Prevents sheet tilt, flip, lateral drift, and conductive shorting while preserving actuation travel|**5.0e-7 cm³/cell**|**1.6e-6 g/cell** using 3.17 g/cm³ silicon nitride density; WS₂ lubricant ordered as 10% surface-treatment overage, not bulk structure|
|**Vacuum Shell / Cell Coating**|CVD SiC thin vacuum shell|Seals the packaged active cell so the sheet pair operates in a reliable internal vacuum; does not fill the remaining envelope|**0.0148 cm³/cell**|**0.0475 g/cell** using 3.21 g/cm³ SiC density|

**Non-lading geometry note:** active motion gap is **500–1000 nm**. At max gap, the void volume is **0.0001 cm³/cell** from **1 cm² × 1000 nm**. It is void volume, not material mass.

---

# 2. Brick-Level Lading

Brick lading covers the **overall brick envelope and shared support/cooling system**. It determines how many packaged active cells fit per brick and how much volume remains for SiC support geometry, wet-service chambering, wicking, manifolds, bus routing, bonding, isolation, and structural rigidity.

Mass is not yet calculated except where already listed at the cell level.

## 2.1 Brick Operation-Cell Structure Assumptions

This table defines the working geometry used to estimate brick cell count and non-active-component lading. Values are structural assumptions for calculation only; detailed rib/trench/channel topology remains pending.

|Assumption|Working Value|Use in Math|Notes|
|---|---|---|---|
|**Brick envelope**|**0.1 m × 0.1 m × 0.3 m**|Total available brick volume|Equals **3,000 cm³**|
|**Packaged active cell body**|**10 mm × 10 mm × 2.5 mm**|Active cell size before service allocation|Equals **0.25 cm³/cell**|
|**Wet-service chamber height**|**0.2 mm**|Minimum chamber/trench height attached to each layer|Carries wick/vapor/service affordance|
|**Ceramic bond/interface allowance**|**0.05 mm**|Layer tolerance and bonding media allowance|First-pass value; may be refined later|
|**Minimum flush SiC band height**|**2.7 mm**|Cell height + chamber height|Before bond/interface tolerance|
|**Operation-cell vertical pitch**|**2.75 mm**|Stack layer height|Cell + chamber + bond/interface allowance|
|**Operation-cell lateral pitch, short axis**|**11.11 mm**|Fits **9 cells** across 100 mm brick width|Includes active cell plus shared SiC/service allocation|
|**Operation-cell lateral pitch, long axis**|**10 mm**|Fits **30 cells** along 300 mm brick length|Assumes long-axis service routing is shared/striped rather than per-cell added pitch|
|**Cells per layer**|**270**|9 × 30|Rib-aware layer count|
|**Stackable layers**|**36**|floor(100 mm / 2.75 mm)|Leaves about **1 mm** global stack margin|
|**Nominal active-cell count**|**9,720 cells/brick**|270 × 36|Current rib-aware working count|
|**Operation-cell volume equivalent**|**~0.306 cm³**|Brick envelope / nominal cell count|Includes allocated share of chambering, SiC support, bonding, routing, and tolerance|
|**Packaged-cell volume used**|**2,430 cm³**|9,720 × 0.25 cm³|Active packaged cells only|
|**Non-active-component buffer, total**|**570 cm³ / 19%**|3,000 − 2,430 cm³|Total brick volume reserved for non-active-cell components|
|**Non-cell repeated-structure volume**|**~540 cm³ / 18%**|9,720 × (0.306 − 0.25) cm³|Allocated repeated service/support volume|
|**Remaining global margin**|**~30 cm³ / 1%**|3,000 − operation-cell volume total|Edge manifolds, end tolerance, trim, and unmodeled routing|

## 2.2 Per-Brick Non-Active-Component Volume Budget

These values allocate the **~540 cm³ repeated non-cell structure volume** from the operation-cell model. The separate **~30 cm³ remaining global margin** is left unassigned for edge manifolds, end tolerance, trim, and unmodeled routing. Dedicated thermal spreaders are not counted separately; local heat spreading is handled by the shared vapor-channel lattice.

|Part|Material Choice|Function|Per-Brick Volume Allowance|Per-Brick Mass Allowance|
|---|---|---|---|---|
|**Brick Surface / Carrier**|Alumina–mullite oxide/oxide CMC|Provides the rigid structural container for packaged active cells; maintains alignment and brick integrity|**~240 cm³/brick**|**~566 g/brick** using **2.36 g/cm³** first-pass Ox/Ox CMC density|
|**Shared Vapor Cooling Network**|Silicon-nitride-lined alumina–mullite CMC microchannels with ethanol–water working fluid, **3:7 ethanol**:water|Moves heat from enclosed cells to brick manifolds and ringframe cooling loops; also performs local heat-spreading through the channel lattice|**~150 cm³/brick** total cooling-network envelope|**~237 g/brick** using effective split: **40% vapor void / 45% Si₃N₄ ceramic-wick/liner solid / 15% ethanol-water charge**|
|**Field Isolation / Trace Hull**|NiZn ferrite-loaded polyimide ceramic composite with steel-capped copper traces|Suppresses magnetic cross-talk between adjacent cell coils while carrying isolated pulse-power traces to each coil|**~100 cm³/brick**, approx. **99:1 composite:trace-metal by volume**|**~384 g/brick** using **70:30 NiZn ferrite**:polyimide composite and **90:10 copper:steel trace metal** by volume|
|**Thermal Ceramic Bonding / Interface Media**|Two-stage ceramic bonding set: primary high-temperature ceramic interface bond + secondary lower-temperature capillary fill / wick-anchor media, approx. **1:1 by volume**|Bonds CVD SiC cell shells, Al₂O₃–mullite Ox/Ox CMC carrier geometry, silicon-nitride channel liners, and ceramic wick contact surfaces while preserving alignment during laminated assembly|**~50 cm³/brick**, approx. **25 cm³ primary bond / 25 cm³ capillary fill**|**~128 g/brick** using **2.55 g/cm³** first-pass glass-ceramic / polymer-derived ceramic density|

## 2.3 Procurement Notes

- The procurement-relevant non-active-component buffer is currently **570 cm³/brick**, or **19% of brick volume**.
    
- Of that, **~540 cm³/brick** is assigned to repeated internal service/support structure.
    
- The remaining **~30 cm³/brick** is intentionally left unassigned for global brick-level margins.
    
- Do not calculate procurement from the earlier **10% / 300 cm³** placeholder. That value has been superseded by the rib-aware operation-cell model.
    
- **Unit lading mass:** **2.407 kg per completed Casimir Brick cassette**  
    **Standard Terran gravity check-weight:** **23.6 N per cassette at 1 gₜ**  
    Excludes piston hardware, ringframe plumbing, installation fixtures, and unassigned margin stock.
    

## 3. Piston / Actuator Lading

Piston and actuator parts are calculated separately from the active-cell cassette. They move, constrain, or service the brick body as a macroscopic assembly and should not be counted inside the **0.25 cm³/cell** active-cell allowance.

|Part|Material Choice|Function|Volume Allowance|Mass Allowance|
|---|---|---|--:|---|
|**Piston / Pushrod**|Beta titanium hollow guided actuator tube with HfC or ceramic thermal-barrier hardface|Transfers radial stroke force while remaining thermally buffered from corridor-facing brick surfaces|**~1,885 cm³/unit** from **65 mm OD × 55 mm ID × 2 m length**|**~8.76 kg/unit** using **4.65 g/cm³** beta-titanium density; hardface mass negligible at first pass|
|**Sacrificial Guidance / Glide Pipe**|Replaceable polished-alumina guide sleeve with DLC hardface and graphitic carbon dry-film lubricant|Provides a firm low-friction glide bore for high-cycle piston travel; treated as a wear/replacement component rather than a permanent precision guide|**~1,301 cm³/unit** from **72 mm OD × 66 mm ID × 2 m length**|**~5.14 kg/unit** using **3.95 g/cm³** polished alumina density; lubricant/coating mass negligible at first pass|
|**Piston Guidance Elements**|Ceramic rolling elements or flexure-based guides|Maintains piston alignment and prevents side-loading; separate from the sacrificial glide pipe|Pending guide layout|Pending moving/fixed split|
|**Piston Wear Surfaces**|DLC hardface coatings|Reduces wear where contact cannot be avoided|Surface treatment only|Usually negligible at first pass; track as coating/process stock|
|**Piston Dry Lubricants**|Graphitic carbon dry-film lubricant, with optional h-BN / MoS₂ / WS₂ additive stock|Vacuum-compatible low-friction interface; graphitic carbon is the bulk-accessible consumable baseline|Surface treatment only|Usually negligible at first pass; track as consumable wear stock|
|**Piston Mount / Load Shoe**|Annealed-copper compliant backplate with beta-titanium quad-lug clevis saddle and captive beta-titanium lock pin|Transfers force into the brick carrier without point-loading brittle internal cell cassettes; permits controlled piston articulation by mechanical capture rather than chemical bonding|**~660 cm³/unit** from **95 mm × 290 mm × 20 mm** copper backplate plus beta-titanium quad-lug clevis and 20 mm lock pin|**~5.44 kg/unit** using **~551 cm³ annealed copper** at 8.96 g/cm³ and **~107 cm³ beta titanium** at 4.65 g/cm³|
|**Return / Recovery Assembly**|Regenerative segmented linear electromagnetic actuator|Recovers or damps stroke energy during re-extension/deceleration|Pending stator/armature geometry|Pending moving-armature and fixed-stator split|

## 3.1 Piston Packaging Constraints

- **Maximum station envelope:** piston/actuator hardware must remain within the **300 mm circumferential brick width** and may not intrude into the **50 mm inter-brick service gap** at full inward extension.
    
- **Stroke direction:** radial.
    
- **Maximum stroke target:** not to exceed **2 m**.
    
- **Nimbus reference stroke:** **1.68 m**.
    
- **Acceleration limit:** not to exceed **10 g** relative acceleration during normal actuation.
    
- **Service doctrine:** glide pipes and lubricant films are replaceable wear stock; brick cassettes and actuator subassemblies are line-replaceable rather than internally repaired in the field.
    
- **Ring multiplication note:** piston / actuator lading values are listed **per station**. Multiply piston-structure quantities by **360** for one full ring.
    
- **Load shoe mass assumption:** ~2 cm thick annealed-copper backplate covering ~92% of brick top face, plus beta-titanium quad-lug clevis saddle and captive 20 mm lock pin; first-pass total is **~660 cm³ / ~5.44 kg per station**.