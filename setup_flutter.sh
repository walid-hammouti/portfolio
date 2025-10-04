#!/bin/bash
set -e

echo "Installing Flutter SDK..."
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.4-stable.tar.xz
tar xf flutter_linux_3.27.4-stable.tar.xz

export PATH="$PATH:`pwd`/flutter/bin"

flutter --version
flutter config --enable-web
flutter pub get
