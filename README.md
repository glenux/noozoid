# Noozoid

![Build](https://github.com/glenux/draft-noozoid/workflows/Build/badge.svg?branch=master)
[![GitHub license](https://img.shields.io/github/license/glenux/draft-noozoid.svg)](https://github.com/glenux/draft-noozoid/blob/master/LICENSE.txt)
[![Donate on patreon](https://img.shields.io/badge/patreon-donate-orange.svg)](https://patreon.com/glenux)

A terminal-based mindmap editor for geeks.

The name of the project comes from the Greek words _νους_ (mind) and  _ζούδι_ (small animal).

For now, It is a toy project to improve author's skills with the language and its various libraries. **It is very early stage and is not supposed to work (yet). Please don't use it in production.** :warning:


## Installation

Make sure you have the latest version of crystal (0.35.x)

Build the project

    $ make build

## Usage

### Running noozoid

In your terminal:

    $ _build/noozoid

### Keyboard control (vim-like)

| Key | Description |
|---|--|
| h | Navigate to parent |
| l | Navigate to child |
| k | Navigate to previous sibling |
| j | Navigate to next sibling |
| r | Navigate to tree root |
| c | Create node |
| i | Edit node |
| d | Delete/Cut selected node |
| p | Paste node as a child of selected node |
| v | Toggle node |
| ? | Show this help |
| q | Exit program |


## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/glenux/draft-noozoid>.

## License

Noozoid is Copyright © 2021 Glenn ROLLAND. It is free software, and may be redistributed under the terms specified in the LICENSE.txt file.



