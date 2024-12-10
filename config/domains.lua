local platform = require('utils.platform')
if platform.is_linux then
   return {
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
            no_serve_automatically = true,
         },
      },

      -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
      ---   wsl_domains = {
      --      {
      --         name = 'WSL:Ubuntu',
      --         distribution = 'Ubuntu',
      --         username = 'wylde',
      --         default_cwd = '/home/wylde',
      --         default_prog = { 'fish', '-l' },
      --      },
      --   },
   }
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
      -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
      unix_domains = {
         {
            name = 'unix',
            no_serve_automatically = true,
         },
      },

      -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
      ---   wsl_domains = {
      --      {
      --         name = 'WSL:Ubuntu',
      --         distribution = 'Ubuntu',
      --         username = 'wylde',
      --         default_cwd = '/home/wylde',
      --         default_prog = { 'fish', '-l' },
      --      },
      --   },
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
         {
            name = 'wsl',
            socket_path = '/mnt/c/Users/Shadow/.local/share/wezterm/sock',
            skip_permissions_check = true,
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
