#!/bin/bash
set -e

# --- Install Flutter SDK ---
echo "Downloading Flutter SDK..."
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.4-stable.tar.xz
tar xf flutter_linux_3.27.4-stable.tar.xz

# --- Add Flutter to PATH ---
export PATH="$PATH:`pwd`/flutter/bin"

# --- Verify installation ---
flutter --version

# --- Enable web support ---
flutter config --enable-web

# --- Get dependencies ---
flutter pub get
