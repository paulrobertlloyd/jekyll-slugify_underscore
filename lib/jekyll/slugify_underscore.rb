module Jekyll
  module Utils
    # https://github.com/jekyll/jekyll/blob/master/lib/jekyll/utils.rb

    # Slugify a filename or title.
    #
    # string - the filename or title to slugify
    # mode - how string is slugified
    # cased - whether to replace all  uppercase letters with their
    # lowercase counterparts
    #
    # When mode is "none", return the given string.
    #
    # When mode is "raw", return the given string,
    # with every sequence of spaces characters replaced with a hyphen.
    #
    # When mode is "default" or nil, non-alphabetic characters are
    # replaced with a hyphen too.
    #
    # When mode is "pretty", some non-alphabetic characters (._~!$&'()+,;=@)
    # are not replaced with hyphen.
    #
    # If cased is true, all uppercase letters in the result string are
    # replaced with their lowercase counterparts.
    #
    # Examples:
    #   slugify("The _config.yml file")
    #   # => "the-config-yml-file"
    #
    #   slugify("The _config.yml file", "pretty")
    #   # => "the-_config.yml-file"
    #
    #   slugify("The _config.yml file", "pretty", true)
    #   # => "The-_config.yml file"
    #
    # Returns the slugified string.
    def slugify(string, mode: nil, cased: false)
      mode ||= 'default'
      return nil if string.nil?

      unless SLUGIFY_MODES.include?(mode)
        return cased ? string : string.downcase
      end

      # Replace each character sequence with a hyphen
      re = case mode
      when 'raw'
        SLUGIFY_RAW_REGEXP
      when 'default'
        SLUGIFY_DEFAULT_REGEXP
      when 'pretty'
        # "._~!$&'()+,;=@" is human readable (not URI-escaped) in URL
        # and is allowed in both extN and NTFS.
        SLUGIFY_PRETTY_REGEXP
      end

      slug = string.
        # Strip according to the mode
        gsub(re, '_').
        # Remove leading/trailing hyphen
        gsub(/^\_|\_$/i, '')

      cased ? slug : slug.downcase
    end
  end
end
