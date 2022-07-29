fx_version 'adamant'
games { 'gta5' };

lua54 'yes'

dependency 'dpemotes'

client_script "@dpemotes/Client/Emote.lua"

client_scripts {
    "@dpemotes/Config.lua",
    "@dpemotes/Client/AnimationList.lua",
    "@dpemotes/Client/Emote.lua",
}


client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
    "services/xSound/client/*.lua",
    "client/client.lua",
}

client_scripts {
    "config.lua",
    "client.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "config.lua",
    "server.lua",
}

ui_page 'services/xSound/html/index.html'

files {
    'services/xSound/html/index.html',
    'services/xSound/html/jquery.js',
    'services/xSound/html/nui.js',
    'services/xSound/html/ytListener.js',
    'services/xSound/html/ytPlayer.js',
}

shared_scripts {
    "config.lua",
    "shared/utils.lua",
}

escrow_ignore {
    'config.lua',
}
