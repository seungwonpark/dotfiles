#!/usr/bin/env bash

# References:
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# https://github.com/wookayin/dotfiles/blob/master/etc/macos-configure.sh
# https://github.com/rusty1s/dotfiles/blob/master/macos/defaults.sh

# Ensure that this script is running on macOS
if [ `uname` != "Darwin" ]; then
    echo "Run on macOS !"; exit 1
fi

# Close open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

configure_general() {
    # Faster key repeat
    defaults write NSGlobalDomain InitialKeyRepeat -int 20
    defaults write NSGlobalDomain KeyRepeat -int 1

    # Always show scrollbars (`WhenScrolling`, `Automatic` and `Always`)
    defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
}

configure_screenshot() {
    # Save screenshots to the desktop
    defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"

    # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
    defaults write com.apple.screencapture type -string "png"

    # Disable shadow in screenshots
    defaults write com.apple.screencapture disable-shadow -bool true
}

disable_text_correction() {
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable peroid substitution.
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes.
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes.
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct.
    defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false      # Disable text-completion.
}

configure_finder() {
    defaults write com.apple.finder AppleShowAllFiles -bool true                 # Show hidden files.
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true              # Show all file extensions.
    defaults write com.apple.finder FXEnableExtensionsChangeWarning -bool false  # Disable file extension change warning.
    defaults write com.apple.finder ShowStatusBar -bool true                     # Show status bar.
    defaults write com.apple.finder ShowPathbar -bool true                       # Show path bar.
    defaults write com.apple.finder ShowRecentTags -bool false                   # Hide tags in sidebar.
}


all() {
    configure_general
    configure_screenshot
    disable_text_correction
    configure_finder
}

if [ -n "$1" ]; then
    $1;
else
    all;
fi

