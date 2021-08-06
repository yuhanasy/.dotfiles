#------------------
# Shell Variables
#------------------
# Android SDK
export ANDROID_HOME=~/Library/Android/sdk

#------------------
# PATH Manipulations
#------------------
# Add mySQL executable to Path
export PATH=$PATH:/usr/local/mysql/bin
# Add Laravel Valet to PATH
export PATH=${PATH}:$HOME/.composer/vendor/bin
# Add Android SDK to path
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
# Add ruby to PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"
# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Flutter
export PATH="$PATH:/Users/yuhanasy/flutter/bin"
# Go
export PATH=${HOME}/go/bin:$PATH