export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export LIBVIRT_DEFAULT_URI="qemu:///system"

# NVM (shared across shells)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Node environment
export NODE_NO_WARNINGS=1

# OpenCode configuration
export OPENCODE_DISABLE_CLAUDE_CODE=1
