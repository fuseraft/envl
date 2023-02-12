# A simple environment variable loader that reads .env files.

class Envl
    @@loaded_vars = []

    # automatically finds all .env files and loads them into ENV.
    def self.auto_load
        files = ['*.env', '*.env.*'].map { |s| Dir.glob(s, File::FNM_CASEFOLD) }.flatten.uniq
        self.load(files)
    end

    def self.get_loaded_vars
        @@loaded_vars
    end

    # accepts an array of .env files and load thems into ENV.
    def self.load(files)
        @@loaded_vars = []
        files.each do |f|
            self.load_file(f)
        end
        ENV
    end

    # loads a single .env file into ENV. 
    def self.load_file(file)
        begin
            return if not ['.env'].include? File.extname(file).downcase 

            File.readlines(file).each do |line|
                tokens = line.split('=').map {|s| s.strip }
                if tokens.size > 1 and not tokens[0].nil? and not tokens[1].nil?
                    key = tokens[0].strip
                    value = tokens[1].gsub("'", '')
                    ENV[key] = value
                    @@loaded_vars << key
                end
            end
        rescue => error
            # handle gracefully.
        end
    end
end