Here is a list of possible configuration files:

system files
  /etc/profile
  /etc/profile.d/<file>
  /etc/bash.bashrc
  /etc/bash.bash_logout

# version controlled files
  ~/.bash_profile - not used (does not get sourced by login manager)
  ~/.bash_login - not used
  ~/.profile - put environment variables here (including PATH)

  ~/.bashrc - do not put environment variables here, put bash specific customizations here

# machine specific files
  ~/.profile.local
  ~/.bashrc.local

These are the files sourced for interactive, login bash shells:
  /etc/profile -> /etc/profile.d/* -> [ ~/.bash_profile || ~/.bash_login || ~/.profile ]

These are the files sourced for interactive, non-login shells:
  /etc/bash.bashrc -> ~/.bashrc

However, /etc/profile calls /etc/bash.bashrc, and it's good practice to have your ~/.bash_profile, ~/.bash_login, or ~/.profile source ~/.bashrc

Cygwin differs from Linux distros in how it starts shells. Each Cygwin window starts a new login shell. This difference should not have an effect on the sourcing of config files however.
