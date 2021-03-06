call  defx#custom#option('_', {
    \ 'winwidth'           : 35,
    \ 'split'              : 'vertical',
    \ 'direction'          : 'topleft',
    \ 'buffer_name'        : 'exproler',
    \ 'resume'             : 1,
    \ 'listed'             : 1,
    \ 'toggle'             : 1,
    \ 'columns'            : 'indent:git:icons:filename:mark',
    \ 'show_ignored_files' : 0,
    \ 'ignored_files'      : '.DS_Store'
    \ })

call defx#custom#column('git', 'indicators', {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Ignored'   : '☒',
    \ 'Deleted'   : '✖',
    \ 'Unknown'   : '?'
    \ })

call defx#custom#column('git', 'show_ignored', 1)

call defx#custom#column('icon', {
    \ 'directory_icon' : '▸',
    \ 'opened_icon'    : '▾',
    \ 'root_icon'      : ' ',
    \ })

call defx#custom#column('mark', {
    \ 'readonly_icon' : '✗',
    \ 'selected_icon' : '✓',
    \ })
