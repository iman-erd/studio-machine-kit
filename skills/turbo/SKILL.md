---
name: turbo
description: Draai een parallelle Kwaliteitsraad-audit over de huidige code. Zet meerdere read-only specialist-agents tegelijk op de wijziging, synthetiseer de bevindingen, en pas ALLEEN de veilige, build-verifieerbare fixes toe. Gebruik dit voor een snelle, brede audit van net gebouwde of gewijzigde code — niet om te bouwen. Diepe/DB-afhankelijke bevindingen gaan naar de backlog, niet blind gefixt.
---

# Turbo — parallelle audit

Dit is de "Aanpak (turbo)": veel ogen tegelijk op de code, één keer, dan alleen de zekere fixes. De winst zit in **parallel** (alle agents in één beurt) en in **discipline** (alleen toepassen wat je zonder runtime kunt verifiëren).

**Kernregel: read-only agents vinden, jij fixt.** De specialist-agents lezen en rapporteren; zij wijzigen niets. Jij synthetiseert en past alleen de veilige fixes toe. Zo blijft het snel en omkeerbaar.

## Stap 1 — Scope bepalen
Bepaal wat geauditeerd wordt, in deze volgorde:
1. Ongecommitte wijziging of huidige branch-diff (`git diff`, `git status`) als die er is.
2. Anders: het gebied dat de gebruiker noemt (map, feature, module).
3. Kon je de scope niet afleiden? Vraag het, ga niet de hele repo blind auditen.

Vat de scope in één zin samen vóór je agents start, zodat elke agent hetzelfde gebied bekijkt.

## Stap 2 — Panel kiezen en parallel starten
Kies 3–6 read-only specialisten die bij de scope passen. **Start ze in één bericht** (meerdere Agent-tool-aanroepen tegelijk) zodat ze echt parallel draaien. Gebruik de studio-agents als ze beschikbaar zijn (`subagent_type`); val anders terug op `Explore`/`general-purpose` met een rol in de prompt.

Standaard panel (pas aan op de scope):
- **code-reviewer** — correctheid, edge cases, foutafhandeling in de gewijzigde code
- **security-auditor** — auth, secrets, injectie, timing, toegangscontrole op geraakte routes
- **compliance-privacy** — PII, dataretentie, consent op ingestie/opslag (alleen als er data door gaat)
- **backend-engineer** — handlers, queue/worker, contracten tussen modules
- **performance-auditor** — hot paths, N+1, onnodig werk (alleen bij runtime-gevoelige code)
- **frontend-engineer / design-critic / qa-tester** — bij UI-wijzigingen

Geef elke agent dezelfde scope-zin + deze opdracht: **read-only, niets wijzigen; rapporteer bevindingen met bestand:regel, ernst (blokkerend/hoog/midden/laag), en of de fix veilig-zonder-runtime is of runtime/DB-verificatie vereist.**

### Model-zuinigheid (verplicht — huisregel)
Volgens `EFFICIENCY-EN-KOSTEN-POLICY.md §2`: routine- en bulkwerk op een goedkoper model, zwaar redeneerwerk alleen waar nodig. Kies het model per taak, niet één zwaar model voor alles:

- **Haiku** — mechanisch, breed scanwerk: vindplaatsen zoeken, patronen aftikken, checklist-audits, stijl/lint. De studio-agents die hier op staan (code-reviewer, performance-auditor, qa-tester, conversion-auditor, analytics-engineer…) dragen dit al in hun eigen `model:`-tier; laat die staan.
- **Sonnet** — redeneerwerk van gemiddelde diepte: contracten tussen modules, backend-logica, compliance/PII-afweging, design-kritiek. Zo staan backend-engineer, compliance-privacy, data-security e.a. al ingesteld.
- **Opus** — alleen de scherpste rand: security-audit met echte aanvalsredenatie (security-auditor staat op opus) en de **synthesestap** (stap 3) als de bevindingen tegenstrijdig of subtiel zijn. Is de synthese simpel ontdubbelen, doe het dan zelf zonder opus-agent.

Spawn je een **generieke** fallback (`Explore`/`general-purpose`) omdat een specialist ontbreekt, geef dan expliciet een model mee: `model: haiku` voor mechanisch zoekwerk, `model: sonnet` voor licht redeneerwerk. Laat een generieke agent nooit default op het zwaarste model draaien voor werk dat het niet nodig heeft.

Vuistregel: één opus-rol per audit (security of synthese), de rest sonnet/haiku. Meer opus dan dat is bijna altijd verspilling.

## Stap 3 — Synthetiseren
Voeg de rapporten samen tot één lijst. Ontdubbel (meerdere agents vinden vaak hetzelfde). Splits in twee bakken:
- **Veilig toe te passen** — statisch te verifiëren, geen datamodel/migratie/onomkeerbare actie nodig.
- **Backlog** — diep, DB-afhankelijk, of onomkeerbaar. Deze fix je later mét de migraties/runtime, niet blind nu.

## Stap 4 — Alleen veilige fixes toepassen, dan verifiëren
Pas alleen de "veilig"-bak toe. Daarna een verifieerpoort:
- Zoek het projectcommando: `npm run verify` → `npm test`/`npm run build`/`npm run lint`, of het equivalent uit `package.json`/`Makefile`/CI.
- Draai het. Groen = klaar. Rood = terugdraaien of repareren tot groen; lever nooit een rode build op.
- Raakte je previewbare code, verifieer dan ook echt gedrag (zie de `verify`-skill), niet alleen de typecheck.

## Stap 5 — Opleveren
Kort en eerlijk:
```
### Turbo-audit
- Scope: <één zin>
- Panel: <agents die draaiden>
- Toegepast (build groen): <lijst met bestand:regel>
- Backlog (niet blind gefixt): <lijst met reden per punt>
- Kritisch: <het scherpste onopgeloste punt, met bewijs>
```

## Grenzen
- **Nooit** onomkeerbare acties autonoom: datamodel-wijzigingen, migraties, publieke URL's, publicaties. Die gaan naar de backlog of vragen expliciete toestemming.
- Convoceer niet elke agent "voor de zekerheid" — meer agents dan de scope rechtvaardigt is verspilling. 3–6 gericht is beter dan 12 breed.
- Dit is een audit-skill. Wil je bouwen, gebruik de orchestrator/bouw-agents, niet turbo.
