#!/bin/sh

# The default execution directory of this script is the ci_scripts directory.
cd $CI_WORKSPACE # change working directory to the root of your cloned repo.

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 # disable homebrew's automatic updates.

# Install CocoaPods using Homebrew.
brew install cocoapods

# Install Flutter
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Install Flutter artifacts for iOS (--ios)
flutter precache --ios

# Install Flutter dependencies.
flutter pub get

# Build ios app
flutter build ios --no-codesign

exit 0
