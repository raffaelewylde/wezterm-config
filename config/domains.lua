local wezterm = require('wezterm')
local hostname = wezterm.hostname()
local platform = require('utils.platform')

if platform.is_linux then
   local config = {
      -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
      ssh_domains = {
         {
            name = 'macbook',
            remote_address = '192.168.2.10',
            username = 'wylde',
            timeout = 120,
            multiplexing = 'WezTerm',
         },
      },
      -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
      unix_domains = {
         {
            name = 'unix',
            socket_path = '/home/wylde/.local/share/wezterm/sock',
         },
      },
   }

   -- Add `unix_domains` conditionally for WSL-related hostnames
   if hostname == 'ubuntu-wsl' or hostname == 'parrot-wsl' then
      table.insert(config.unix_domains, {
         name = 'wsl',
         socket_path = '/mnt/c/Users/Shadow/.local/share/wezterm/sock',
         skip_permissions_check = true,
      })
   end

   return config
elseif platform.is_mac then
   return {
      -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
      ssh_domains = {
         {
            name = 'Parrot',
            remote_address = '192.168.2.21',
            username = 'wylde',
            timeout = 120,
            multiplexing = 'WezTerm',
         },
      },
   }
elseif platform.is_win then
   return {
      -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
      ssh_domains = {},
      -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
      unix_domains = {
         {
            name = 'unix',
         },
      },
      -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
      wsl_domains = {
         {
            name = 'WSL:Ubuntu',
            distribution = 'Ubuntu',
            username = 'wylde',
            default_cwd = '/home/wylde',
            default_prog = { 'fish', '-l' },
         },
         {
            name = 'WSL:Parrot',
            distribution = 'Parrot',
            username = 'root',
            default_cwd = '/root',
            default_prog = { 'zsh', '-l' },
         },
      },
   }
end
