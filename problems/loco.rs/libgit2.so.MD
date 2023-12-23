# Problem
When setting up loco.rs in ubuntu I got this error:
```
loco: error while loading shared libraries: libgit2.so.1.7: cannot open shared object file: No such file or directory

```
# Solution
Just re-install loco.rs using `cargo install loco-cli`. After reinstalling you'll have it working :)
