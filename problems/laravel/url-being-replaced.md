# Problem

My URLs keep getting replaced, like if I have laravel.test:9090 and I have enabled HMR, the url is changed to laravel.test:8080:9090.

# Solution

BrowserSYNC is messing with the urls, just remove your Virtual Domain or browsersync from the settings, that'll fix the issue.
(This only happens with laravel mix, no idea if it happens with vite)
