# Studio Machine Kit

Een kant-en-klaar Claude Code-team: **34 specialist-agents** met slimme model-tiering, plus review- en design-skills. Installeer één keer globaal en gebruik ze in elke repo.

## Wat zit erin

**Agents (`agents/`, 34)** — een complete studio met `orchestrator` als spil (product, engineering, data, growth, customer, finance, trust, en een Kwaliteitsraad). Elke agent draait op het juiste model: **haiku** voor mechanisch/bulkwerk, **sonnet** voor middendiep redeneren, **opus** alleen voor de scherpste rand (security + synthese). Zo betaal je niet voor zwaar rekenwerk waar het niet nodig is.

**Skills (`skills/`)**
- **`/turbo`** — parallelle audit: zet meerdere read-only specialisten tegelijk op je diff, synthetiseert, en past alleen de veilige, build-verifieerbare fixes toe.
- **`/ui-check`** — toegankelijkheid (WCAG AA) + front-end performance review over je UI-diff, aangedreven door de ui-ux-pro-max kennisbank.
- **`ui-ux-pro-max`** + `design`, `design-system`, `ui-styling`, `banner-design`, `brand`, `slides` — design-intelligentie met een lokale zoekengine (50+ stijlen, 160+ kleurpaletten, font-pairings, chart-types, UX-richtlijnen, per stack).

**Docs (`docs/`)** — optionele studio-context: guardrails, kritisch-meedenken-protocol, orkestratie, review-protocol en de efficiency/kosten-policy waar de model-tiering op leunt.

## Installeren

**In Claude Code — plak dit 1:1:**

> Clone `https://github.com/iman-erd/studio-machine-kit` naar een tijdelijke map en voer `install.sh` uit om de studio-agents en skills in mijn `~/.claude` te zetten. Bevestig daarna dat de skills `/turbo` en `/ui-check` beschikbaar zijn en dat de ui-ux-pro-max zoekengine draait met `python3 ~/.claude/skills/ui-ux-pro-max/scripts/search.py "accessibility" --domain ux -n 1`. Vat kort samen wat er geïnstalleerd is.

**Of handmatig in een terminal:**

```bash
git clone https://github.com/iman-erd/studio-machine-kit studio-machine-kit
cd studio-machine-kit
bash install.sh
```

De installer kopieert `agents/` en `skills/` naar `~/.claude/`. Bestaande bestanden met dezelfde naam worden overschreven met de kit-versie. Herhalen kan zonder problemen (idempotent).

## Vereisten
- **Claude Code** (agents en skills worden automatisch uit `~/.claude/` geladen).
- **Python 3** (stdlib, geen dependencies) voor de ui-ux-pro-max zoekengine en `/ui-check`.
- De `design`/`banner-design`/`brand`-skills kunnen een Google Gemini API-key vragen voor AI-beeldgeneratie (logo's, banners, iconen). Zonder key werken de andere skills gewoon.

## Model-tiering aanpassen
Elke agent heeft een `model:`-regel in zijn frontmatter (`agents/<naam>.md`). Wil je een rol zwaarder of lichter, wijzig die regel. Vuistregel: hooguit één opus-rol tegelijk, de rest sonnet/haiku.

## Licenties / herkomst
De `ui-ux-pro-max`-set is afkomstig van het gelijknamige open-source project (MIT, © Next Level Builder); `ui-styling` is Apache 2.0. De originele licenties staan in `licenses/`. De agents, `/turbo` en `/ui-check` zijn eigen werk, vrij te gebruiken en aan te passen.
