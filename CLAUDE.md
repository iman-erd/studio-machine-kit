# studio-machine-kit

## Wat dit is
Het gereedschap van de studio: agent-definities en skills die in álle Terra
Nova-projecten gebruikt worden. Ontwerp, UI-review, banners, slides, merk.
Geen productcode; dit is wat de andere repo's gebruiken om te bouwen.

## Stack
Markdown-skills met Python-hulpscripts en CSV-kennisbanken. Geen build, geen server.

## Lees dit eerst
- KAART.md — waar staat wat
- HANDOFF.md — stand van zaken
- `README.md` — wat de kit is en hoe je hem installeert
- `docs/ORKESTRATIE.md` — hoe agents samenwerken
- `../../operator/archief/INDEX.md` — welke documenten bestaan

## Harde regels
- **Skills worden op pad ingeladen.** Hernoem of verplaats geen skill-map zonder te
  controleren wat ernaar verwijst: er is geen test die dit vangt, het faalt stil.
- Elke skill heeft één `SKILL.md` als ingang. Wat daar niet in staat, wordt niet gelezen.
- De kennisbanken (CSV met kleuren, fonts, stijlen) zijn data, geen broncode. Lees ze
  met grep, niet in hun geheel.
- Deze repo staat op een persoonlijk GitHub-account, niet in de organisatie. Wie er
  eigenaar van is, is een openstaande vraag; ga er niet van uit dat het geregeld is.
- Wat hier verandert, verandert in elk project tegelijk. Wijzig dus bewust.

## Werkregels
- Bouwtaak? Eerst POORT.md, dan wachten op antwoord.
- Grep niet voordat je KAART.md hebt gelezen. Verzin geen namen; zoek ze op.
- Werk zuinig: goedkoopste model dat volstaat, regelbereiken in plaats van hele
  bestanden, en stop zodra het doel bereikt is.
- Einde sessie: HANDOFF.md overschrijven, `bin/check`, pushen.

## Wat je nooit doet
- Een skill-map hernoemen of verplaatsen.
- Bestanden verwijderen zonder opdracht. Werken op main. Meer doen dan gevraagd.
