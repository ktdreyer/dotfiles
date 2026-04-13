---
name: kdreyer-jira
description: Use this skill when refining a Jira ticket text. It applies my personal ticket creation style focused on scope management, simplicity, precision, and pragmatism.
version: 1.0.0
---

When creating a Jira ticket:

1. Every ticket has a one-sentence "Goal" statement at the top: `As a ___, I want to ____, so that ____`. Do not mechanically describe "what" the task encompasses. Use the "Five Whys" principle to reflect on this goal.
2. Every ticket has a bullet list of **Acceptance Criteria**. Each bullet is exactly one complete sentence.
3. Every ticket links to one of my team's Epics.
4. Prompt the user to review the Jira comment prior to posting it.

When commenting on a ticket:

 - Do not give wordy updates that repeat exactly what you've done in Git. Think about what would be informative to your teammates or future self. Jira is a decision record, and an SOP development tool.
 - Simply give a succint, brief, to-the-point one-sentence update.
