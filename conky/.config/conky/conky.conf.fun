-- Conky, a system monitor https://github.com/brndnmtthws/conky
--
-- This configuration file is Lua code. You can write code in here, and it will
-- execute when Conky loads. You can use it to generate your own advanced
-- configurations.
--
-- Try this (remove the `--`):
--
--   print("Loading Conky config")
--
-- For more on Lua, see:
-- https://www.lua.org/pil/contents.html

--[[
    http://conky.sourceforge.net/docs.html
    http://conky.sourceforge.net/variables.html
    https://linuxconfig.org/ubuntu-20-04-system-monitoring-with-conky-widgets
    https://github.com/brndnmtthws/conky/wiki
    https://cairographics.org/manual/
]]
conky.config={
    alignment='top_right',
    background=false,
    color1='A9A9A9',
    color2='616161',
    color3='313131',
    cpu_avg_samples=4,
    default_color='FFFFFF',
    default_outline_color='black',
    default_shade_color='333333',
    double_buffer=true,
    draw_borders=false,
    draw_graph_borders=false,
    draw_outline=false,
    draw_shades=false,
    font='Ubuntu:style=medium:pixelsize=13',
    gap_x=56,
    gap_y=0,
    lua_load="~/.config/conky/conky.lua",
    lua_draw_hook_post="conky_main",
    maximum_width=300,
    minimum_height=10,
    minimum_width=300,
    net_avg_samples=2,
    no_buffers=true,
    override_utf8_locale=true,


    own_window_class='conky',

    own_window_argb_value=0,
    own_window_argb_visual=true,
    own_window_colour='000000',
    own_window_hints='undecorated,below,skip_taskbar,skip_pager',
    own_window_transparent=true,
    own_window_type='desktop',
    own_window=true,
    text_buffer_size=2048,
    total_run_times=0,
    update_interval=3,
    uppercase=false,
    use_xft=true,
    xftalpha=.1,
}

conky.text=[[

${color1}

${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}CPU${alignr}${cpu cpu0}% / ${if_match "${hwmon 4 temp 2}">="90"}${color red}${hwmon 4 temp 2}°${color}${else}${hwmon 4 temp 2}°${endif} / ${if_match "${hwmon 4 temp 4}">="90"}${color red}${hwmon 4 temp 4}°${color}${else}${hwmon 4 temp 4}°${endif}
${color2}${cpugraph cpu0 50,299 5e7b7b d8deeb -t}
${color3}${hr}

${color1}${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}Disk${alignr}${fs_free} free / ${fs_size}
${color2}${diskiograph_read 50,145}${alignr}${diskiograph_write 50,145}
${color3}${hr}

${color1}${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}Network

${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}${if_match "${addr enp0s25}"!="No Address"}${addr enp0s25}${endif}${if_match "${addr wlp3s0}"!="No Address"}${addr wlp3s0}${endif}${alignr}${font Font Awesome 5 Free:style=Solid:pixelsize=13} ${font} ${execi 3600 curl ipinfo.io/ip}
${if_match "${addr enp0s25}"!="No Address"}${color1}${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}${downspeedf enp0s25}k/s (${totaldown enp0s25})${alignr}${font Font Awesome 5 Free:style=Solid:pixelsize=13} ${font} ${upspeedf enp0s25}k/s (${totalup enp0s25})${endif}
${if_match "${addr wlp3s0}"!="No Address"}${color1}${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}${downspeedf wlp3s0}k/s (${totaldown wlp3s0})${alignr}${font Font Awesome 5 Free:style=Solid:pixelsize=13} ${font} ${upspeedf wlp3s0}k/s (${totalup wlp3s0})${endif}

${color3}${hr}

${color1}${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}System

${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}${if_match "${hwmon 3 temp 1}">="90"}${color red}${hwmon 3 temp 1}°${color}${else}${hwmon 3 temp 1}°${endif}${goto 100}${font Font Awesome 5 Free:style=Solid:pixelsize=13} ${font} ${hwmon 3 fan 1} rpm${alignr}${font Font Awesome 5 Free:style=Solid:pixelsize=13} ${font} ${uptime}
${font DejaVu Sans Mono:pixelsize=12}
${color1}Process${alignr}PID   %CPU   %MEM${color2}
${top name 1}${alignr}${top pid 1} ${top cpu 1} ${top mem 1}
${top name 2}${alignr}${top pid 2} ${top cpu 2} ${top mem 2}
${top name 3}${alignr}${top pid 3} ${top cpu 3} ${top mem 3}
${top name 4}${alignr}${top pid 4} ${top cpu 4} ${top mem 4}
${top name 5}${alignr}${top pid 5} ${top cpu 5} ${top mem 5}
${top name 6}${alignr}${top pid 6} ${top cpu 6} ${top mem 6}
${top name 7}${alignr}${top pid 7} ${top cpu 7} ${top mem 7}
${top name 7}${alignr}${top pid 8} ${top cpu 8} ${top mem 8}

${color3}${hr}

${color1}${font Font Awesome 5 Free:style=Solid:pixelsize=13}${font}${goto 30}Backup




]]
