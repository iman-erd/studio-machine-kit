# Orkestratie — hoe het studio-team samenwerkt

*Het besturingsmodel: hoe de orkestrator werk verdeelt over specialist-agents, wat parallel mag en wat op elkaar wacht, en hoe alles samenhangend en veilig blijft. Voor Claude Code als het als studio draait.*

---

## 1. Rollen & organogram

- **Orkestrator** (jij, main-sessie): algemeen directeur + projectleider. Maakt het plan, verdeelt werk, bewaakt afhankelijkheden, kwaliteit en planning, en houdt de eigenaar in de lus met keuzes en checkpoints. Onderhoudt de levende documenten.
- **Afdelingshoofden = de agents in `.claude/agents/`.** Elk heeft een specialisme en mag zijn taak verder opknippen (fan-out) in deeltaken. Zie `AGENTS-OVERZICHT.md`.

Afdelingen: Product & Design · Engineering · Data & Integraties · Growth & Commerce · Customer · Finance & Ops · Trust & Platform · **Kwaliteitsraad** (test & verbeteren). Zie `AGENTS-OVERZICHT.md`.

Twee lagen: **Bouwers** maken het werk; de **Kwaliteitsraad** (onafhankelijke reviewers/auditors) test en verbetert het. Een reviewer beoordeelt nooit zijn eigen werk.

---

## 2. Hoe je agents inzet in Claude Code

- De bestanden in `.claude/agents/*.md` worden automatisch herkend als **subagents**. De orkestrator delegeert een taak aan een agent (via de Task/subagent-functie); typ `/agents` om ze te bekijken/beheren.
- **Parallel:** start meerdere subagents in één keer voor onafhankelijk werk (bv. designer + data-architect + SEO tegelijk).
- **Sequentieel:** laat afhankelijk werk wachten op de output ervoor (bv. eerst design system, dan frontend-build).
- Elke agent leest de gedeelde documenten als **enige bron van waarheid** en schrijft zijn resultaat terug daarin. Geen kennis in iemands hoofd; alles in de docs.

---

## 3. Afhankelijkheden: wat wacht op wat

```
Fase 0 Strategie ─┬─> Fase 1 Tone of voice ─┐
                  └─> Fase 2 IA & flows ─────┼─> Fase 3 Design system ─> Fase 5 Kernbouw
                                             │
Cross-cutting (starten vroeg, lopen door):   ├─ Data & datamodel (Fase 4)
  - Analytics/meetplan                       ├─ Integraties (meet + betaal + comms)
  - Meertaligheid/i18n                       ├─ Security & compliance
  - SEO-fundament                            └─ Intranet/cockpit (vanaf Fase 0 meegroeien)
Fase 6 Conversie ─> Fase 7 Verdienmodel ─> Fase 8 Dashboards ─> Fase 9 Schaal/veiligheid ─> Fase 10 Launch
```

Vuistregel: **strategie → structuur → design → bouw** is de ruggengraat; **meten, integraties, i18n, security, toegankelijkheid en de cockpit** lopen er als vaste dwarsstromen naast en worden nooit "later" gedaan.

---

## 4. Parallelle werkstromen (voorbeeld sprint)

Zodra strategie en IA staan, kan dit tegelijk lopen:
- **Design-system-engineer**: tokens + kerncomponenten.
- **Data-architect**: datamodel + migraties (markt/taal-aware).
- **Integrations-engineer**: meet-/analytics-stack + consent klaarzetten (`referentie/02`).
- **SEO-marketeer**: URL-structuur, structured data, sitemap-plan.
- **Copywriter**: tone of voice + eerste UI-teksten.

De orkestrator voegt de resultaten samen en houdt één checkpoint met de eigenaar.

---

## 5. Handoff- & standup-protocol

- Elke agent levert: **wat gemaakt**, **welke docs bijgewerkt**, **wat de volgende agent nodig heeft**, en **open vragen/risico's**.
- De orkestrator schrijft na elke stap een korte update in `HANDOFF.md` (stand + volgende stap) en belangrijke keuzes in `DECISIONS.md` (met reden).
- Bij tegenstrijdige adviezen tussen agents beslist de orkestrator, legt de afweging vast, en escaleert alleen echte eigenaar-keuzes naar de founder.

---

## 6. Kwaliteitspoorten (definition of done)

Iets is pas "klaar" na sign-off van de relevante bewakers:
- **QA-tester**: werkt, edge-cases, cross-device.
- **Design-system-engineer / accessibility**: consistent + WCAG AA.
- **DevOps-security**: security-scan groen, geen secrets/lekken.
- **Analytics-engineer**: events staan erop (meetbaar).
- **Compliance-privacy**: consent/AVG in orde waar data speelt.
- **Efficiency-guardian**: geen deploy of dure operatie (API-calls/builds) zonder groen licht — batchen, uitstellen of blokkeren wat verspilt.

Deze poorten worden **gebundeld gecontroleerd bij de deploy-poort** (§6b), niet per tussenstap — dat spaart tokens. Geen enkele feature gaat live zonder de poort. De orkestrator bewaakt hem.

### 6b. Lean bouwen; de voltallige studio draait ALLEEN als deploy-poort
**Kostenregel (non-negotiable): de voltallige Kwaliteitsraad ("samen") wordt uitsluitend geconvoceerd als poort vlak vóór een deploy. Daarbuiten nooit.** Het hele team per bouwstap laten reviewen kost te veel tokens.

Standaard tijdens het bouwen (geen council):
1. **Bouwen** — de vak-agent levert het werk + update de docs, met een **korte eigen zelfcheck** (build draait, geen kapotte links/imports, non-negotiables gerespecteerd).
2. **Gericht, alleen bij hoog risico op één punt** — schakelt de orkestrator één relevante reviewer in (bv. alleen `security-auditor` bij iets gevoeligs), nooit het hele team.

**De deploy-poort** (vlak vóór elke deploy) is het enige moment dat de Kwaliteitsraad voltallig en parallel draait volgens `REVIEW-PROTOCOL.md`: één `docs/REVIEW-<datum>.md`, gescoorde bevindingen (impact × gemak), lead-synthese met veto, veilige fixes vs flaggen. Pas na een groene poort + akkoord van de eigenaar volgt de deploy (efficiency-guardian: deployen alleen per goedgekeurde milestone).

`continuous-improvement` draait hooguit **periodiek of na een milestone**, niet per stap. Ingrijpende wijzigingen pas na akkoord van de eigenaar.

---

## 7. Checkpoints met de eigenaar

Na elke fase (en bij elke grote keuze) pauzeert de orkestrator: laat in gewone taal zien wat er is, geef een aanbeveling, en vraag akkoord. Bouw nooit een hele fase door zonder tussentijdse bevestiging. De eigenaar hoeft niets technisch te doen; alleen keuzes goedkeuren.

---

## 8. Kostenbewust & veilig

Zwaar of duur werk (grote research, AI-analyse, externe API's) alleen waar het waarde toevoegt en binnen budget. Riskante of onomkeerbare acties (data verwijderen, betalingen, publiceren, rechten wijzigen) voert het team niet autonoom uit: het bereidt ze voor en vraagt expliciet akkoord.
