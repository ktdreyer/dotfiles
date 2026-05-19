scripts and customizations for my Fedora laptop I use for development

# Useful utilities to install

* `bw` - [Bitwarden CLI](https://bitwarden.com/blog/how-to-install-and-use-the-bitwarden-command-line-tool/) - manage password entries from the terminal
* `bws` - [Bitwarden Secrets Manager CLI](https://bitwarden.com/help/secrets-manager-cli/), although this [seems abandoned](https://github.com/bitwarden/sdk-sm/issues/1347).
* `claude` - AI in your terminal
* `cosign` - examine the SBOMs that Konflux generates for images
* `dnf install gh` - Operate GitHub, create PRs, etc. Claude uses this.
* `dnf install glab`  - Operate GitLab
* `oc` - log into OpenShift clusters
* `rosa` - create and teardown OpenShift on AWS
* `ocm` - manage OCM for AWS ([docs](https://github.com/openshift/assisted-service/blob/master/docs/ocm-integration.md))
* `did` - what did you do last week? (`uv tool install did`)
- `k9s` - TUI for Kubernetes resources
- `argocd` - CLI for managing argo ([install docs](https://argo-cd.readthedocs.io/en/latest/cli_installation/))
- [`mergify-cli`](https://pypi.org/project/mergify-cli/) - CLI for managing Mergify configs eg (`mergify config validate .mergify.yml`)
- [`acli`](https://developer.atlassian.com/cloud/acli/guides/install-linux/) - CLI for Jira
- `dnf install vault` - for reading/writing secrets in Hashicorp Vault
- `dnf install trivy` - for scanning container images ([skill](https://github.com/opendatahub-io/ai-helpers/blob/c29e5da99914a54f2f804384c422edb9779ced15/helpers/skills/oci-cve-checker/scripts/check_cves.sh))
- [`kube-linter`](https://github.com/stackrox/kube-linter) - for linting k8s manifests

# Shell

Install `oh-my-bash`, but unset the `LESS` var so `git branch` doesn't page.

# Obsidian

I use this for note taking (AppImage).

Plugins:

* Experimenting with https://github.com/l1xnan/obsidian-better-export-pdf for generating a large PDF for import to NotebookLM

# Logging into CLI tools

Tips for logging into these various tools:

* `acli`: Use a [personal API token](https://id.atlassian.com/manage-profile/security/api-tokens).

* `glab`: Use a [personal access token](https://gitlab.com/-/user_settings/personal_access_tokens?scopes=api,write_repository).
   * For `Token name`, write `glab cli`. For `Description`, write `red hat laptop`, or your hostname, or anything that helps you remember the location at which you will store this token. Take the defaults for all other prompts.
   * When complete, `glab` will write your configuration (including this token) to a config file (Linux: `~/.config/glab-cli/config.yml`).
   * You can export it to an env var like so: `export GITLAB_TOKEN=$(glab config get --host gitlab.com token)` for use in scripts that use the GitLab API directly.

* `rosa login --use-auth-code`

* `ibmcloud login --sso`.

   To set up 2FA: when first logging in, click [Enroll a new Factor](https://iam.cloud.ibm.com/mysecurity/index.jsp). This form will prompt you to validate your identity. Enable "U2F". Tap your Yubikey when your browser prompts you.

# Claude settings

I use these MCP servers:
   ```
   claude mcp add playwright -s user -- npx -y @playwright/mcp@latest
   claude mcp add memory -s user -- npx -y @modelcontextprotocol/server-memory@latest
   claude mcp add -s user --transport http atlassian https://mcp.atlassian.com/v1/mcp
   ```

After adding the Atlassian MCP server, run `/mcp`, choose `atlassian`, then `Authenticate` to perform OAuth authentication.


Other `~/.claude/settings.json` settings (I include [attribution](https://github.com/ktdreyer/dotfiles/commit/06a46c70d2ebd8077622f7ff2c38276ac0d073f5) another way):

```
"gitAttribution": false,
"includeCoAuthoredBy": false
```

Use `/output-style` -> "Explanatory" to help your engineering skills.

# Other AI tools:

* Cursor AI

* `goose` CLI. From [this blog](https://blog.marcnuri.com/goose-on-machine-ai-agent-cli-introduction), run:
   ```
   curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | bash
   ```
   ... and plug in the Google Gemini API key.

* https://5ire.app/ - open-source alternative to Claude Desktop
   ... uses Google Gemini API key.


## For RHAII and RHEL AI development:

* `oras` - download AI models as OCI artifacts
* `tkn` - ([docs](https://tekton.dev/docs/cli/)) view Konflux build logs on GitLab MRs
* kubectl `ka` plugin - ([install](https://kubearchive.github.io/kubearchive/main/cli/installation.html)) view archived Konflux build logs
* `syft` - compare container images for differences
