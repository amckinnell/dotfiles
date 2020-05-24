IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = '~/.irb-history'

def tdc(id_or_name)
  account = Account.find_by("name ILIKE CONCAT('%', ?, '%')", id_or_name) ||
    Account.find_by(id: id_or_name)

  if account
    account.set_schema_search_path
    STDOUT.puts "Using account '#{account.name}'"
  else
    STDOUT.puts "Can't find any account given '#{id_or_name}'"
  end
end
