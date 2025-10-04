#!/bin/bash
set -e

# Download Flutter SDK
echo "Installing Flutter SDK..."
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz
tar xf flutter_linux_3.24.3-stable.tar.xz

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Check Flutter version
flutter --version

# Enable web support and get packages
flutter config --enable-web
flutter pub get
