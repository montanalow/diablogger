class String
  def cssify
    ((self.downcase.gsub "::", '_').gsub 'public_', '').gsub '_html', ''
  end
end