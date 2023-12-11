# Problem
I was setting up flutter when it started to say that I had no lib gtk 3 configured (but I had it installed),
so I've started looking and found the command `pkg-config --modversion gtk+-3.0` which was telling me that `libgtk-3-dev`
was not properly configured.

# Solution
1. Use this command to find the config folder:
`dpkg -L libgtk-3-dev | grep '\.pc'`
2. Find the setting with `gtk+-3.0.pc`, in my case it was
`/usr/lib/x86_64-linux-gnu/pkgconfig/gtk+-3.0.pc`
3. Add the folder (`/usr/lib/x86_64-linux-gnu/pkgconfig` in this case) to the env PKG_CONFIG_PATH like this:
`export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH"`
4. Run the same command after setting up that env:
`pkg-config --modversion gtk+-3.0`
Now it should be showing the current version of libgtk-3


# Solution 2
1. Check if homebrew is configured with pkg-config:
`pkg-config --variable pc_path pkg-config` (The directories will contain homebrew locations)
2. Just install the same package using homebrew.
