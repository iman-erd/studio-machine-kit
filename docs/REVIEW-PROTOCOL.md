# Review-protocol — hoe de Kwaliteitsraad test & verbetert

*Het draaiboek voor een reviewronde: hoe de onafhankelijke reviewers/auditors het werk auditen, scoren en verbeteren. Gebaseerd op een bewezen opzet en veralgemeniseerd voor elk project. Aanvulling op `ORKESTRATIE.md §6/§6b`.*

> **Wanneer draait deze voltallige ronde? Alleen als poort vlak vóór een deploy** (optioneel eenmalig per milestone). NIET per bouwstap — dat kost te veel tokens. Tijdens het bouwen werkt het team lean met een korte eigen zelfcheck; alleen bij hoog risico op één punt schakelt de orkestrator gericht één reviewer in.

## Gedeelde guardrails (voor álle review-agents)
- **Verifieer, neem niets aan** — visueel én functioneel testen, niet alleen de code/HTML lezen.
- **Bron van waarheid = de afgesproken hoofd-stack en docs** (`CLAUDE.md` + de projectdocs). Uitgefaseerde of standalone varianten niet als referentie gebruiken.
- **Breek nooit de live/productie-omgeving.** Bevroren referenties blijven byte-identiek; niets aan cutover/deploy-base raken.
- **Read-mostly.** Alleen **veilige, in-scope** fixes zelf doorvoeren (kleine commits met korte melding). Riskante, onomkeerbare of onzekere zaken **flaggen voor de eigenaar**, niet gokken.
- **Niets verzinnen** — ontbrekende feiten, juridische teksten of waarden markeren, niet invullen.
- **Ethiek & merk** — geen nep-urgentie/-schaarste; test de vorm, nooit de feiten of de organische volgorde; privacy/consent respecteren.
- Elke agent levert een **gescoorde bevindingenlijst: impact × gemak**, met bewijs en een fix-voorstel (veilig-zelf / voorleggen).

## De reviewronde (orkestratie)
1. De orkestrator start de review-agents als **subagents** — **parallel** waar ze onafhankelijk zijn (read-only auditors zoals SEO, AI-search, security, accessibility lezen alleen).
2. Elke agent schrijft naar één **`docs/REVIEW-<datum>.md`**: bevindingen met bewijs, gescoord op impact × gemak, plus voorgestelde fix (veilig-zelf / voorleggen).
3. Een **lead-reviewer-synthese** (aparte pass, door de orchestrator of `continuous-improvement`) dedupliceert, lost tegenstrijdig advies op, en maakt **één geprioriteerde actielijst**. `security-auditor` en `code-reviewer` hebben **veto** op riskante wijzigingen.
4. **Veilige fixes** worden per punt doorgevoerd (kleine commits); geblokkeerde/onzekere/live-rakende punten worden **geflagd voor de eigenaar**.
5. **Herhaalbaar per milestone** (optioneel als terugkerende taak in te plannen).

## Welke agent dekt welke reviewhoek
| Reviewhoek | Studio-agent(s) |
|---|---|
| Developer / architectuur / build | `code-reviewer` (+ `qa-tester`, `performance-auditor`) |
| Data-security & privacy | `security-auditor` (+ `data-security`, `compliance-privacy`) |
| SEO | `seo-marketeer` (audit-modus) |
| AI-search / GEO | `ai-search-optimizer` |
| Marketing & attributie | `marketing` (+ `conversion-auditor`) |
| Sales / conversie | `conversion-auditor` (+ `sales`) |
| Customer care | `customer-care` |
| Customer satisfaction / CX | `customer-satisfaction` |
| Accessibility | `design-critic` (+ `compliance-privacy` voor WCAG) |
| Accounting / finance | `accounting-finance` |
| Data-analist / tracking | `data-analist` (+ `analytics-engineer`) |
| Content / brand & UX-copy | `content-editor` |
| Synthese & prioritering | `orchestrator` / `continuous-improvement` |

Read-only auditors krijgen alleen lees-/zoek-tools; agents die veilige fixes mogen doen krijgen ook `Edit`/`Write`. Elke agent blijft strikt binnen zijn eigen scope.
