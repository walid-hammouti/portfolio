#!/bin/bash
set -e

# Download Flutter SDK (3.35.5 includes Dart 3.7)
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.35.5-stable.tar.xz
tar xf flutter_linux_3.35.5-stable.tar.xz

# Fix Git safe directory issue
git config --global --add safe.directory /vercel/path0/flutter

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Check Flutter & install dependencies
flutter --version
flutter pub get
