# Agents-overzicht (het organogram)

*De specialist-agents in `.claude/agents/`. Elk is een afdelingshoofd dat zijn taak verder mag opsplitsen (fan-out). De orkestrator verdeelt, laat ze parallel of sequentieel werken, en bewaakt kwaliteit. Twee lagen: **Bouwers** (maken het werk) en de **Kwaliteitsraad** (testen en verbeteren het werk).*

## Leiding
- `orchestrator` — algemeen directeur/projectleider: plant, delegeert, bewaakt afhankelijkheden, kwaliteit en checkpoints.

## Product & Design
- `product-strateeg` — discovery, positionering, ICP/JTBD, roadmap, prioritering.
- `ux-ui-designer` — informatie-architectuur, flows, wireframes, visueel ontwerp (mobiel + desktop apart).
- `design-system-engineer` — tokens, componenten, states, toegankelijkheid.
- `copywriter` — tone of voice, UX-copy, e-mail-/marketingteksten.

## Engineering
- `frontend-engineer` — Next.js/React/Tailwind, schermen & interactie.
- `backend-engineer` — API's, businesslogica, database- en dienstkoppelingen.

## Data & Integraties
- `data-architect` — datamodel, migraties, schaal, markt/taal-velden.
- `integrations-engineer` — Meta, GA4/GTM, Stripe, maps, e-mail, zoeken, comms; first-party eventlaag.
- `analytics-engineer` — event-taxonomie, tracking, funnels, dashboards.
- `data-analist` — data dúiden: inzichten, cohorten, KPI's, aanbevelingen.

## Growth & Commerce
- `growth-conversie` — funnels/CRO, lifecycle, afgebroken-flow, experimenten.
- `seo-marketeer` — technische & content-SEO, structured data, Search Console.
- `ai-search-optimizer` — vindbaar/citeerbaar in AI-search (GEO/AEO).
- `monetisatie-pricing` — verdienmodel, pricing-config, spend-hefbomen.
- `marketing` — merk, campagnes, kanalen (o.a. Meta/Google-ads-strategie), launch.
- `sales` — B2B-verkoop, outreach, pipeline, deals sluiten.

## Customer
- `customer-care` — support, helpdesk, onboarding-hulp, FAQ/kennisbank.
- `customer-satisfaction` — CSAT/NPS, feedback-loops, churn, retentie.

## Finance & Ops
- `accounting-finance` — facturatie/BTW, boekhouding, unit-economics, PNL, budget.

## Trust & Platform
- `devops-security` — CI/CD, deploy, security-scans, monitoring, back-ups, performance.
- `data-security` — PII-minimalisatie, encryptie, toegangscontrole, threat modeling.
- `compliance-privacy` — AVG, consent, DSAR, a11y/i18n-governance.
- `legal` — voorwaarden, consumenten-/reclamerecht (sponsored labelen), IP/merk, en de juridische kant van data (moet/mag/grijs).
- `intranet-cockpit` — interne cockpit: strategie, KPI's, kosten, beslissingen.
- `efficiency-guardian` — **kosten- & deploy-poort** (super-agent): efficiënt deployen (niet elke wijziging live), zuinig tokengebruik in Claude Code, slim met API-credits; gate-/veto-recht op deploys en dure operaties.

## Kwaliteitsraad — test & verbeteren (onafhankelijke reviewers)
- `qa-tester` — functioneel testen, edge-cases, cross-device, states, a11y-checks.
- `code-reviewer` — codekwaliteit, veiligheid, onderhoudbaarheid.
- `design-critic` — UX/UI-review: bruikbaarheid, hiërarchie, consistentie.
- `conversion-auditor` — funnels/CRO auditen, frictie vinden, experimenten voorstellen.
- `content-editor` — teksten reviewen tegen de tone of voice.
- `security-auditor` — onafhankelijke beveiligingsaudit (aanvaller-mindset).
- `performance-auditor` — Core Web Vitals, snelheid, schaal.
- `continuous-improvement` — periodieke optimalisatie: conversie-, functionaliteit-, markt- en pricingkansen.

> Zie `ORKESTRATIE.md` voor hoe de orkestrator ze parallel/sequentieel inzet en voor de bouwen → reviewen → verbeteren-lus.
