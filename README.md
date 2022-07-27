# My nvim config

## It is the first version and it is still under production, so this MD will not have much useful info, but it will be updated soon ;)

### Before we start, I need to mention, that this config has been set up for MacOS and it has not been tested on other OS. So, lets start and we obviously should install some software and here is a short list of it:

- nvim
- nodejs and npm
- dotnet sdk

#### Installations with NPM prior for this config to work

- prettierd
- dockerfile-language-server-nodejs
- eslint
- typescript
- typescript-language-server
- vscode-langservers-extracted
- yaml-language-server

#### Installation with BREW prior for this config to work

- cmake
- ripgrep
- terraform-ls
- stylua
- treesitter
- uncrustify

How to get started?

1. Install mentioned above modules
2. Open your nvim (it might be throwing dozens of errors for now) and run :PlugInstall
3. Setup Lsp Servers
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
