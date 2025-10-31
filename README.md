scripts and customizations for my Fedora laptop I use for development

# Useful utilities to install

* `bws` - https://bitwarden.com/help/secrets-manager-cli/
* `claude` - AI in your terminal
* `cosign` - https://bitwarden.com/help/secrets-manager-cli.md
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

   # This one lacks some key APIs for code review discussions:
   # https://gitlab.com/gitlab-org/gitlab/-/issues/561564#note_2859947470
   claude mcp add --transport http GitLab https://gitlab.com/api/v4/mcp

   # This one has better APIs, but may be discontinued as the official one
   # matures.
   # See https://gitlab.com/fforster/gitlab-mcp/-/issues/31 for auth
   claude mcp add fforster-gitlab -- podman run -i --rm -v ~/.config/gitlab-mcp:/.config/gitlab-mcp:z registry.gitlab.com/fforster/gitlab-mcp:latest

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
