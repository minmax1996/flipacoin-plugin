" Title:        FlipACoin Plugin
" Description:  A plugin to provide a flip coin functionality 
" Last Change:  31 February 2023
" Maintainer:   Maxim Minaev <https://github.com/minmax1996>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_exampleplugin")
    finish
endif
let g:loaded_exampleplugin = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
" let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/flipacoin-plugin/deps"
" exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

command! -nargs=0 FlipACoin lua require("flipacoin-plugin").flip()
