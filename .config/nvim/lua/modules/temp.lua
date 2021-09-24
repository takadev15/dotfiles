local config = require("deardiary.config")



config.journals = {
    {
        path = "~/dir/data/note/journal/personal",
        frequencies = {"daily", "weekly"},
    },
    {
        path = "~/dir/data/note/journal/work",
        frequencies = {"daily", "weekly", "monthly", "yearly"},
    },
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})
