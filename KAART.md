# Kaart

Alleen de mappen die tellen. Per map: wat er hoort, en wat er niet hoort.

```
skills/        het hart. Eén map per skill, met SKILL.md als ingang.
               banner-design, brand, design, design-system, slides, turbo,
               ui-check, ui-styling, ui-ux-pro-max. Data zit in data/ of *.csv.
agents/        de agent-definities: wie doet wat, met welk model.
docs/          hoe we werken: ORKESTRATIE, REVIEW-PROTOCOL, AGENT-GUARDRAILS,
               KRITISCH-MEEDENKEN, EFFICIENCY-EN-KOSTEN-POLICY, AGENTS-OVERZICHT.
licenses/      licenties van meegeleverde fonts en data. Niet aanpassen.
standaarden/   kopie uit operator. Wijzig in operator en sync.
```

Meerdere bestandsnamen komen vaker voor (`SKILL.md`, `search.py`, `core.py`). Dat is
geen duplicatie maar de opzet: elke skill is zelfstandig.

## Waar je iets vindt
| Ik zoek | Kijk in |
|---|---|
| Wat een skill doet | `skills/<naam>/SKILL.md` |
| Welke agents er zijn | `agents/`, samengevat in `docs/AGENTS-OVERZICHT.md` |
| Hoe agents samenwerken | `docs/ORKESTRATIE.md` |
| Hoe we reviewen | `docs/REVIEW-PROTOCOL.md` |
| Wat een agent niet mag | `docs/AGENT-GUARDRAILS.md` |
| Kleuren, fonts, stijlen | `skills/ui-ux-pro-max/data/`, grep die CSV's |
