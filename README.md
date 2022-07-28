# My nvim config

## It is the first version and it is still under production, so this MD will not have much useful info, but it will be updated soon ;)

### Before we start, I need to mention, that this config has been set up for MacOS and it has not been tested on other OS. So, lets start and we obviously should install some software and here is a short list of it:

- nvim
- nodejs and npm
- dotnet sdk
- Terminal (I personally use iTerm2, since default MacOS terminal does not work with themes)

#### Installations with NPM prior for this config to work

- prettierd
- eslint
- typescript
- vscode-langservers-extracted

#### Installations with BREW prior for this config to work

- cmake
- ripgrep
- terraform-ls
- stylua
- treesitter
- uncrustify

How to get started?

1. Install mentioned above modules
2. Open your nvim (it will automatically install packer and plugins)
3. After the message "Installing packer, press enter, then type N, and press enter again" press enter and then type "N" and press enter again. Now you can close and reopen you nvim
4. Setup Lsp Servers
   1. Run :LspInstallInfo
   2. In opened window select and install with (i) next languages:
      1. dockerls
      2. terraformls
      3. vimls
      4. yamlls
      5. cssls
      6. jsonls
      7. marksman
      8. sumneko_lua
      9. tsserver
      10. omnisharp
   3. Restart nvim
5. Please pay attention, that there might be an error with markdown-preview plugin installation. If it gives you an error on postinstall hook, just open dummy markdown file and run ´:call mkdp#util#install()´

### Some hotkeys

| Action                      | Hotkey |
| --------------------------- | ------ |
| Esc                         | jj     |
| Code Action                 | FF     |
| Format                      | F      |
| Go to Declaration           | gD     |
| Go to Definition            | gd     |
| Comment                     | gcc    |
| Go to next buffer           | L      |
| Go to previous buffer       | J      |
| Close current buffer        | Q      |
| Find files with Telescope   | ff     |
| Find buffers with Telescope | fb     |
| Show live grep              | fg     |
| Toggle Nvim tree            | CTRL-t |
| Remove complettion window   | CTRL-e |
