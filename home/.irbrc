IRB.conf[:AUTO_INDENT_MODE] = false
IRB.conf[:HISTORY_FILE] = '~/.irb-history'
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:USE_AUTOCOMPLETE] = false
IRB.conf[:USE_COLORIZE] = false

require "awesome_print"
AwesomePrint.irb!
