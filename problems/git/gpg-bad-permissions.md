# Problem
I'm getting the output `gpg: WARNING: unsafe permissions on homedir '/Users/fran/.gnupg'` when using `echo "test" | gpg --clearsign`

# Solution

Run the following commands:
```sh
chown -R $(whoami) ~/.gnupg # Sets the owenr of the directory
find ~/.gnupg -type f -exec chmod 600 {} \; # Set 600 for files
find ~/.gnupg -type d -exec chmod 700 {} \; # Set 700 for directories
```

[Original Comment](https://gist.github.com/oseme-techguy/bae2e309c084d93b75a9b25f49718f85)
