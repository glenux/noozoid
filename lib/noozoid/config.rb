
module Noozoid
  module Config
    HELP_KEYS = [
      [:nav_parent,  'Navigate to parent'],
      [:nav_child,   'Navigate to child' ],
      [:nav_next,    'Navigate to next sibling'],
      [:nav_previous,    'Navigate to previous sibling'],
      [:nav_root,    'Navigate to tree root'],
      [:node_create, 'Create node'],
      [:node_delete, 'Delete selected node'],
      [:node_toggle, 'Toggle node'],
      [:main_help,   'Show this help'],
      [:main_quit,   'Exit program']
    ]

    DEFAULT_KEYS = {
      nav_parent:   'h',
      nav_child:    'l',
      nav_next:     'j',
      nav_previous: 'k',
      nav_root:     'r',
      node_create:  'a',
      node_delete:  'd',
      node_toggle:  'v',
      main_quit:    'q',
      main_help:    '?'
    }
  end
end
