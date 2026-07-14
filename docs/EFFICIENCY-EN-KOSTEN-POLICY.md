# Efficiency- & kosten-policy

*De volledige checklist voor de `efficiency-guardian`. Doel: dezelfde voortgang, veel lagere kosten op drie fronten — deploys, LLM-tokens (Claude Code) en externe API-credits. Aanleiding: verspilling doordat elke wijziging werd gedeployd.*

## 1. Deploy-efficiëntie
- **Lokaal-eerst:** `npm run dev` en `npm run build` lokaal; deploy pas als een batch af én gereviewd is.
- **Niet per commit/wijziging deployen.** Deploy per **milestone/goedgekeurde batch**, één keer.
- **Docs-only = geen build:** path-filtering of een `ignoreCommand` (Vercel: "Ignored Build Step") zodat README/comment/doc-wijzigingen geen productiebuild starten.
- **Preview-deploys bewust:** niet elke branch/PR automatisch; alleen waar visuele review nodig is.
- **CI zuinig:** dependency-caching, `concurrency` met cancel-in-progress (oude runs afbreken), geen overlappende/dubbele workflows, alleen bouwen wat veranderde (turbo/affected).
- **Atomi=c & omkeerbaar:** één deploy per reviewbatch; instant rollback beschikbaar.

## 2. Claude Code / LLM-tokens
- **Gerichte context:** `Grep`/`Glob` en deel-reads i.p.v. hele bestanden; herlees niets wat al bekend is; plak geen grote bestanden onnodig in.
- **Batch je edits**, houd scope klein, en gebruik **subagents** voor groot fan-out/zoekwerk (isoleert context, houdt de hoofdsessie licht).
- **Plan → uitvoeren:** eerst een kort plan, dan bouwen; geen speculatieve rebuilds of eindeloze her-verificatie; **stop-on-green**.
- **Sessiehygiëne:** `/clear` tussen losse taken, vaak committen (zodat context niet opnieuw opgebouwd hoeft), en routine-/bulkwerk op een goedkoper model; zwaar redeneerwerk alleen waar nodig.
- **Vermijd loops:** herhaal geen mislukte aanpak; bij een blokker: stoppen en voorleggen i.p.v. blijven proberen.

## 3. Externe API-credits (Google Places/Maps, SerpAPI, GBP, AI, e-mail, enz.)
- **Goedkoopste bron eerst + getierd** (light → standard → deep → premium): dure bronnen alleen voor topkandidaten/te publiceren items.
- **Cache met TTL + deduplicatie:** persistente cache; nooit dezelfde call twee keer; hergebruik resultaten tussen runs.
- **Mocks/fixtures in dev & test:** geen echte betaalde calls in ontwikkel-, test- of CI-loops.
- **Budget + kill-switch:** harde dag-/maandlimiet per bron; automatische stop bij overschrijding; alert naar de cockpit.
- **Zuinige calls:** alleen benodigde velden opvragen, batch-endpoints gebruiken, rate-limits respecteren, retries met backoff (geen hamering).
- **Sleutels & omgevingen gescheiden:** dev-keys met lage limieten ≠ prod-keys; nooit prod-credits in een testloop.
- **Meten:** log elke betaalde call met kosten (kostenmeter), zodat cost-per-actie zichtbaar is.

## 4. Beslisprotocol van de guardian
Bij elke voorgestelde deploy of dure operatie: **ga / batch / stel uit / blokkeer** + reden + goedkopere route. Bij twijfel de goedkoopste omkeerbare optie kiezen en voorleggen. Wekelijkse kostenrapportage (deploy/tokens/API) naar de `intranet-cockpit`; budgetten samen met `accounting-finance`.
