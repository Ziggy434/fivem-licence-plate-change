fx_version 'cerulean'
game "gta5"

author 'Ziggy'
description 'Licence Plate Stuffs'
version '1.0.0'

-- What to run
client_scripts {
    'cl.lua',
    'dependencies/client/main.lua'
}

files {
    "dependencies/html/**.*"
}

ui_page "dependencies/html/ui.html"