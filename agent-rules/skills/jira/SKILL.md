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

### Extracting the acli API token

On Linux, `acli` stores its API token in gnome-keyring, not in config files.
Extract it using the `current_profile` from acli's config:

```bash
PROFILE=$(yq '.current_profile' ~/.config/acli/jira_config.yaml)
JIRA_TOKEN=$(secret-tool lookup service acli username "jira:${PROFILE}")
```

### REST API call to set custom fields

```bash
curl -s -X PUT \
  -u "<email>:${JIRA_TOKEN}" \
  -H "Content-Type: application/json" \
  "https://<site>.atlassian.net/rest/api/3/issue/<KEY>" \
  -d '{"fields":{"customfield_10001":"<team-uuid>","components":[{"name":"<component>"}]}}'
```
