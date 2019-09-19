if [[ $- != *i* ]] ; then
	return
fi

# Deorder: Disable __pycache__ folder
export PYTHONDONTWRITEBYTECODE=1

# Deorder: Android paths
export ANDROID_HOME=${HOME}/Android/Sdk
export ANDROID_SDK_ROOT=${HOME}/Android/Sdk
export ANDROID_AVD_HOME=${HOME}/.android/avd

# Deorder: Android settings
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

# Deorder: Search paths
export PATH="${ANDROID_HOME}/emulator:${PATH}"
export PATH="${PATH}:${ANDROID_HOME}/tools"
export PATH="${PATH}:${ANDROID_HOME}/tools/bin"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
export PATH="${PATH}:${ANDROID_HOME}/build-tools/28.0.3/"
export PATH="${HOME}/Scripts:${HOME}/Applications:${PATH}"

# Deorder: Lua paths
export LUA_PATH="./?/init.lua;;"

# Deorder: Vulkan paths
export VK_LAYER_PATH=/usr/share/vulkan/explicit_layer.d

# Deorder: Add git prompt
source /usr/share/git/git-prompt.sh
export PS1='\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]$(__git_ps1 " (%s)") \[\033[01;34m\]\$\[\033[00m\] '

if [ -f ${HOME}/.demo ]; then
  export USER="deorder"
  export HOSTNAME="drodan.com"
  export PS1='\[\033]0;deorder@drodan.com:\w\007\]\[\033[01;32m\]deorder@drodan.com\[\033[01;34m\] \w\[\033[00m\]$(__git_ps1 " (%s)") \[\033[01;34m\]\$\[\033[00m\] '
fi

# Deorder: Disable terminal lock
stty -ixon -ixoff
