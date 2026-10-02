# Wetland Mitigation Bank Operations

Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations.

## Implemented records

- **Mitigation Bank**: name, permit Number, service Area, sponsor, habitat Type, established At, status.
- **Mitigation Parcel**: name, parcel Number, area Hectares, habitat, baseline At, owner, status.
- **Credit Release**: title, habitat, units, release At, authorization Reference, condition Version, status.
- **Credit Sale**: title, buyer, habitat, units, sold At, permit Reference, status.
- **Monitoring Plot**: title, plot Code, area Hectares, coordinates, method, status.
- **Plot Observation**: title, observed At, metric, value, unit, observer, status.
- **Performance Criterion**: title, metric, threshold, comparison, version, assessment At, status.
- **Adaptive Action**: title, cause, action, owner, due At, status.
- **Financial Assurance**: title, instrument, issuer, required Cents, held Cents, expiry, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Monitoring evidence mapping: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Credit ledger discrepancy brief: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Performance observation summary: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Adaptive management draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Release packet gap analysis: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Stewardship report draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Mitigation credit balance: Balance explicitly authorized releases and sales within one habitat and service area; never create regulatory credits.
- Mitigation Bank evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
