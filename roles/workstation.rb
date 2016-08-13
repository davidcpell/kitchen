name        'workstation'
description 'role for my development workstations'
run_list    'recipe[workstation::default]',
            'recipe[workstation::tmux]',
            'recipe[workstation::dotfiles]',
            'recipe[workstation::vim]',
            'recipe[ruby::rbenv]',
            'recipe[ruby::ruby-build]',
            'recipe[ruby]'

