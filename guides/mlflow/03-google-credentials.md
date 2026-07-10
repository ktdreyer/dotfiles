# Google Cloud credentials for MLflow

Make Google Application Default Credentials (ADC) available to the MLflow
container using a Podman secret.

## Prerequisites

- MLflow container running as the `mlflow` user (see the
  [systemd service guide](01-systemd-service.md))
- A Google ADC JSON file (eg. from `gcloud auth application-default login`)

## Create the Podman secret

Store your JSON file as a secret under the `mlflow` user:

```bash
sudo -u mlflow podman secret create google-adc - < ~/.config/gcloud/application_default_credentials.json
```

Verify it was created:

```bash
sudo -u mlflow podman secret ls
```

## Update the Quadlet container

Add these two lines to the `[Container]` section of
`/var/lib/mlflow/.config/containers/systemd/mlflow.container`:

```ini
Secret=google-adc,type=mount,target=/run/secrets/google-adc.json
Environment=GOOGLE_APPLICATION_CREDENTIALS=/run/secrets/google-adc.json
```

The secret mounts as a read-only file inside the container. The environment
variable tells the Google client library where to find it.

## Restart the service

```bash
sudo systemctl --user -M mlflow@ daemon-reload
sudo systemctl --user -M mlflow@ restart mlflow
```

## How Podman secrets work

Podman stores secrets under
`~/.local/share/containers/storage/secrets/` for the user. They do not
appear in `podman inspect` output or in the container's environment
variables. The default `filedriver` does not encrypt secrets at rest, but
they are isolated by user namespace.

## Rotating credentials

Replace the secret with an updated JSON file:

```bash
sudo -u mlflow podman secret rm google-adc
sudo -u mlflow podman secret create google-adc - < ~/.config/gcloud/application_default_credentials.json
sudo systemctl --user -M mlflow@ restart mlflow
```
