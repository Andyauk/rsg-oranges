# RexshackGaming

- discord : https://discord.gg/s5uSk56B65
- github : https://github.com/Rexshack-RedM

# Dependancies

- rsg-core
- ox_lib

# Installation

- simple pick and delivery System

- ensure that the dependancies are added and started
- add rsg-oranges to your resources folder

# Starting the resource

- add the following to your server.cfg file : ensure rsg-oranges

# pick and delivery System

- todo, animation on picking.

- you will need to add orange in your rsg-core\shared items
    ['orange']        = {['name'] = 'orange',        ['label'] = 'Orange',    ['weight'] = 125, ['type'] = 'item', ['image'] = 'bread.png',        ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'an orange', ["created"] = nil, ["decay"] = 1.0, ["delete"] = true},

and add your own image for bread.png to orange.png

- you could also if you wanted make them so you can eat them in rsg-essentials config

    ["orange"] = math.random(10, 20),

# Credits

- andyauk
- dagibbet
