# A simple environment variable loader that reads .env files.

class Envl
    # automatically finds all .env files and loads them into ENV.
    def self.auto_load
        files = Dir.glob('*.env*', File::FNM_CASEFOLD)
        self.load(files)
    end

    # accepts an array of .env files and load thems into ENV.
    def self.load(files)
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
                tokens = line.split('=')
                if tokens.size > 1 and not tokens[0].nil? and not tokens[1].nil?
                    key = tokens[0].strip
                    value = tokens[1].gsub("'", '').gsub('"', '')
                    ENV[key] = value
                end
            end
        rescue => error
            # handle gracefully.
        end
    end
end