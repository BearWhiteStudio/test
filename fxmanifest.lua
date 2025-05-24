fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokPoliceJob'
version '1.2.9'

ui_page 'web/ui.html'

files{
	'*.json',
	'stream/*.*',
	'web/*.*'
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
    'locales/*.lua'
}

client_scripts {
	'cl_utils.lua',
	'client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'sv_utils.lua',
	'server.lua',
}

lua54 'yes'

escrow_ignore {
	'config.lua',
	'sv_utils.lua',
	'cl_utils.lua',
	'locales/*.lua',
}

dependencies { 'ox_lib' }

data_file 'DLC_ITYP_REQUEST' 'stream/okok_police.ytyp'
dependency '/assetpacks'