#!/bin/bash
set -e

# --- Install Flutter SDK (with Dart 3.7.x) ---
echo "Downloading Flutter SDK (3.29.0-stable)..."
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.29.0-stable.tar.xz
tar xf flutter_linux_3.29.0-stable.tar.xz

# --- Add Flutter to PATH ---
export PATH="$PATH:`pwd`/flutter/bin"

# --- Verify installation ---
flutter --version

# --- Enable web support ---
flutter config --enable-web

# --- Get dependencies ---
flutter pub get
