Colors = dofile(os.getenv('HOME') .. '/.config/conky/themes/xresources.lua')
conky = { }

conky.config = {
  -- settings
	background = false,
	update_interval = 1,
	cpu_avg_samples = 2,
	net_avg_samples = 2,
	double_buffer = true,
	no_buffers = true,
	text_buffer_size = 2048,

  -- position settings
	alignment = 'middle_middle',
	gap_x = 0,
	gap_y = 0,

  -- window settings
	minimum_height = 100,
	minimum_width = 490,
	own_window = true,
	own_window_type = 'desktop',
	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',

  -- transparency settings
  -- For full transparency, use own_window_color = '#000000' and own_window_argb_value = 0
	own_window_colour = '#000000',
	own_window_argb_visual = true,
  own_window_argb_value = 0,

  -- borders and outlines
	draw_borders = false,
	border_inner_margin = 20,
	border_outer_margin = 0,
	draw_graph_borders = false,
	draw_shades = false,
	draw_outline = false,

  -- font settings
  font="Noto Sans:size=12",
	override_utf8_locale = true,
	use_xft = true,
	xftalpha = 1,
	uppercase = false,

  -- define colors
	default_color = Colors.foreground,
	color0 = Colors.color0,
	color1 = Colors.color1,
	color2 = Colors.color2,
	color3 = Colors.color3,
	color4 = Colors.color4,
	color5 = Colors.color5,
	color6 = Colors.color6,
	color7 = Colors.color7,
	color8 = Colors.color8,
	color9 = '#d0d0d0',
}

conky.text = [[
${color9}${alignc}${font Noto Sans:size=70:style=Bold}${time %I} ${font Noto Sans:size=70:style=Thin}: ${time %M} ${font Noto Sans:size=30:style=Bold}${time %p}
${hr}
${alignc}${font Noto Sans:size=40}${time %d %B}
${alignc}${font Autumn in November:size=50}${time %A}
]]
