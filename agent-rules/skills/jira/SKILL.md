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
