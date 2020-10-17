IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = '~/.irb-history'

def load(condition = :always, &block)
  case condition
  when :always
    block.call
  when :rails
    block.call if ENV['RAILS_ENV']
  when :irb
    block.call unless ENV['RAILS_ENV']
  end
rescue Exception => ex
  puts ex
end

load(:irb) do
  require 'whats_up/classic'

  # Fix whats_up for rails console
  blacklist = WhatsUp::MethodFinder.class_variable_get("@@blacklist")
  blacklist += Object.instance_methods
  WhatsUp::MethodFinder.class_variable_set("@@blacklist", blacklist)
end

load(:rails) do
  include FactoryBot::Syntax::Methods
rescue Exception => ex
  puts ex
end

load do
  # Predefine hash and array instances for convenience
  H = { bob: 'Bob', mom: 'Mom', gods: 'Gos', chris: 'Chris' }
  A = H.keys
end
