require "cidr_regex/version"
require "netaddr"

module CIDRRegex
  def self.generate(cidr_str)
    cidr = NetAddr::CIDR.create(cidr_str)

    first = cidr.first.split('.')
    last = cidr.last.split('.')

    regex = '^'
    (0..3).each do |i|
      if first[i] == last[i]
        regex << first[i] << '\.'
        next
      end
      # The hard bit
      break
    end
    regex
  end
end
