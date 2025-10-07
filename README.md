scripts and customizations for my Fedora laptop I use for development

# Useful utilities to install

* `bws` - https://bitwarden.com/help/secrets-manager-cli.md
* `claude` - AI in your terminal
* `cosign` - https://bitwarden.com/help/secrets-manager-cli.md
* `dnf install gh` - Operate GitHub, create PRs, etc. Claude uses this.
* `oc` - log into OpenShift clusters

# AI tools:

* Cursor AI
* `claude` CLI, with the relevant MCP servers:
   ```
   claude mcp add playwright -s user -- npx -y @playwright/mcp@latest
   ```
* `goose` CLI. From [this blog](https://blog.marcnuri.com/goose-on-machine-ai-agent-cli-introduction), run:
   ```
   curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | bash
   ```
   ... and plug in the Google Gemini API key.


## For RHEL AI development:

* `dnf install glab`  - running DIIP (CI platform)
* `oras` - download models as OCI artifacts
* `tkn` - view Konflux build logs on GitLab MRs
* `syft` - compare container images for differences
* `cosign` - examine the SBOMs that Konflux generates for images
