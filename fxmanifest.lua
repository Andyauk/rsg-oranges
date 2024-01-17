fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"

description 'rsg-oranges'
version '1.0.1'

client_scripts {
    'client/*.lua'
}
server_scripts {
    'server/*.lua'
}

shared_scripts {
	'@rsg-core/shared/locale.lua',
    'config.lua',
    '@ox_lib/init.lua'
}

dependencies {
    'rsg-core',
    'ox_lib'
}

lua54 'yes'
