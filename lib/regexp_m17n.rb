class String
  alias_method :encode_old, :encode

  def encode(enc)
    begin
      self.encode_old(enc)
    rescue Encoding::ConverterNotFoundError
      puts "No converter shipped for #{enc}"
      '.'
    end
  end
end

module RegexpM17N
  def self.non_empty?(str)
    begin
      str =~ /^.+$/
    rescue Encoding::CompatibilityError
      puts "Regex.match incompatible with encoding #{str.encoding}"
      str.encode('UTF-8') =~ /^.+$/
    end
  end
end
