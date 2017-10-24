vim-fzy-rails
---
[![Travis CI](https://img.shields.io/travis/MaxMEllon/vim-fzy-rails/master.svg?style=flat-square&label=Travis%20CI)](https://travis-ci.org/MaxMEllon/vim-fzy-rails)
[![CircleCI](https://img.shields.io/circleci/project/github/MaxMEllon/vim-fzy-rails/master.svg?style=flat-square&label=Circle%20CI)](https://circleci.com/gh/MaxMEllon/vim-fzy-rails)
![Support Vim 8.0.0039 or above](https://img.shields.io/badge/support-Vim%208.0.0039%20or%20above-yellowgreen.svg?style=flat-square)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)
[![Doc](https://img.shields.io/badge/doc%20-%3Ah%20vim--fzy--rails-red.svg?style=flat-square)](./doc/vim-fzy-rails.txt)

**vim-fzy-rails is a plugin to find file on rails project by [fzy](https://github.com/jhawthorn/fzy) with in vim.**

Requirements
---
- Vim 8.0.0039 or above. (need `has('lambda')`)
- fzy 0.8 or above.
- Linux or macOS.

Usage
---

### Insallation

[Neobundle](https://github.com/Shougo/neobundle.vim) / [Vundle](https://github.com/gmarik/Vundle.vim) / [vim-plug](https://github.com/junegunn/vim-plug)

```vim
NeoBundle 'MaxMEllon/vim-fzy-rails'
Plugin 'MaxMEllon/vim-fzy-rails'
Plug 'MaxMEllon/vim-fzy-rails'
```

### Basic usage

```vim
nmap ,rc <Plug>(vim-fzy-rails_controllers)
nmap ,rm <Plug>(vim-fzy-rails_models)
nmap ,rv <Plug>(vim-fzy-rails_views)
nmap ,rd <Plug>(vim-fzy-rails_decorators)
nmap ,rp <Plug>(vim-fzy-rails_packs)
nmap ,rj <Plug>(vim-fzy-rails_javascripts)
nmap ,rsa <Plug>(vim-fzy-rails_stylesheets)
nmap ,rse <Plug>(vim-fzy-rails_serializers)
```

### Additional usages

Following you write next config, if you want to find a services layer `(ex. /app/services)`.

```vim
nmap ,rv :<C-u>call fzy#rails#base#call('/app/services')<CR>
```

You able to correspond original special layer using the `fzy#rails#base#call()` function.

Auther
---
- MaxMEllon (https://github.com/MaxMEllon)

LICENSE
---
- MIT License
