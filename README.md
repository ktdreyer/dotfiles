scripts and customizations for my Fedora laptop I use for development

# Useful utilities to install

* `bws` - [Bitwarden CLI](https://bitwarden.com/help/secrets-manager-cli/), although this [seems abandoned](https://github.com/bitwarden/sdk-sm/issues/1347).
* `claude` - AI in your terminal
* `cosign` - examine the SBOMs that Konflux generates for images
* `dnf install gh` - Operate GitHub, create PRs, etc. Claude uses this.
* `oc` - log into OpenShift clusters
* `rosa` - create and teardown OpenShift on AWS
* `did` - what did you do last week? (`uv tool install did`)
* Obsidian - note taking (AppImage)

# AI tools:

* Cursor AI
* `claude` CLI, with the relevant MCP servers:
   ```
   claude mcp add playwright -s user -- npx -y @playwright/mcp@latest

   # For mcp-atlassian, set three variables in ~/.claude/mcp-atlassian.env:
   #   JIRA_URL=https://issues.redhat.com
   #   JIRA_PERSONAL_TOKEN=<my personal token here>
   #   JIRA_SSL_VERIFY=true
   claude mcp add mcp-atlassian -s user -- podman run --rm -i --env-file ~/.claude/mcp-atlassian.env ghcr.io/sooperset/mcp-atlassian:latest

   # This one lacks some key APIs for code review discussions:
   # https://gitlab.com/gitlab-org/gitlab/-/issues/561564#note_2859947470
   # claude mcp add gitlab --transport http -s user https://gitlab.com/api/v4/mcp

   # This one has better APIs, but may be discontinued as the official one
   # matures.
   # See https://gitlab.com/fforster/gitlab-mcp/-/issues/31 for auth
   claude mcp add fforster-gitlab -s user -- podman run -i --rm -v ~/.config/gitlab-mcp:/.config/gitlab-mcp:z registry.gitlab.com/fforster/gitlab-mcp:latest
   ```

   Other `~/.claude/settings.json` settings:
   ```
   "gitAttribution": false,
   "includeCoAuthoredBy": false
   ```

* `goose` CLI. From [this blog](https://blog.marcnuri.com/goose-on-machine-ai-agent-cli-introduction), run:
   ```
   curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | bash
   ```
   ... and plug in the Google Gemini API key.

* https://5ire.app/ - open-source alternative to Claude Desktop
   ... uses Google Gemini API key.


## For RHEL AI development:

* `dnf install glab`  - running DIIP (CI platform)
* `oras` - download AI models as OCI artifacts
* `tkn` - view Konflux build logs on GitLab MRs
* `syft` - compare container images for differences
