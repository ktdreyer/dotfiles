# Running MLflow on Fedora with Podman Quadlet

Run the MLflow tracking server as a rootless container managed by systemd,
using Podman's Quadlet integration. The service runs under a dedicated
`mlflow` system user.

## Create the mlflow user

```bash
sudo useradd --system --create-home -d /var/lib/mlflow -F mlflow
```

I'm not 100% sure we need this in Fedora 43, but older internet lore suggests
we need to run `loginctl enable-linger` to allow the user's systemd instance to
run without an active login session:

```bash
sudo loginctl enable-linger mlflow
```

## Create the Quadlet files

### Volume

Create the directory for user-level Quadlet files:

```bash
sudo -u mlflow mkdir -p /var/lib/mlflow/.config/containers/systemd
```

Write the volume definition:

```bash
sudo tee /var/lib/mlflow/.config/containers/systemd/mlflow-data.volume <<EOF
[Volume]
EOF
```

This creates a Podman named volume (`systemd-mlflow-data`) for the SQLite
database and artifact storage.

### Container

```bash
sudo tee /var/lib/mlflow/.config/containers/systemd/mlflow.container <<EOF
[Unit]
Description=MLflow tracking server
After=network-online.target

[Container]
Image=ghcr.io/mlflow/mlflow:latest
Exec=mlflow server --host 0.0.0.0 --port 5000 --backend-store-uri sqlite:///mlflow/mlflow.db --artifacts-destination /mlflow/artifacts
PublishPort=127.0.0.1:5000:5000
ReadOnly=true
Tmpfs=/tmp
Volume=mlflow-data.volume:/mlflow:Z
AutoUpdate=registry
PodmanArgs=--security-opt=no-new-privileges
HealthCmd=python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')"
HealthInterval=30s
HealthStartPeriod=10s

[Install]
WantedBy=default.target
EOF
```

## Start the service

Reload the systemd units and start the container:

```bash
sudo systemctl --user -M mlflow@ daemon-reload
sudo systemctl --user -M mlflow@ start mlflow
```

Check status:

```bash
sudo systemctl --user -M mlflow@ status mlflow
```

The MLflow UI is at http://localhost:5000.

## View logs

```bash
sudo journalctl --user -M mlflow@ -u mlflow -f
```

## Auto-update the container image

Podman can check for new images on a timer. Enable it for the mlflow user:

```bash
sudo systemctl --user -M mlflow@ enable --now podman-auto-update.timer
```

Because the container unit has `AutoUpdate=registry`, Podman pulls and
restarts when `ghcr.io/mlflow/mlflow:latest` changes.

## Next steps

- [Connect Claude Code and opencode to this server](02-ai-coding-agents.md)
- [Make Google Cloud credentials available to the container and AI Gateway](03-google-credentials.md)
