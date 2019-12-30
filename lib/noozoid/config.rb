# frozen_string_literal: true

module Noozoid
  module Config
    HELP_KEYS = [
      [:nav_parent,   'Navigate to parent'],
      [:nav_child,    'Navigate to child'],
      [:nav_next,     'Navigate to next sibling'],
      [:nav_previous, 'Navigate to previous sibling'],
      [:nav_root,     'Navigate to tree root'],
      [:nav_none,     ''],
      [:node_create,  'Create node'],
      [:node_delete,  'Delete selected node'],
      [:node_toggle,  'Toggle node'],
      [:node_none,    ''],
      [:main_help,    'Show this help'],
      [:main_quit,    'Exit program']
    ].freeze

    DEFAULT_KEYS = {
      nav_parent: 'LEFT',
      nav_child: 'RIGHT',
      nav_next: 'DOWN',
      nav_previous: 'UP',
      nav_root: 'r',
      nav_none: '',
      node_create: 'a',
      node_delete: 'd',
      node_toggle: 'v',
      node_none: '',
      main_quit: 'q',
      main_help: '?'
    }.freeze
  end
end
