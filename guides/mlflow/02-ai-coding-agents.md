# Connecting Claude Code and opencode to MLflow

Send traces from your AI coding agents to the MLflow tracking server set up
in the [systemd service guide](01-systemd-service.md).

## Prerequisites

- MLflow tracking server running at `http://localhost:5000` (see the
  [systemd service guide](01-systemd-service.md))
- Claude Code or opencode installed

## Claude Code

### Install the MLflow plugin

Run these from your terminal (not inside Claude Code):

```bash
claude plugin marketplace add mlflow/mlflow --sparse .claude-plugin
claude plugin install mlflow-tracing@mlflow-plugins
```

Restart Claude Code after installing the plugin.

### Configure tracing

Inside Claude Code, run the setup wizard:

```
/mlflow-tracing:setup
```

Note: This [wizard](https://github.com/mlflow/mlflow/blob/master/libs/typescript/integrations/claude-code/skills/setup/SKILL.md) is new. There are some bumps in the process. The biggest problem: the wizard doesn't know where to find the `mlflow-claude-code` CLI. It's [this](https://github.com/mlflow/mlflow/tree/master/libs/typescript/integrations/claude-code). Turns out the CLI is bundled within the plugin at `~/.claude/plugins/cache/mlflow-plugins/mlflow-tracing/0.2.0/bundle/cli.cjs setup --help`, and it's not in my `PATH` because I didn't `npm install` it. However, when you tell the wizard this, it connects the dots and carries on invoking `cli.cjs` instead of `mlflow-claude-code`.

Anyway, once the wizard can find its tool, it prompts you for:

- **Tracking URI** - enter `http://localhost:5000`
- **Experiment** - choose or create an experiment name. I used `claude-code`.
- **Scope** - `project` for per-repo tracing, or `user` for all repos

Verify it is working:

```
/mlflow-tracing:status
```

This writes hooks into `.claude/settings.json`. Claude exports the traces when your Claude Code session ends.

## opencode (untested!)

### Install the plugin

```bash
npm install @mlflow/opencode
```

### Configure opencode

[docs](https://mlflow.org/docs/latest/genai/tracing/integrations/listing/opencode/)

### Troubleshooting

Enable debug logging:

```bash
export MLFLOW_OPENCODE_DEBUG=true
opencode
```

Verify the server is reachable:

```bash
curl $MLFLOW_TRACKING_URI/api/2.0/mlflow/experiments/list
```

### Disable tracing

Remove the plugin from `opencode.json`:

```json
{
  "plugin": []
}
```

## Viewing traces

Open the MLflow UI at http://localhost:5000. Both Claude Code and opencode
traces appear in the experiment you configured. Each trace shows:

- User prompts and assistant responses
- Tool calls with inputs and outputs
- Token usage and cost
- Session timing

## Next steps

- [Make Google Cloud credentials available to the container and AI Gateway](03-google-credentials.md)
