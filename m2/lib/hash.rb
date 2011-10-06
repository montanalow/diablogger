require "active_support/core_ext/hash"

class Hash
  def keep *keys
    hash = {}
    keys.each do |key|
      if self.has_key? key
        hash[key] = self[key]
      end
    end
    hash
  end
end