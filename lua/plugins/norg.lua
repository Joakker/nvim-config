require('neorg').setup {
    load = {
        ['core.defaults'] = {},
        ['core.norg.concealer'] = {
            config = {
                icons = {
                    heading = {
                        enabled = true,

                        level_1 = {
                            enabled = true,
                            icon = '',
                        },
                        level_2 = {
                            enabled = true,
                            icon = '',
                        },
                        level_3 = {
                            enabled = true,
                            icon = '',
                        },
                    },
                },
            },
        },
        ['core.norg.completion'] = {
            config = {
                engine = 'nvim-cmp',
            },
        },
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    conlang = '~/Documents/conlang',
                },
            },
        },
    },
}
