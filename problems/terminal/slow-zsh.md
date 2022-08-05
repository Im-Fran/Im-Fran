# Problem
My zsh terminal load time is around 5-10 seconds

# Finding out what's taking too long
I've added this at the start of the zshrc file:
```zsh
# Init profiling
zmodload zsh/prof
```

and this at the end of the file:
```zsh
zprof
# End profiling
```

After that I restarted the terminal and it seems like compinit was taking a long time to load.

# Solutions
- I found this [StackOverflow](https://stackoverflow.com/a/70847509/11622001) not sure why it would be an issue with permissions, 
but doing it fixed the issue and from 5-10 seconds now it takes 1-2 seconds. (Also, make sure you don't have that many stuff in the zshrc file)

- I've disabled NVM and it'll only load if I call the command `nvm` with the following command instead of the default one from nvm:
```zsh
## START NVM ##
export NVM_DIR="$HOME/.nvm"
alias nvm="unalias nvm; [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@" # Custom: only load nvm upon first use, because it is slow

## END NVM ##
```
[Original Comment](https://github.com/ohmyzsh/ohmyzsh/issues/9055#issuecomment-837565602)

# Did it work?
Yeah, everything is fixed and I'm ok with it taking 1-2 seconds to load, I've got nvm (only enable it if I use the command), sdkman.io, fig.io, and homebrew.

# Edit (Aug 5th, 2022)
I have created the following alias to improve performance and only load sdkman.io when using it:
```zsh
## START SDKMAN ##
export SDKMAN_DIR="$HOME/.sdkman"
alias sdk="unalias sdk; [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"; sdk $@"
## END SDKMAN ##
```
Hope it helps ^^
