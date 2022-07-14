# Problem
GPG Key not being saved into the macOS Keychain

# Solutions
1. Install the following packages with brew:
```sh
brew install gpg pinentry-mac
```
2. If you haven't created the `~/.gnupg` directory use the following command:
```sh
mkdir -m 0700 ~/.gnupg
```
3. Then create the config with the following command (and kill the gpg agent):
```sh
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" | tee ~/.gnupg/gpg-agent.conf
pkill -TERM gpg-agent
```
4. Open the modal to save your passphrase into the keychain with the following command:
```sh
echo "test" | gpg --clear-sign
```


> You should see something similar to this modal (with your own data/credentials):
> ![image](https://user-images.githubusercontent.com/30329003/179096254-acfd249d-5b24-4e1b-99b8-f30994a46fbe.png)
>
> Make sure to have selected the save to keychain check

5. Feel free to run the command in step 4 to check if the key is saved after restarting your mac

[Original Comment](https://gist.github.com/koshatul/2427643668d4e89c0086f297f9ed2130)

# Did it work?
Yep!
