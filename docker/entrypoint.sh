
#!/bin/bash

set -e

echo "[cloud-init-sim] Container started."

if [ -z "$CLOUD_INIT_CONFIG_BASE64" ]; then
    echo "[cloud-init-sim] No CLOUD_INIT_CONFIG_BASE64 found. Skipping cloud-init step."
else
    echo "[cloud-init-sim] Applying cloud-init placeholder..."

    # Decode into cloud-init directory
    echo "$CLOUD_INIT_CONFIG_BASE64" | base64 -d > /cloud-init/user-data.yaml

    echo "[cloud-init-sim] Written cloud-init config to /cloud-init/user-data.yaml"
fi

# Example: log timestamp
echo "[cloud-init-sim] Finished at $(date)" > /cloud-init/executed.log

# Keep container alive
echo "[cloud-init-sim] Starting long-running shell loop..."
exec bash -c "sleep infinity"
