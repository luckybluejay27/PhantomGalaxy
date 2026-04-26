[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)

# Ship Treasury — ISCD Actuation Lading Register

## Scope

This register records the current first-pass lading allowances for ISCD actuation hardware. It is written for treasury, inventory, and mass-accounting use: what material classes must be held, how much mass or volume is assigned, what assembly level the allowance belongs to, and what exclusions prevent double-counting.

This is not a supplier specification or manufacturing traveler. Material selections and functions are included only where needed to justify the lading category, survivability allowance, or procurement reserve.

---

## Register Status

|Field|Entry|
|---|---|
|Revision|RevC-14|
|Status|Final Draft — Unsigned|
|Last Verified|[number] GS, [n] dGS, [n] Day|
|Verification Basis|Minimum lading truth pass for supply-chain fault checking|
|$1||

---

# Segment 0 — Official Legal Readings

```text
╔════════════════════════════════════════════════════════════════════╗
║                      TREASURY CONTROL NOTICE                      ║
╠════════════════════════════════════════════════════════════════════╣
║ THIS REGISTER IS A MINIMUM LADING TRUTH PASS.                    ║
║                                                                    ║
║ NO OFFICE, SUPPLIER, SHIPYARD, DEPOT, OR PROGRAM DESK MAY ORDER,  ║
║ SUBSTITUTE, REDUCE, RECLASSIFY, OR LOAD BELOW THESE VALUES        ║
║ WITHOUT WRITTEN TREASURY RECONCILIATION AUTHORITY.                ║
║                                                                    ║
║ ANY PROCUREMENT, INSTALLATION, OR MASS-LEDGER ENTRY BELOW THIS    ║
║ REGISTER IS TO BE TREATED AS A SUPPLY-CHAIN FAULT UNTIL CLEARED.  ║
║                                                                    ║
║ AUTHORIZATIONS ARE RECORDED AT THE BOTTOM OF THIS REGISTER.       ║
╚════════════════════════════════════════════════════════════════════╝
```

## 0.1 Minimums Use Rule

Values in this register are minimum lading baselines for one full ISCD coil structure and its scaled coil-class applications. Ordering, loading, or ledgering below these values triggers reconciliation review.

Installed lading is not procurement mass. Procurement mass may exceed installed lading due to manufacturing scrap, inspection rejection, replacement stock, process overage, reserve stock, or strategic custody requirements.

## 0.2 Operational Scope

This register defines minimum installed and carried lading values for treasury reconciliation, mass-accounting, and supply-chain fault checking. It does not authorize supplier substitution, production routing, manufacturing tolerances, or final purchase quantities.

The register is a truth-pass minimums sheet. It exists to identify ordering, loading, or ledger faults against the current accepted lading basis.

## 0.3 Authority Routing for Register Changes

|Proposed Action|Required Authority|
|---|---|
|Purchase at or above listed minimum|Program Treasury Desk|
|Purchase below listed minimum|Terran Ship Treasury Treasurer or Deputy Treasurer for Strategic Lading|
|Reduce listed mass or volume minimum|Mass Properties Comptroller + Treasury Authority|
|Substitute listed material class|ISCD Materials Ledger Officer + owning technical office|
|Change actuator or piston lading|ISCD Actuation Engineering + Actuation Lading Auditor|
|Change ringframe lading|Ringframe Structures Office + Ringframe Lading Auditor|
|Change brick cassette lading|Brick Cassette Materials Office + Brick Cassette Lading Auditor|
|Reclassify wear stock as permanent installed lading|Supply Fault Reconciliation Officer + owning technical office|
|Release controlled strategic stock|Strategic Stock Custody|
|Close a supply-chain fault against this register|Supply Fault Reconciliation Officer + Quality Ledger Witness|

---

# 1. Active Cell Lading

Packaged actuator-cell lading records the minimum material charge assigned to one repeated packaged actuator cell. Void gaps, active travel clearance, and internal vacuum space are carried as geometry rather than solid lading. DLC wear films and WS₂/MoS₂ dry lubricants are booked as surface-treatment stock unless later coating thicknesses justify a bulk-mass entry.

**Treasury working mass, dry actuator cell:** **0.1123 g/cell**, covering the sheet pair, copper sleeve coil, spacer supports, guide rails, and SiC vacuum shell. This line excludes shared brick cooling, brick carrier material, buswork, piston hardware, ringframe material, installation stock, and unassigned margin.

## 1.1 Per-Cell Lading Allowances

|Part|Material Choice|Function|Per-Cell Volume Allowance|Per-Cell Mass Allowance|
|---|---|---|---|---|
|**Complete Packaged Actuator-Cell Vacuum Envelope**|Packaged actuator-cell envelope, excluding shared brick cooling|Envelope basis for actuator sheets, coil, rails/grooves, spacers, internal vacuum gap, and outer shell|**0.25 cm³/cell**|Geometry only; solid lading is charged through listed subcomponents|
|**Actuator Sheet Pair**|Two 1 µm anisotropic diamagnetic CNT / graphene / graphite-like carbon laminates|Active boundary material charge for field-driven sheet separation|**0.0002 cm³/cell**|**0.00028 g/cell** using 1.4 g/cm³ laminate density|
|**Copper Sleeve Coil**|Copper sleeve coil around both actuator sheets|Minimum copper charge for local pulse-field generation|**0.0072 cm³/cell**|**0.0645 g/cell** from 0.0072 cm³ copper × 8.96 g/cm³|
|**Dielectric / Spacer Material**|Silicon nitride spacer supports with h-BN / ALD ceramic liner|Minimum spacer charge for separation control, leakage resistance, and thermal stability|**5.0e-7 cm³/cell**|**1.6e-6 g/cell** using 3.17 g/cm³ silicon nitride density; liner mass negligible at first pass|
|**Rails / Grooves / Local Struts**|Silicon nitride or polished alumina ceramic, DLC-coated contact faces, WS₂ dry-film lubricant with 10% procurement overage|Minimum guide/rail charge for alignment control and short prevention|**5.0e-7 cm³/cell**|**1.6e-6 g/cell** using 3.17 g/cm³ silicon nitride density; WS₂ lubricant ordered as 10% surface-treatment overage, not bulk structure|
|**Vacuum Shell / Cell Coating**|CVD SiC thin vacuum shell|Minimum SiC shell charge for sealed cell vacuum containment|**0.0148 cm³/cell**|**0.0475 g/cell** using 3.21 g/cm³ SiC density|

**Non-lading geometry note:** active motion gap is **500–1000 nm**. At max gap, the void volume is **0.0001 cm³/cell** from **1 cm² × 1000 nm**. This space is carried as envelope geometry only and is not charged as material mass.

---

# 2. Brick Cassette Lading

Brick lading covers the completed Casimir Brick cassette envelope and its shared support inventory. This level allocates room for packaged cells, SiC support geometry, wet-service chambering, wicking, manifolds, bus routing, bonding, isolation, and carrier rigidity.

Cell-level solid lading is not recounted here except through completed cassette totals. This section exists to prevent procurement from charging the same cell, carrier, cooling, or bonding volume twice.

## 2.1 Brick Operation-Cell Accounting Basis

This table defines the working geometry used to estimate brick cell count and non-cell-component lading. Values are treasury assumptions for count and reserve purposes; detailed rib, trench, channel, and manifold topology remains outside this register until finalized.

|Assumption|Working Value|Use in Math|Notes|
|---|---|---|---|
|**Brick envelope**|**0.1 m × 0.1 m × 0.3 m**|Total available brick volume|Equals **3,000 cm³**|
|**Packaged actuator-cell body**|**10 mm × 10 mm × 2.5 mm**|Actuator-cell size before service allocation|Equals **0.25 cm³/cell**|
|**Wet-service chamber height**|**0.2 mm**|Minimum chamber/trench height attached to each layer|Carries wick/vapor/service affordance|
|**Ceramic bond/interface allowance**|**0.05 mm**|Layer tolerance and bonding media allowance|First-pass value; may be refined later|
|**Minimum flush SiC band height**|**2.7 mm**|Cell height + chamber height|Before bond/interface tolerance|
|**Operation-cell vertical pitch**|**2.75 mm**|Stack layer height|Cell + chamber + bond/interface allowance|
|**Operation-cell lateral pitch, short axis**|**11.11 mm**|Fits **9 cells** across 100 mm brick width|Includes active cell plus shared SiC/service allocation|
|**Operation-cell lateral pitch, long axis**|**10 mm**|Fits **30 cells** along 300 mm brick length|Assumes long-axis service routing is shared/striped rather than per-cell added pitch|
|**Cells per layer**|**270**|9 × 30|Rib-aware layer count|
|**Stackable layers**|**36**|floor(100 mm / 2.75 mm)|Leaves about **1 mm** global stack margin|
|**Nominal actuator-cell count**|**9,720 cells/brick**|270 × 36|Current rib-aware working count|
|**Operation-cell volume equivalent**|**~0.306 cm³**|Brick envelope / nominal cell count|Includes allocated share of chambering, SiC support, bonding, routing, and tolerance|
|**Packaged-cell volume used**|**2,430 cm³**|9,720 × 0.25 cm³|Packaged actuator cells only|
|**Non-cell-component buffer, total**|**570 cm³ / 19%**|3,000 − 2,430 cm³|Total brick volume reserved for non-cell components|
|**Non-cell repeated-structure volume**|**~540 cm³ / 18%**|9,720 × (0.306 − 0.25) cm³|Allocated repeated service/support volume|
|**Remaining global margin**|**~30 cm³ / 1%**|3,000 − operation-cell volume total|Edge manifolds, end tolerance, trim, and unmodeled routing|

## 2.2 Per-Brick Non-Cell Lading Budget

These values allocate the **~540 cm³ repeated non-cell structure volume** from the operation-cell model. The separate **~30 cm³ global margin** remains unassigned for edge manifolds, end tolerance, trim, and unmodeled routing.

Dedicated thermal spreaders are not booked as a separate lading class; local heat spreading is included under the shared vapor-channel lattice.

|Part|Material Choice|Function|Per-Brick Volume Allowance|Per-Brick Mass Allowance|
|---|---|---|---|---|
|**Brick Surface / Carrier**|Alumina–mullite oxide/oxide CMC|Provides the rigid structural container for packaged actuator cells; maintains alignment and brick integrity|**~240 cm³/brick**|**~566 g/brick** using **2.36 g/cm³** first-pass Ox/Ox CMC density|
|**Shared Vapor Cooling Network**|Silicon-nitride-lined alumina–mullite CMC microchannels with ethanol–water working fluid, **3:7 ethanol**:water|Moves heat from enclosed cells to brick manifolds and ringframe cooling loops; also performs local heat-spreading through the channel lattice|**~150 cm³/brick** total cooling-network envelope|**~237 g/brick** using effective split: **40% vapor void / 45% Si₃N₄ ceramic-wick/liner solid / 15% ethanol-water charge**|
|**Field Isolation / Trace Hull**|NiZn ferrite-loaded polyimide ceramic composite with steel-capped copper traces|Suppresses magnetic cross-talk between adjacent cell coils while carrying isolated pulse-power traces to each coil|**~100 cm³/brick**, approx. **99:1 composite:trace-metal by volume**|**~384 g/brick** using **70:30 NiZn ferrite:polyimide composite** and **90:10 copper:steel trace metal by volume**|
|**Thermal Ceramic Bonding / Interface Media**|Two-stage ceramic bonding set: primary high-temperature ceramic interface bond + secondary lower-temperature capillary fill / wick-anchor media, approx. **1:1 by volume**|Bonds CVD SiC cell shells, Al₂O₃–mullite Ox/Ox CMC carrier geometry, silicon-nitride channel liners, and ceramic wick contact surfaces while preserving alignment during laminated assembly|**~50 cm³/brick**, approx. **25 cm³ primary bond / 25 cm³ capillary fill**|**~128 g/brick** using **2.55 g/cm³** first-pass glass-ceramic / polymer-derived ceramic density|

## 2.3 Treasury Notes

- The procurement-relevant non-active-component buffer is currently **570 cm³/brick**, or **19% of brick volume**.
    
- Of that, **~540 cm³/brick** is assigned to repeated internal service/support structure.
    
- The remaining **~30 cm³/brick** is intentionally left unassigned for global brick-level margins.
    
- Do not calculate procurement from the earlier **10% / 300 cm³** placeholder. That value has been superseded by the rib-aware operation-cell model.
    
- **Unit lading mass:** **2.407 kg per completed Casimir Brick cassette**  
    **Standard Terran gravity check-weight:** **23.6 N per cassette at 1 gₜ**  
    Excludes piston hardware, ringframe plumbing, installation fixtures, and unassigned margin stock.
    

---

# 3. Piston / Actuator Lading

Piston and actuator lading is booked separately from the completed actuator-cell cassette. These parts move, constrain, recover, or service the brick body as a macroscopic assembly and must not be counted inside the **0.25 cm³/cell** packaged actuator-cell allowance.

For treasury use, moving mass and fixed station hardware are deliberately separated because they feed different downstream accounts: piston-energy calculations use moving mass; ship-mass ledgers use both moving and fixed station mass.

|Part|Material Choice|Function|Volume Allowance|Mass Allowance|
|---|---|---|---|---|
|**Piston / Pushrod**|Beta titanium hollow guided actuator tube with HfC or ceramic thermal-barrier hardface|Transfers radial stroke force while remaining thermally buffered from corridor-facing brick surfaces|**~1,885 cm³/unit** from **65 mm OD × 55 mm ID × 2 m length**|**~8.76 kg/unit** using **4.65 g/cm³** beta-titanium density; hardface mass negligible at first pass|
|**Sacrificial Guidance / Glide Pipe**|Replaceable polished-alumina guide sleeve with DLC hardface and graphitic carbon dry-film lubricant|Provides a firm low-friction glide bore for high-cycle piston travel; treated as a wear/replacement component rather than a permanent precision guide|**~1,301 cm³/unit** from **72 mm OD × 66 mm ID × 2 m length**|**~5.14 kg/unit** using **3.95 g/cm³** polished alumina density; lubricant/coating mass negligible at first pass|
|**Piston Guidance Elements**|Ceramic rolling elements or flexure-based guides|Maintains piston alignment and prevents side-loading; separate from the sacrificial glide pipe|Pending guide layout|Pending moving/fixed split|
|**Piston Wear Surfaces**|DLC hardface coatings|Reduces wear where contact cannot be avoided|Surface treatment only|Usually negligible at first pass; track as coating/process stock|
|**Piston Dry Lubricants**|Graphitic carbon dry-film lubricant, with optional h-BN / MoS₂ / WS₂ additive stock|Vacuum-compatible low-friction interface; graphitic carbon is the bulk-accessible consumable baseline|Surface treatment only|Usually negligible at first pass; track as consumable wear stock|
|**Piston Mount / Load Shoe**|Annealed-copper compliant backplate with beta-titanium quad-lug clevis saddle and captive beta-titanium lock pin|Transfers force into the brick carrier without point-loading brittle internal cell cassettes; permits controlled piston articulation by mechanical capture rather than chemical bonding|**~660 cm³/unit** from **95 mm × 290 mm × 20 mm** copper backplate plus beta-titanium quad-lug clevis and 20 mm lock pin|**~5.44 kg/unit** using **~551 cm³ annealed copper** at 8.96 g/cm³ and **~107 cm³ beta titanium** at 4.65 g/cm³|
|**Return / Recovery Assembly**|Regenerative segmented tubular switched-reluctance linear motor: fixed copper/electrical-steel stator around the glide pipe, with short moving soft-magnetic armature collar on the piston tube|Drives radial stroke, brakes/retracts regeneratively, and returns recoverable kinetic/field energy to local capacitors or the power bus|**~16,500 cm³/unit actuator envelope** from **130 mm OD × 80 mm ID × 2 m length**; **~6,360 cm³/unit solid lading** including fixed stator solids plus moving armature|**~49.6 kg/unit total**, split as **~45.0 kg fixed stator** and **~4.6 kg moving armature**; only the moving armature counts toward stroke moving mass|

## 3.1 Piston Packaging and Booking Constraints

- **Maximum station envelope:** piston/actuator hardware must remain within the **300 mm circumferential brick width** and may not intrude into the **50 mm inter-brick service gap** at full inward extension.
    
- **Stroke direction:** radial.
    
- **Maximum stroke target:** not to exceed **2 m**.
    
- **Nimbus reference stroke:** **1.68 m**.
    
- **Acceleration limit:** not to exceed **10 g** relative acceleration during normal actuation.
    
- **Service doctrine:** glide pipes and lubricant films are replaceable wear stock; brick cassettes and actuator subassemblies are line-replaceable rather than internally repaired in the field.
    
- **Ring multiplication note:** piston / actuator lading values are listed **per station**. Multiply piston-structure quantities by **360** for one full ring.
    
- **RSL actuator mass split:** the regenerative segmented tubular switched-reluctance actuator is counted per station as **~49.6 kg total**, but only the **~4.6 kg moving armature** contributes to piston stroke moving mass; the **~45.0 kg stator** is fixed ringframe-side mass.
    
- **Load shoe mass assumption:** ~2 cm thick annealed-copper backplate covering ~92% of brick top face, plus beta-titanium quad-lug clevis saddle and captive 20 mm lock pin; first-pass total is **~660 cm³ / ~5.44 kg per station**.
    

---

# 4. Ring Hull / Ringframe Lading

Ring hull lading covers the fixed structural bay assigned to one active ring. The ring hull is the treasury object that carries actuator sockets, glide-pipe seats, RSL stator mounts, brick-station anchoring, and force-loop closure.

This line is not exterior hull plating and not brick cassette stock. It is the fixed ringframe allowance required to hold one ring of piston/brick stations in alignment.

|Part|Material Choice|Function|Solid-Volume Share|Volume Allowance|Mass Allowance|
|---|---|---|---|---|---|
|**Gross Ring Hull Envelope***|Titanium-cored anisotropic ceramic-composite-scute-ribbed ringframe envelope|Total geometric envelope before actuator socket voids, glide-pipe channels, RSL stator cavities, flexure relief cuts, service channels, and scute segmentation gaps|Envelope reference|**7.56 m³/ring** from 126 m circumference × 0.3 m radial tube thickness × 0.2 m axial bay thickness|Not treated as solid mass|
|**Beta-Titanium Core***|Beta-titanium interior ring bay / circumferential flexural core|Carries cyclic bending, vibration, radial flexure, and ductile force-loop continuity|**55% of solid lading**|**~1.663 m³/ring**|**~7.73 t/ring** using 4,650 kg/m³|
|**Ceramic-Composite Scutes***|Segmented SiC/SiC ceramic-composite scute ribs|Provides lateral stiffness, low-conductivity crush resistance, wear resistance, and ribbed exterior bracing|**25% of solid lading**|**~0.756 m³/ring**|**~2.27 t/ring** using 3,000 kg/m³ first-pass CMC density|
|**Silicon-Nitride Bushings***|Silicon-nitride actuator socket bushings / bearing seats|Provides ceramic-isolated glide-pipe, piston, and actuator bearing interfaces; resists socket ovalization|**10% of solid lading**|**~0.302 m³/ring**|**~0.96 t/ring** using 3,170 kg/m³|
|**Compliant Isolation Layers***|Compliant glass-ceramic / polymer-derived ceramic isolation layers|Buffers thermal-expansion mismatch, reduces electrical/thermal conduction, and prevents ceramic scute shear-off|**10% of solid lading**|**~0.302 m³/ring**|**~0.77 t/ring** using 2,550 kg/m³|
|**Total Solid Ringframe Lading***|55% beta titanium / 25% SiC-SiC CMC / 10% Si₃N₄ / 10% glass-ceramic|Estimated solid material contained inside the gross ring hull envelope at **~40% solid fraction**|**100% solid lading**|**~3.024 m³/ring**|**~11.73 t/ring**|

* Values are per single active ring. Multiply by ring count as required for multi-ring coils.

## 4.1 Ring Hull Booking Basis — Minimally Compliant Ring Profile

This profile defines the ring hull lading basis for a minimally compliant structural ring: flexible only where compliance prevents fatigue, thermal binding, or actuator misalignment, and stiff everywhere registration or compression geometry must be preserved.

- **Ringframe role:** the ring hull is the fixed actuator bay and force-loop closure structure for one active ring. It anchors the glide pipe, fixed RSL stator, piston alignment stack, and brick cassette station.
    
- **Station count:** **360 actuator stations per ring**.
    
- **Brick tangential width:** **0.3 m/station**.
    
- **Minimum circumferential inter-brick gap:** **0.05 m/station** between adjacent brick stations around the ring at maximum extension.
    
- **Circumferential station pitch:** **0.35 m/station** from 0.3 m brick width + 0.05 m minimum circumferential gap.
    
- **Derived ring circumference:** **126 m** from 360 × 0.35 m.
    
- **Derived nominal ring radius / Rmax reference:** **~20.05 m** from 126 m / 2π.
    
- **Axial bay thickness:** first-pass **~0.2 m**, equal to roughly twice the brick axial thickness.
    
- **Radial bay height / ringframe depth:** first-pass **~0.3 m** off the brick edge, before actuator envelope refinements.
    
- **Maximum stroke target:** not to exceed **2 m**.
    
- **Nimbus reference full stroke envelope:** **1.68 m**.
    
- **Brick radial thickness:** **0.1 m**.
    
- **Minimum radial clearance after brick body allowance:** **0.05 m**.
    
- **Net usable radial brick stroke:** **1.53 m**, from 1.68 m full stroke envelope − 0.1 m brick radial thickness − 0.05 m clearance.
    
- **Compliance requirement:** ringframe compliance is allowed only as controlled radial, face-to-face, and thermal breathing. It must not permit circumferential station drift, bay collapse, or actuator-axis wander.
    
- **Lateral stiffness requirement:** the ringframe must resist circumferential bending, ovalization, and station-to-station phase drift across all 360 actuator bays.
    
- **Thickness compression requirement:** the ringframe must resist through-thickness compression from piston reaction loads and preserve actuator socket geometry under cyclic loading.
    
- **Radial compliance requirement:** the ringframe may flex microscopically in the radial direction to absorb piston shock, thermal expansion mismatch, and tolerance error without cracking the ceramic-composite scute ribs.
    
- **Face-to-face compliance requirement:** the ringframe may breathe across its broad faces to avoid thermal lockup and overconstraint, but this compliance must not disturb glide-pipe, stator, or piston alignment.
    
- **Material choice:** **Beta-titanium core with segmented SiC/SiC ceramic-composite scutes, silicon-nitride bushings, and compliant glass-ceramic isolation layers**.
    
- **Material ratio, first pass by solid volume:** **55% beta-titanium core / 25% SiC-SiC ceramic-composite scutes / 10% silicon-nitride bushings / 10% compliant glass-ceramic isolation layers**.
    
- **Solid fraction, first pass:** **~40% solid lading / ~60% void, actuator socket space, channels, and flexure relief**. This is a working estimate until ring-bay cross-section and cutout geometry are finalized.
    
- **Actuator socket rule:** piston, glide pipe, and RSL stator loads must be reacted into the titanium core and circumferential stiffening path, not into the brick cassette or ceramic scutes alone.
    
- **Magnetic-path rule:** bulk ring hull material must not become an uncontrolled magnetic path. Magnetic flux-path materials belong only in separate actuator stator inserts.
    
- **Thermal/electrical isolation rule:** ceramic-composite scutes, silicon-nitride bushings, and glass-ceramic isolation layers reduce unwanted heat and electrical conduction between actuator hardware, ringframe, and brick cassette.
    
- **Service doctrine:** glide pipes, bushings, lubricant films, and actuator socket wear interfaces are replaceable wear stock; the ringframe is inspected for fatigue, scute cracking, bushing ovalization, and bond-layer shear.
    
- **Design summary:** the minimally compliant ring should behave as a titanium-cored anisotropic ceramic-composite-scute-ribbed ringframe: ductile in cyclic flexure, stiff circumferentially, crush-resistant through thickness, thermally isolated, and radially forgiving only within controlled tolerances.
    

---

# 5. Lading Totals — First-Pass Treasury Rollup

This section collects the current per-station, per-ring, moving, fixed, and full-coil lading totals using the allowances above. These are first-pass treasury totals for mass-accounting, minimum-load verification, and supply-chain fault checks. Update this rollup whenever piston, socket, bushing, ringframe, or brick-cassette assumptions change.

## 5.1 Per-Station Lading Rollup

|Component|Mass / Station|Moving or Fixed|Notes|
|---|---|---|---|
|**Completed Casimir Brick Cassette**|**2.407 kg**|Moving|Brick cassette only; excludes piston hardware and ringframe plumbing|
|**Piston / Pushrod**|**8.76 kg**|Moving|Beta-titanium hollow actuator tube|
|**Piston Mount / Load Shoe**|**5.44 kg**|Moving|Annealed-copper compliant backplate plus beta-titanium clevis/pin hardware|
|**RSL Moving Armature**|**4.6 kg**|Moving|Moving armature collar on piston tube|
|**Sacrificial Guidance / Glide Pipe**|**5.14 kg**|Fixed / replaceable wear stock|Polished-alumina guide sleeve; not counted as moving stroke mass|
|**RSL Fixed Stator**|**45.0 kg**|Fixed|Fixed copper/electrical-steel stator around glide pipe|
|**Total Moving Station Mass**|**21.207 kg/station**|Moving|Brick cassette + pushrod + load shoe + RSL moving armature|
|**Total Fixed Station Hardware**|**50.14 kg/station**|Fixed|Glide pipe + fixed RSL stator|
|**Total Station Hardware Including Brick**|**71.347 kg/station**|Mixed fixed/moving|Moving station mass + fixed station hardware|

## 5.2 Per-Ring Lading Rollup

All values below use **360 stations per active ring**.

|Component Group|Formula|Mass / Ring|Moving or Fixed|Notes|
|---|---|---|---|---|
|**Completed Casimir Brick Cassettes**|2.407 kg × 360|**0.867 t/ring**|Moving|All brick cassettes for one full ring|
|**Moving Piston / Load Hardware**|(8.76 + 5.44 + 4.6) kg × 360|**6.768 t/ring**|Moving|Pushrods + load shoes + RSL moving armatures|
|**Total Moving Station Mass**|21.207 kg × 360|**7.635 t/ring**|Moving|Brick cassettes + all moving piston hardware|
|**Fixed Station Hardware**|50.14 kg × 360|**18.050 t/ring**|Fixed|Glide pipes + fixed RSL stators|
|**Ring Hull / Ringframe Lading**|Section 4 total|**11.73 t/ring**|Fixed structure|Titanium-cored anisotropic ceramic-composite-scute-ribbed ringframe|
|**Total Fixed Ring Mass**|18.050 t + 11.73 t|**29.780 t/ring**|Fixed|Fixed station hardware + ringframe lading|
|**Total Actuated Ring Assembly Mass**|7.635 t + 29.780 t|**37.415 t/ring**|Mixed fixed/moving|Moving station mass + fixed ring mass|

## 5.3 Coil-Class Lading Multipliers

Multiply the per-ring totals by ring count for each coil class. These values include brick cassettes, piston hardware, fixed actuator hardware, and ring hull lading. They do **not** include ship spine, habitat, tanks, radiators, power plant, cargo bays, outer hull, crew systems, or non-ringframe superstructure.

|Ship / Coil|Ring Count|Moving Station Mass|Fixed Ring Mass|Total Actuated Ring Assembly Mass|
|---|---|---|---|---|
|**Nimbus**|200|**1,527 t**|**5,956 t**|**7,483 t**|
|**Zephyr**|300|**2,291 t**|**8,934 t**|**11,224 t**|
|**Stratus**|400|**3,054 t**|**11,912 t**|**14,966 t**|
|**Atlas**|600|**4,581 t**|**17,868 t**|**22,449 t**|

## 5.4 Current Ledger Notes

- **Moving mass for piston-energy calculations:** use **21.207 kg/station** or **7.635 t/ring** until piston guidance elements are resolved.
    
- **Fixed station hardware:** use **50.14 kg/station** or **18.050 t/ring** for glide pipe + fixed RSL stator.
    
- **Ring hull lading:** use **11.73 t/ring** from the current 40% solid ringframe estimate.
    
- **Total Actuated Coil Ring assembly:** use **37.415 t/ring** for first-pass ship mass budgeting.
    
- **Pending additions:** piston guidance elements, detailed actuator socket fasteners, sensor packages, coolant manifold hardlines, bus couplers, inspection ports, and installation fixtures remain unresolved.
    

---

# Authorization Register

This register is a minimums sheet for treasury reconciliation and supply-chain fault checking. Signatures below certify that the listed lading allowances are acceptable as the current minimum truth basis for detecting ordering, loading, or accounting faults.

|Authority|Position|Signature / Mark|
|---|---|---|
|Treasury Authority|Terran Ship Treasury Treasurer|[insert signature]|
|Deputy Authority|Deputy Treasurer for Strategic Lading|[insert signature]|
|Mass Ledger Review|Mass Properties Comptroller|[insert signature]|
|Materials Ledger Review|ISCD Materials Ledger Officer|[insert signature]|
|Supply Fault Review|Supply Fault Reconciliation Officer|[insert signature]|
|Ledger Witness|Quality Ledger Witness|[insert signature]|

## As Per Technical Offices

| Office                          | Verification Marker |
| ------------------------------- | ------------------- |
| ISCD Actuation Engineering      | [insert marker]     |
| Ringframe Structures Office     | [insert marker]     |
| Brick Cassette Materials Office | [insert marker]     |
| Strategic Stock Custody         | [insert marker]     |