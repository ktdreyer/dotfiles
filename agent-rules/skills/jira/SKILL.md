---
name: jira
description: Use when performing any Jira operation - creating, editing, searching, viewing, or transitioning issues. Prefers Atlassian MCP server, falls back to acli.
---

Execute the `acli` utility to look up tickets. For example:

```
acli jira workitem view AIPCC-1
```

Discover more with this:

```
acli jira workitem --help
```

## Creating and editing issues

Use the Atlassian MCP server with `contentFormat: "markdown"` when possible. Fall back to `acli` when MCP returns permission project errors (ECO-1358).

With `acli`, descriptions must be plain text or ADF JSON. Jira does not render Markdown and wiki markup when using the CLI. Write ADF JSON to a temp file and apply it with `acli jira workitem edit --key <KEY> --description-file <file> --yes`.

## Custom fields (team, component, priority)

`acli` supports custom fields via `additionalAttributes` in `--from-json` at
**create** time only. The `acli jira workitem edit` command rejects
`additionalAttributes` with `json: unknown field`.

To set custom fields on an existing issue, use the Jira REST API directly.

### Assignee

Do not use `@me` with `acli` — it resolves to the wrong account. Always use
the explicit email address (e.g., `kdreyer@redhat.com`).

### Extracting acli credentials

On Linux, `acli` stores its API token in gnome-keyring, not in config files.
Extract all credentials from acli's config and keyring:

```bash
PROFILE=$(yq '.current_profile' ~/.config/acli/jira_config.yaml)
JIRA_TOKEN=$(secret-tool lookup service acli username "jira:${PROFILE}")
JIRA_EMAIL=$(yq '.profiles[0].email' ~/.config/acli/jira_config.yaml)
JIRA_SITE=$(yq '.profiles[0].site' ~/.config/acli/jira_config.yaml)
```

### REST API call to set custom fields

```bash
curl -s -X PUT \
  -u "${JIRA_EMAIL}:${JIRA_TOKEN}" \
  -H "Content-Type: application/json" \
  "https://${JIRA_SITE}/rest/api/3/issue/<KEY>" \
  -d '{"fields":{"customfield_10001":"<team-uuid>","components":[{"name":"<component>"}]}}'
```

### REST API call to assign issues to a sprint

`acli` has no sprint-assignment subcommand. Use the Agile REST API:

```bash
curl -s -X POST \
  -u "${JIRA_EMAIL}:${JIRA_TOKEN}" \
  -H "Content-Type: application/json" \
  "https://${JIRA_SITE}/rest/agile/1.0/sprint/<SPRINT_ID>/issue" \
  -d '{"issues":["KEY-1","KEY-2"]}'
```

A 204 response means success.
