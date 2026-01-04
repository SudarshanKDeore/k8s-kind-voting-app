#!/bin/bash
set -e

# Variables
VERSION="v1.30.0"
INSTALL_DIR="/usr/local/bin"
BIN="kubectl"

# Download kubectl
curl -LO "https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/${BIN}"

# Download checksum
curl -LO "https://dl.k8s.io/${VERSION}/bin/linux/amd64/${BIN}.sha256"

# Verify checksum
echo "$(cat ${BIN}.sha256)  ${BIN}" | sha256sum --check

# Install
chmod +x ${BIN}
sudo mv ${BIN} ${INSTALL_DIR}/${BIN}

# Verify
kubectl version --client

echo "kubectl ${VERSION} installation completed successfully."
