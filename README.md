# Envl (.env loader)
A simple environment variable loader that reads `.env` files into [`ENV`](https://docs.ruby-lang.org/en/master/ENV.html).

You can find the gem here: [Envl](https://rubygems.org/gems/envl)

# Installation
```
gem install envl
```

# Usage
Add a `require` to your `.rb` file.
```ruby
require 'envl'

# Automatically load .env file in current directory into ENV
Envl.auto_load
```

# Methods
`Envl#auto_load`: Finds and loads `.env` files in the current directory into `ENV`.

`Envl#keys`: Returns all keys loaded into `ENV` via `Envl`.

`Envl#load`: Loads an array of `.env` files into `ENV`.

`Envl#load_path`: Finds and loads `.env` files in a specific directory into `ENV`.

`Envl#load_single`: Loads a single `.env` file into `ENV`.

# More examples

Automatically loading `.env` files (if any exist in the current directory) into `ENV`.
```ruby
Envl.auto_load
```

Loading multiple `.env` files into `ENV`.
```ruby
Envl.load(['../app.env', 'settings.env'])
```

Loading `.env` files in a specific directory into `ENV`.
```ruby
Envl.load_path('..')
```

Loading a single specific `.env` file into `ENV`.
```ruby
Envl.load_single('../app.env')
```

Printing all loaded keys and values in `ENV` loaded by `Envl`.
```ruby
Envl.auto_load
Envl.keys.each {|v| puts "#{v}: #{ENV[v]}"}
```
