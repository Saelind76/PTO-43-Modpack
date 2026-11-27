# Changelog — [PTO'43] Modpack

All notable changes to the modpack. Newest version first.
Hotfixes are cumulative: install **1.0 BETA** plus the **latest** hotfix.

## [Unreleased]

_Nothing yet._

## [1.0.1-beta] — 2026-11-26

Hotfix on top of **1.0 BETA**. Install 1.0 BETA first, then extract the hotfix over it and overwrite.

> Items marked *(needs testing)* have not been confirmed in game yet. Reports are welcome in Issues.

### Fixed — weapons
- Japanese bombs (30 / 60 / 250 / 500 kg) and the Type 91 torpedo were never registered, so no Japanese aircraft could load them.
- 30 kg and 60 kg Japanese bombs had no texture.
- Ki-61: guns now fire [PTO'43] Ho-103 and Ho-5 ammunition (was German and modern 35 mm rounds).
- F6F Hellcat: rockets, bombs and tank were attached to connectors missing from the model; stations repositioned *(needs testing)*.
- F4F Wildcat: removed the oversized belly tank (it was the Hellcat 150 gal tank).
- G4M2 Betty: tiny bombs fixed; single bomb-bay station with 4 × 250 kg and 12 × 60 kg options *(needs testing)*.

### Changed — historical armament *(needs testing)*
- **A6M3:** now armed — 2 × 7.7 mm Type 97, 2 × 20 mm Type 99, 330 L centerline tank, 30/60 kg wing bombs.
- **Ki-45 KAIc:** new 250/60 kg underwing bombs; 20 mm now uses Japanese ammunition.
- **Ki-61:** four guns (the extra pair was removed).
- **Ki-43, B6N2, G4M2:** Japanese stores only.
- **F6F:** 6 × .50 cal (was 20 mm); US stores only, German bombs and rockets removed.
- **F4F-4:** 100 lb wing bombs only.
- **SBD:** 1,000 / 500 lb centerline and 100 lb wing bombs; HVAR and GB-4 removed.
- **P-39N:** belly station only (500 / 250 lb bomb or 75 gal tank); empty stations removed.

### Fixed — ships
- USS Independence, Cleveland and Montpelier: texture names clashed between ships, which affected AA mounts and other details *(needs testing)*.
- USS Independence: added the missing ship wake file.

### Fixed — aircraft visuals
- G4M2 Betty: the procedural FBX propeller is disabled; the model's own propellers are used.

### Missions
- Updated CAF-SANDBOX quick-start mission.
- Added the `PTO'43` and `PTO'43-2` quick-start missions.

### Known issues
- G4M2 Betty propellers still look poor: the model has no propeller locators and needs a new 3D export.
- A6M3 guns have no convergence set and may show no muzzle flash.
- A6M3 and Ki-45 wing bomb positions may need adjustment.
- USS Independence AA fire and the Cleveland railings are still unconfirmed.

### Credits for this version
- Type C cargo ship, T2 Cimarron oiler, Dale tanker, Type 91 torpedo definition and Japanese bomb texture adapted from the Community PTO Pack by Mike "Pikey".

## [1.0-beta] — 2026-11-26

First public beta. [Release page](https://github.com/Saelind76/PTO-43-Modpack/releases/tag/v1.0-beta)

### Added
- **Aircraft (10):** A6M3 Model 32, Ki-43-II, Ki-61, Ki-45 KAIc, B6N, G4M2, F4F, F6F, SBD, P-39N.
- **Ships (12):** Zuikaku, Zuiho, Haruna, Kumano, Akizuki, Type C cargo; Independence, Baltimore, Cleveland class (incl. Montpelier), Cassin Young, T2 Cimarron, Dale tanker.
- Shared weapons, shells, fuze belts and sensors core.
- CAF-Sandbox quick-start mission.
