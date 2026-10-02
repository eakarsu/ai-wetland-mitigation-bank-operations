export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-wetland-mitigation-bank-operations",
  "title": "Wetland Mitigation Bank Operations",
  "tagline": "Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations.",
    "entities": [
      "MitigationBank",
      "MitigationParcel",
      "CreditRelease"
    ],
    "workflows": [
      "monitoring-evidence-mapping",
      "credit-ledger-discrepancy-brief"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations.",
    "entities": [
      "CreditSale",
      "MonitoringPlot",
      "PlotObservation"
    ],
    "workflows": [
      "performance-observation-summary",
      "adaptive-management-draft"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations.",
    "entities": [
      "PerformanceCriterion",
      "AdaptiveAction",
      "FinancialAssurance"
    ],
    "workflows": [
      "release-packet-gap-analysis",
      "stewardship-report-draft"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "MitigationBank": {
    "name": "MitigationBank",
    "label": "Mitigation Bank",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "permitNumber",
        "kind": "string"
      },
      {
        "name": "serviceArea",
        "kind": "string"
      },
      {
        "name": "sponsor",
        "kind": "string"
      },
      {
        "name": "habitatType",
        "kind": "string"
      },
      {
        "name": "establishedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "MitigationParcel": {
    "name": "MitigationParcel",
    "label": "Mitigation Parcel",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "parcelNumber",
        "kind": "string"
      },
      {
        "name": "areaHectares",
        "kind": "number"
      },
      {
        "name": "habitat",
        "kind": "string"
      },
      {
        "name": "baselineAt",
        "kind": "date"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "CreditRelease": {
    "name": "CreditRelease",
    "label": "Credit Release",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "habitat",
        "kind": "string"
      },
      {
        "name": "units",
        "kind": "number"
      },
      {
        "name": "releaseAt",
        "kind": "date"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "conditionVersion",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "CreditSale": {
    "name": "CreditSale",
    "label": "Credit Sale",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "buyer",
        "kind": "string"
      },
      {
        "name": "habitat",
        "kind": "string"
      },
      {
        "name": "units",
        "kind": "number"
      },
      {
        "name": "soldAt",
        "kind": "date"
      },
      {
        "name": "permitReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "MonitoringPlot": {
    "name": "MonitoringPlot",
    "label": "Monitoring Plot",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "mitigationParcelId",
        "kind": "string"
      },
      {
        "name": "plotCode",
        "kind": "string"
      },
      {
        "name": "areaHectares",
        "kind": "number"
      },
      {
        "name": "coordinates",
        "kind": "string"
      },
      {
        "name": "method",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "PlotObservation": {
    "name": "PlotObservation",
    "label": "Plot Observation",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "monitoringPlotId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "metric",
        "kind": "string"
      },
      {
        "name": "value",
        "kind": "number"
      },
      {
        "name": "unit",
        "kind": "string"
      },
      {
        "name": "observer",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "PerformanceCriterion": {
    "name": "PerformanceCriterion",
    "label": "Performance Criterion",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "metric",
        "kind": "string"
      },
      {
        "name": "threshold",
        "kind": "number"
      },
      {
        "name": "comparison",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "assessmentAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "AdaptiveAction": {
    "name": "AdaptiveAction",
    "label": "Adaptive Action",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "mitigationParcelId",
        "kind": "string"
      },
      {
        "name": "cause",
        "kind": "string"
      },
      {
        "name": "action",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "FinancialAssurance": {
    "name": "FinancialAssurance",
    "label": "Financial Assurance",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "instrument",
        "kind": "string"
      },
      {
        "name": "issuer",
        "kind": "string"
      },
      {
        "name": "requiredCents",
        "kind": "number"
      },
      {
        "name": "heldCents",
        "kind": "number"
      },
      {
        "name": "expiry",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "mitigationBankId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "monitoring-evidence-mapping",
    "title": "Monitoring evidence mapping",
    "description": "Monitoring evidence mapping using selected mitigation bank records and supplied evidence.",
    "prompt": "Monitoring evidence mapping for Wetland Mitigation Bank Operations. Operational scope: Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations. Specific AI scope: Compare monitoring evidence against instrument requirements. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "credit-ledger-discrepancy-brief",
    "title": "Credit ledger discrepancy brief",
    "description": "Credit ledger discrepancy brief using selected mitigation bank records and supplied evidence.",
    "prompt": "Credit ledger discrepancy brief for Wetland Mitigation Bank Operations. Operational scope: Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations. Specific AI scope: Compare monitoring evidence against instrument requirements. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "performance-observation-summary",
    "title": "Performance observation summary",
    "description": "Performance observation summary using selected mitigation bank records and supplied evidence.",
    "prompt": "Performance observation summary for Wetland Mitigation Bank Operations. Operational scope: Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations. Specific AI scope: Compare monitoring evidence against instrument requirements. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "adaptive-management-draft",
    "title": "Adaptive management draft",
    "description": "Adaptive management draft using selected mitigation bank records and supplied evidence.",
    "prompt": "Adaptive management draft for Wetland Mitigation Bank Operations. Operational scope: Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations. Specific AI scope: Compare monitoring evidence against instrument requirements. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "release-packet-gap-analysis",
    "title": "Release packet gap analysis",
    "description": "Release packet gap analysis using selected mitigation bank records and supplied evidence.",
    "prompt": "Release packet gap analysis for Wetland Mitigation Bank Operations. Operational scope: Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations. Specific AI scope: Compare monitoring evidence against instrument requirements. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "stewardship-report-draft",
    "title": "Stewardship report draft",
    "description": "Stewardship report draft using selected mitigation bank records and supplied evidence.",
    "prompt": "Stewardship report draft for Wetland Mitigation Bank Operations. Operational scope: Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations. Specific AI scope: Compare monitoring evidence against instrument requirements. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected mitigation bank records and supplied evidence.",
    "prompt": "Evidence completeness review for Wetland Mitigation Bank Operations. Operational scope: Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations. Specific AI scope: Compare monitoring evidence against instrument requirements. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected mitigation bank records and supplied evidence.",
    "prompt": "Operations handoff draft for Wetland Mitigation Bank Operations. Operational scope: Track bank instruments, ecological milestones, regulator-approved credit releases, sales, reservations and monitoring obligations. Specific AI scope: Compare monitoring evidence against instrument requirements. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
