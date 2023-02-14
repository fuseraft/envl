# Envl (.env loader)
A simple environment variable loader that reads `.env` files into [`ENV`](https://docs.ruby-lang.org/en/master/ENV.html).

# Installation
```
gem install envl
```

# Usage

`Envl#auto_load` - Finds and loads `.env` files in the current directory into `ENV`.
```ruby
require 'envl'

Envl.auto_load
```

`Envl#load` - Loads an array of `.env` files into `ENV`.
```ruby
require 'envl'

Envl.load(['../app.env', 'settings.env'])
```

`Envl#load_single` - Loads a single `.env` file into `ENV`.
```ruby
require 'envl'

Envl.load_single('../app.env')
```

`Envl#load_path` - Finds and loads `.env` files in a specific directory into `ENV`.
```ruby
require 'envl'

Envl.load_path('..')
```

`Envl#get_loaded_vars` - Returns all keys loaded into `ENV`.
```ruby
require 'envl'

Envl.auto_load
Envl.get_loaded_vars.each {|v| puts "#{v}: #{ENV[v]}"}
```
