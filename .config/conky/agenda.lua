-- Make file '~/agendas.md' and edit it. I'm using catp so that it is parsed
-- by conky and hence, things like ${color color1}hello${color} are correctly parsed.

dofile(os.getenv('HOME') .. '/.config/conky/themes/xresources.lua')

conky.config = {
	background = false,
	update_interval = 1,

	cpu_avg_samples = 2,
	net_avg_samples = 2,

	double_buffer = true,
	no_buffers = true,
	text_buffer_size = 2048,
    
	alignment = 'bottom_middle',
	gap_x = 0,
	gap_y = 0,
	minimum_height = 100,
	minimum_width = 490,

	own_window = true,
	own_window_type = 'desktop',
	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    
	own_window_colour = colors.background,
	default_color = colors.foreground,
	own_window_argb_visual = true,
    own_window_argb_value = 200,

	border_inner_margin = 20,
	border_outer_margin = 0,
    
	draw_borders = false,
	draw_shades = false,
	draw_outline = false,
	draw_graph_borders = false,

    font="JetBrainsMono Nerd Font:size=13",
	override_utf8_locale = true,
	use_xft = true,
	xftalpha = 1,
	uppercase = false,

	color0 = colors.color0,
	color1 = colors.color1,
	color2 = colors.color2,
	color3 = colors.color3,
	color4 = colors.color4,
	color5 = colors.color5,
	color6 = colors.color6,
	color7 = colors.color7,
	color8 = colors.color8,
	color9 = colors.color9,
}

conky.text = [[
${font Monofur:size=30}${color1}A${color2}g${color3}e${color4}n${color5}d${color6}a${font}${color}

${catp ~/agendas.md}
]]
