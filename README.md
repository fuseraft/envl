# envl
A simple environment variable loader that reads .env files into [ENV](https://docs.ruby-lang.org/en/master/ENV.html).

# installation
```
gem install envl
```

# example usage
```ruby
require 'envl'

Envl.auto_load
Envl.get_loaded_vars.each do |v|
    puts "#{v}: #{ENV[v]}"
end
```
