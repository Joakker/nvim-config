require('neorg').setup {
    load = {
        ['core.defaults'] = {},
        ['core.norg.concealer'] = {
            config = {
                icons = {
                    headings = {
                        enabled = true,
                        level_3 = {
                            enabled = true,
                            icon = '',
                        },
                    },
                },
            },
        },
        ['core.norg.dirman'] = {
            config = {
                workspace = {
                    my_workspace = '~/Documents/norg',
                },
            },
        },
        ['core.norg.completion'] = {
            config = {
                engine = 'nvim-compe',
            },
        },
    },
}
