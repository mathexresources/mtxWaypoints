# mtxWaypoints
Fivem Script for quick respawn points using ox_lib
---
## Note
This script is in beta, feel free to report bugs or reccomendations in my discord or in issues and pull requests
Discord: MatheX#4910

## Usage
This script was done mainly for Drift or Freeroam servers, every player can set their temporary respawn points and then use it with usage of just one key to tp back to it, this come in super handy for some stunts etc.

## Installation
> Make sure you have ox_lib installed on your server<br>
> Download the package<br>
> Put it somewhere into `resources` folder<br>
> Go to `server.cfg` and write `ensure mtxWaypoints`<br>
> Edit config file to serve your purposes<br>

## For devs
There is just very simple client event `mtxRespawn:toggleTp` and the first value is either true or false, you can use this for example in races.
Feel free to edit this script, just please be respectful to the authorship and keep me as author in `fxmanifest.lua`
