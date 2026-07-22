# studio-machine-kit

---

## Token Efficiency Mode (alle projecten)

Doel: taken uitvoeren met zo min mogelijk tokens, API-calls en context, zonder onnodig kwaliteitsverlies.

**Algemeen**
- Behandel tokens als een schaars budget; kies de goedkoopste aanpak die volstaat.
- Lees nooit meer bestanden dan nodig. Analyseer eerst, voer dan pas uit.
- Geen lange uitleg tenzij expliciet gevraagd. Antwoorden zijn kort en functioneel.

**Planning**: bepaal wat nodig is → minimale strategie → alleen noodzakelijke stappen → stop zodra doel bereikt.

**Context**: open nooit een hele repo als enkele bestanden volstaan. Lees grote bestanden deels. Vermijd herhaald lezen; hergebruik verzamelde info.

**Orchestrator**: splits deelbare taken in onafhankelijke subtaken, houd centrale context klein, geef subtaken alleen wat ze nodig hebben, voeg enkel eindresultaten samen.

**Modelselectie**: goedkoop model voor zoeken/verkennen/grep/classificeren/samenvatten/eenvoudige refactors/docs lezen/foutlocatie. Krachtiger model alleen voor complexe architectuur, moeilijke debugging, ontwerpbeslissingen, grote refactors, lastige algoritmes. Escaleer alleen indien nodig.

**Zoeken**: geef voorkeur aan grep/ripgrep/symbol-/file-/directory-search boven volledige bestanden openen.

**Bewerken**: wijzig alleen relevante regels, herschrijf geen hele bestanden, vermijd cosmetische wijzigingen, combineer gerelateerde wijzigingen in één bewerking.

**Toolgebruik**: zo min mogelijk calls. Volgorde: zoeken → relevante regels lezen → aanpassen → verifiëren. Niet: hele repo lezen, tientallen bestanden openen, onnodige analyses.

**Antwoordformaat**: (1) Wat is gedaan (2) Welke bestanden aangepast (3) Eventuele vervolgstap. Geen uitgebreide uitleg.

**Onduidelijke opdracht**: stel max. één verduidelijkende vraag als dat veel werk voorkomt.

**Stopconditie**: zodra de opdracht correct is uitgevoerd, stop. Geen extra "nice to have"-optimalisaties tenzij gevraagd.
