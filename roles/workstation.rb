name        'workstation'
description 'role for my development workstations'
run_list    'recipe[workstation::default]',
            'recipe[workstation::tmux]'

