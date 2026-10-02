-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MitigationBank" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "permitNumber" TEXT NOT NULL,
    "serviceArea" TEXT NOT NULL,
    "sponsor" TEXT NOT NULL,
    "habitatType" TEXT NOT NULL,
    "establishedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MitigationBank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MitigationParcel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "parcelNumber" TEXT NOT NULL,
    "areaHectares" DOUBLE PRECISION NOT NULL,
    "habitat" TEXT NOT NULL,
    "baselineAt" TIMESTAMP(3) NOT NULL,
    "owner" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MitigationParcel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CreditRelease" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "habitat" TEXT NOT NULL,
    "units" DOUBLE PRECISION NOT NULL,
    "releaseAt" TIMESTAMP(3) NOT NULL,
    "authorizationReference" TEXT NOT NULL,
    "conditionVersion" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CreditRelease_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CreditSale" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "buyer" TEXT NOT NULL,
    "habitat" TEXT NOT NULL,
    "units" DOUBLE PRECISION NOT NULL,
    "soldAt" TIMESTAMP(3) NOT NULL,
    "permitReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CreditSale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MonitoringPlot" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "mitigationParcelId" TEXT NOT NULL,
    "plotCode" TEXT NOT NULL,
    "areaHectares" DOUBLE PRECISION NOT NULL,
    "coordinates" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MonitoringPlot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlotObservation" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "monitoringPlotId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "metric" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "observer" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlotObservation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PerformanceCriterion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "metric" TEXT NOT NULL,
    "threshold" DOUBLE PRECISION NOT NULL,
    "comparison" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assessmentAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PerformanceCriterion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdaptiveAction" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "mitigationParcelId" TEXT NOT NULL,
    "cause" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AdaptiveAction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FinancialAssurance" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "instrument" TEXT NOT NULL,
    "issuer" TEXT NOT NULL,
    "requiredCents" INTEGER NOT NULL,
    "heldCents" INTEGER NOT NULL,
    "expiry" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FinancialAssurance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "mitigationBankId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "MitigationBank_createdAt_idx" ON "MitigationBank"("createdAt");

-- CreateIndex
CREATE INDEX "MitigationParcel_createdAt_idx" ON "MitigationParcel"("createdAt");

-- CreateIndex
CREATE INDEX "MitigationParcel_mitigationBankId_idx" ON "MitigationParcel"("mitigationBankId");

-- CreateIndex
CREATE INDEX "CreditRelease_createdAt_idx" ON "CreditRelease"("createdAt");

-- CreateIndex
CREATE INDEX "CreditRelease_mitigationBankId_idx" ON "CreditRelease"("mitigationBankId");

-- CreateIndex
CREATE INDEX "CreditSale_createdAt_idx" ON "CreditSale"("createdAt");

-- CreateIndex
CREATE INDEX "CreditSale_mitigationBankId_idx" ON "CreditSale"("mitigationBankId");

-- CreateIndex
CREATE INDEX "MonitoringPlot_createdAt_idx" ON "MonitoringPlot"("createdAt");

-- CreateIndex
CREATE INDEX "MonitoringPlot_mitigationBankId_idx" ON "MonitoringPlot"("mitigationBankId");

-- CreateIndex
CREATE INDEX "PlotObservation_createdAt_idx" ON "PlotObservation"("createdAt");

-- CreateIndex
CREATE INDEX "PlotObservation_mitigationBankId_idx" ON "PlotObservation"("mitigationBankId");

-- CreateIndex
CREATE INDEX "PerformanceCriterion_createdAt_idx" ON "PerformanceCriterion"("createdAt");

-- CreateIndex
CREATE INDEX "PerformanceCriterion_mitigationBankId_idx" ON "PerformanceCriterion"("mitigationBankId");

-- CreateIndex
CREATE INDEX "AdaptiveAction_createdAt_idx" ON "AdaptiveAction"("createdAt");

-- CreateIndex
CREATE INDEX "AdaptiveAction_mitigationBankId_idx" ON "AdaptiveAction"("mitigationBankId");

-- CreateIndex
CREATE INDEX "FinancialAssurance_createdAt_idx" ON "FinancialAssurance"("createdAt");

-- CreateIndex
CREATE INDEX "FinancialAssurance_mitigationBankId_idx" ON "FinancialAssurance"("mitigationBankId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_mitigationBankId_idx" ON "OperationalTask"("mitigationBankId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_mitigationBankId_idx" ON "RuleVersion"("mitigationBankId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_mitigationBankId_idx" ON "DocumentRequirement"("mitigationBankId");

-- AddForeignKey
ALTER TABLE "MitigationParcel" ADD CONSTRAINT "MitigationParcel_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CreditRelease" ADD CONSTRAINT "CreditRelease_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CreditSale" ADD CONSTRAINT "CreditSale_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MonitoringPlot" ADD CONSTRAINT "MonitoringPlot_mitigationParcelId_fkey" FOREIGN KEY ("mitigationParcelId") REFERENCES "MitigationParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MonitoringPlot" ADD CONSTRAINT "MonitoringPlot_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlotObservation" ADD CONSTRAINT "PlotObservation_monitoringPlotId_fkey" FOREIGN KEY ("monitoringPlotId") REFERENCES "MonitoringPlot"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlotObservation" ADD CONSTRAINT "PlotObservation_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PerformanceCriterion" ADD CONSTRAINT "PerformanceCriterion_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdaptiveAction" ADD CONSTRAINT "AdaptiveAction_mitigationParcelId_fkey" FOREIGN KEY ("mitigationParcelId") REFERENCES "MitigationParcel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdaptiveAction" ADD CONSTRAINT "AdaptiveAction_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FinancialAssurance" ADD CONSTRAINT "FinancialAssurance_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_mitigationBankId_fkey" FOREIGN KEY ("mitigationBankId") REFERENCES "MitigationBank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

