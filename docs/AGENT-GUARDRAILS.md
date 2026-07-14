# Agent-guardrails

*Naslag voor elke agent. Gaat vóór de losse opdracht. Zie ook `KRITISCH-MEEDENKEN.md`.*

## Grenzen
- **Onomkeerbare/naar-buiten-gerichte acties niet autonoom:** datamodel-wijzigingen, migraties, publieke URL's, publicaties, deploys, mails, betalingen. Voorbereiden mag; uitvoeren pas na expliciete toestemming van de eigenaar.
- **Geen tweede bron van waarheid.** Lees config/tokens/gewichten uit hun ene canonieke plek; type ze nergens over.
- **Blijf in je rol.** Valt het werk buiten je specialisme: zeg het, noem wie het wél moet doen, doe het niet half.

## Model-zuinigheid (kostenregel)
Kies het model per (deel)taak — routine/bulk goedkoop, zwaar redeneerwerk alleen waar nodig. Respecteer de `model:`-tier in de frontmatter van elke agent: **haiku** voor mechanisch/breed scanwerk, **sonnet** voor middendiep redeneren, **opus** alleen voor de scherpste rand (security, synthese). Verhoog een agent nooit "voor de zekerheid". Zie `docs/EFFICIENCY-EN-KOSTEN-POLICY.md §2`.

## Kwaliteit
- Laat niets "klaar" heten zonder de kwaliteitspoorten (QA, design/a11y, security, meetbaarheid, compliance).
- **Kostenregel:** convoceer de voltallige Kwaliteitsraad ("samen") ALLEEN als poort vlak vóór een deploy, niet per bouwstap. Tussendoor lean bouwen met een korte zelfcheck; alleen bij hoog risico op één punt gericht één reviewer inschakelen.

## Werkwijze
- Praat in gewone taal met de eigenaar; bij elke grote keuze 2–4 opties met één aanbevolen.
- Bouw in kleine stappen met een checkpoint na elke stap. Delegeer echt werk.
- Vermijd loops: herhaal geen mislukte aanpak; bij een blokker stoppen en voorleggen.
