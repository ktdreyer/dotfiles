scripts and customizations for my Fedora laptop I use for development

# Useful utilities to install

* `bw` - [Bitwarden CLI](https://bitwarden.com/blog/how-to-install-and-use-the-bitwarden-command-line-tool/) - manage password entries from the terminal
* `bws` - [Bitwarden Secrets Manager CLI](https://bitwarden.com/help/secrets-manager-cli/), although this [seems abandoned](https://github.com/bitwarden/sdk-sm/issues/1347).
* `claude` - AI in your terminal
* `cosign` - examine the SBOMs that Konflux generates for images
* `dnf install gh` - Operate GitHub, create PRs, etc. Claude uses this.
* `oc` - log into OpenShift clusters
* `rosa` - create and teardown OpenShift on AWS
* `ocm` - manage OCM for AWS ([docs](https://github.com/openshift/assisted-service/blob/master/docs/ocm-integration.md))
* `did` - what did you do last week? (`uv tool install did`)
- `k9s` - TUI for Kubernetes resources
- `argocd` - CLI for managing argo ([install docs](https://argo-cd.readthedocs.io/en/latest/cli_installation/))
- [`mergify-cli`](https://pypi.org/project/mergify-cli/) - CLI for managing Mergify configs eg (`mergify config validate .mergify.yml`)

# Shell

Install `oh-my-bash`, but unset the `LESS` var so `git branch` doesn't page.

# Obsidian

I use this for note taking (AppImage).

Plugins:

* Experimenting with https://github.com/l1xnan/obsidian-better-export-pdf for generating a large PDF for import to NotebookLM

# Claude settings

I use these MCP servers:
   ```
   claude mcp add playwright -s user -- npx -y @playwright/mcp@latest
   claude mcp add memory -s user -- npx -y @modelcontextprotocol/server-memory@latest

   # This one lacks some key APIs for code review discussions:
   # https://gitlab.com/gitlab-org/gitlab/-/issues/561564#note_2859947470
   # claude mcp add gitlab --transport http -s user https://gitlab.com/api/v4/mcp

   # This one has better APIs, but may be discontinued as the official one
   # matures.
   # See https://gitlab.com/fforster/gitlab-mcp/-/issues/31 for auth
   claude mcp add fforster-gitlab -s user -- podman run -i --rm -v ~/.config/gitlab-mcp:/.config/gitlab-mcp:z registry.gitlab.com/fforster/gitlab-mcp:latest
   ```

For the Atlassian MCP server, you must run `/mcp`, choose `atlassian`, then `Authenticate` to perform OAuth authentication:

```
claude mcp add -s user --transport http atlassian https://mcp.atlassian.com/v1/mcp
```


Other `~/.claude/settings.json` settings (I include [attribution](https://github.com/ktdreyer/dotfiles/commit/06a46c70d2ebd8077622f7ff2c38276ac0d073f5) another way):

```
"gitAttribution": false,
"includeCoAuthoredBy": false
```

Use `/output-style` -> "Explanatory" to help your engineering skills.

```

# Other AI tools:

* Cursor AI

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
