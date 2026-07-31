Herzien: 2026-07-30

# Standaard — proces

Geldt in élk project. Dit bestand is ingevuld; de vier andere standaarden zijn stubs
die in fase 4 met verse websearch worden gevuld.

## Voordat er gebouwd wordt
1. Poort door (POORT.md). Bij taken onder tien minuten overslaan.
2. Bij taken boven het half uur: opdracht in twee regels teruggeven in eigen woorden,
   plus de belangrijkste aanname.
3. Onomkeerbare keuze? Regel in BESLISSINGEN.md, vijf regels, vóór het bouwen.

## Tijdens
4. Verkennen gaat via de subagent `verkenner`, niet in de hoofdsessie.
5. Eén sessie = één taak of één fase. Bij afronding HANDOFF.md overschrijven.
6. Instructiebestanden worden niet gewijzigd tijdens een werksessie.
7. Hele bestanden worden niet in de chat geprint. Diffs.
8. Modelkeuze: verkennen en mechanisch werk Haiku, bouwen en review Sonnet,
   structuurkeuzes Opus.

## Voor oplevering
9. Subagent `criticus` heeft gedraaid.
10. `bin/verify` is groen en de uitvoer is zichtbaar. Niet: "het zou nu moeten werken."
11. De oplevering eindigt met "Niet geverifieerd:". Leeg mag, maar expliciet.

## Altijd
12. Bewering over huidige best practice: zoeken, of labelen als aanname.
13. Geen actie die geld verplaatst, een order raakt of een klant mailt zonder dat een
    mens per geval bevestigt.
14. Geen productiedata in een sessie. Reproduceren gebeurt op fixtures.
15. Persoonsgegevens gaan niet in git. Bron naar de kluis, alleen geanonimiseerde
    kern.md in de repo.
16. Git is de waarheid. Niet gecommit werk bestaat niet.

## Vóór je op een merk, domein of platform bouwt
17. Domein: beschikbaar of op jouw naam — niet van een bureau of platform.
18. Merk: gecontroleerd in de registers en klassen van élk land waar je opereert.
    Voor ons minimaal EU (EUIPO) en Indonesië (DJKI).
19. Data en code: account op jouw naam, exporteerbaar zonder de leverancier.
20. Bouwplatform: wie is juridisch eigenaar van wat er wordt gegenereerd.

## Onderhoud van dit bestand
Maximaal 25 regels. Nieuwe regel erin betekent een oude eruit. Zie CORRECTIES.md.
