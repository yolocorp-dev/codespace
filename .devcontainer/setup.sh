#!/bin/bash
set -e

echo "🚀 Setting up YOLO project environment..."

# Update the system and install deps
sudo apt-get update
sudo apt-get install --yes xdg-utils

# Install yolo CLI
echo "📦 Installing YOLO CLI..."
ARCH=$(uname -m)
OS=$(uname -s | tr '[:upper:]' '[:lower:]')

# Map architecture names
if [ "$ARCH" = "x86_64" ]; then
  ARCH="amd64"
elif [ "$ARCH" = "aarch64" ]; then
  ARCH="arm64"
fi

CLI_URL="https://yolo-cli-releases.t3.storage.dev/yolo-${OS}-${ARCH}"
curl -L "$CLI_URL" -o /tmp/yolo
sudo mv /tmp/yolo /usr/local/bin/yolo
sudo chmod +x /usr/local/bin/yolo

echo ""
echo "✓ YOLO CLI installed!"
echo ""
echo "Next steps:"
echo "  1. yolo login"
echo "  2. yolo enroll"
echo "  3. cd yolo-*"
echo "  4. yolo deploy"
