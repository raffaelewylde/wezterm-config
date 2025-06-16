return {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {
      {
         name = 'WSL:Ubuntu',
         distribution = 'Ubuntu',
         username = 'wylde',
         default_cwd = '/home/wylde',
         default_prog = { 'bash', '-l' },
      },
      {
        name = 'WSL:Arch',
        distribution = 'Arch',
        username = 'root',
        default_cwd = '/root',
        default_prog = { 'bash', '-l' },
      },
   },
}
