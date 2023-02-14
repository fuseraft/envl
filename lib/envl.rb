# A simple environment variable loader that reads .env files.

class Envl
    @@loaded_vars = []

    # Automatically finds all .env files and loads them into ENV.
    def self.auto_load
        files = ['*.env', '*.env.*'].map { |s| Dir.glob(s, File::FNM_CASEFOLD) }.flatten.uniq
        self.load(files)
    end

    # Returns true if a given file is a .env file.
    def self.is_env?(file)
        ext = File.extname(file).downcase
        name = File.basename(file).downcase
        ext.include? '.env' or name[name.index('.')..].include? '.env'
    end

    # Returns all keys loaded into ENV.
    def self.keys
        @@loaded_vars
    end

    # Finds and loads all .env files in a specific directory into ENV.
    def self.load_path(path)
        files = [File.join(path, '*.env'), File.join(path, '*.env.*')].map { |s| Dir.glob(s, File::FNM_CASEFOLD) }.flatten.uniq
        self.load(files)
    end

    # Loads a single .env file into ENV.
    def self.load_single(path)
        self.load([path])
    end

    # Accepts an array of .env files and load thems into ENV.
    def self.load(files)
        files.each do |f|
            self.load_env(f)
        end
        ENV
    end

    # Loads a single .env file into ENV. 
    def self.load_env(file)
        begin
            return if not self.is_env?(file)

            File.readlines(file).each do |line|
                tokens = line.split('=').map {|s| s.strip }
                if tokens.size > 1 and not tokens[0].nil? and not tokens[1].nil?
                    key = tokens[0].strip
                    value = tokens[1].gsub("'", '')
                    ENV[key] = value
                    @@loaded_vars << key if not @@loaded_vars.include? key
                end
            end
        rescue => error
            # handle gracefully.
        end
    end
end