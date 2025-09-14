local wezterm = require('wezterm')
local platform = require('utils.platform')
local font_family
local font_size
-- local font = 'Maple Mono SC NF'
if platform.is_mac or platform.in_linux then
   font_family = 'JetBrainsMono Nerd Font'
   font_size = 12
elseif platform.is_win then
   font_family = "CaskaydiaCove Nerd Font"
   font_size = 14
-- elseif platform.is_linux then
--   font_family = 'JetBrainsMono Nerd Font'
--   font_size = 12
end
return {
   font = wezterm.font({
      family = font_family,
      weight = 'Medium',
   }),
   font_size = font_size,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
