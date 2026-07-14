---
name: ui-check
description: Review de huidige UI-wijziging op toegankelijkheid (WCAG AA) en front-end performance met de ui-ux-pro-max kennisbank. Gebruik dit bij elke wijziging aan pagina's, componenten of styling — vóór merge of deploy. Het draait de lokale zoekengine als checklist over je diff, meldt afwijkingen, en jij fixt. Read-only kennis, geen tweede design-system.
---

# UI-check — a11y + performance review

Een snelle, goedkope review die je diff toetst aan bewezen richtlijnen uit de `ui-ux-pro-max` kennisbank. **De kennisbank levert de checklist; hij herstyled niets en introduceert geen palet of tokens** — je eigen design-system blijft de bron van waarheid.

**Kernregel: de engine wijst aan, jij fixt.** Read-only kennis toegepast op jouw diff. Voer geen gegenereerde tokens of componenten in.

## Stap 1 — Scope
Pak de UI-wijziging: `git diff`/`git status`, of het gebied dat de gebruiker noemt. Alleen bestanden die UI renderen of stylen (pagina's, componenten, CSS/Tailwind). Geen UI-diff? Meld dat en stop — deze skill heeft niets te doen.

## Stap 2 — Checklist ophalen (goedkoop, mechanisch)
Draai de lokale engine (pure Python 3, geen netwerk, geen kosten). Dit is mechanisch scanwerk — hoort op **Haiku** als je het aan een agent delegeert.

```bash
E=~/.claude/skills/ui-ux-pro-max/scripts/search.py
# Toegankelijkheid (WCAG AA — huisregel)
python3 "$E" "accessibility contrast focus keyboard aria heading" --domain ux -n 8
# Front-end performance (pas de stack aan: nextjs | react | astro | vue | svelte | html-tailwind ...)
python3 "$E" "server component caching image font bundle waterfall" --stack nextjs -n 8
# React/Next-specifieke performance-patronen
python3 "$E" "rerender memo dynamic import parallel fetch" --domain react -n 6
# Alleen bij datavisualisatie:
python3 "$E" "chart accessibility color fallback" --domain chart -n 4
# Alleen bij iconen: levert SVG-import-code (ondersteunt de geen-emoji-regel):
python3 "$E" "<beschrijving van het icoon>" --domain icons -n 3
```

Kies alleen de blokken die bij de diff passen; draai niet alles voor de zekerheid.

## Stap 3 — Diff toetsen
Loop de opgehaalde Do/Don't-regels langs de gewijzigde code. Let vooral op de punten die met de huisregels samenvallen:
- **WCAG AA:** contrast ≥ 4.5:1, zichtbare focus-states (nooit `outline:none` zonder vervanging), niet-alleen-kleur, correcte heading-hiërarchie, aria-labels op icon-only knoppen, tap-targets ≥ 44px.
- **Next.js/RSC-performance:** `next/image` met width/height + priority op LCP, `next/font` (variable), Server Components by default, expliciete caching, geen fetch-waterfalls (`Promise.all`/Suspense), dynamische imports voor zware client-bundles, Server-Action-input gevalideerd.
- **Charts (score-engine-UI):** kleur nooit als enige drager, verplichte tabel-fallback, geen pie-overuse.
- **Geen emoji als icoon:** gebruik SVG-iconen (import-code uit `--domain icons`).

## Stap 4 — Rapporteren, jij fixt
```
### UI-check
- Scope: <bestanden>
- A11y-bevindingen: <regel → bestand:regel, of "geen">
- Performance-bevindingen: <regel → bestand:regel, of "geen">
- Voorstel: <alleen veilige, in-diff fixes; geen nieuw palet/tokens/componentsysteem>
```
Pas alleen fixes toe die binnen je bestaande design-system passen. Alles wat een tweede visueel systeem, shadcn-installatie of gegenereerde tokens zou invoeren: **niet doen** — dat botst met de export.

## Grenzen
- Geen tweede design-system: negeer de `--design-system` generator en de kleur/font-databases; die overschrijven je gelockte tokens.
- Delen van de kennisbank zijn voor native app-UI (iOS/Android/Flutter); pak alleen wat op web van toepassing is.
- Dit is een review-skill. Bouwen doe je met de bouw-agents; publiceren gaat via `deploy-poort`.
