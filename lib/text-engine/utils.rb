module Utils
  def normalize_array(array, separator)
    array.join(" ").downcase.split(separator).map(&:strip).map do |value|
      value.split.reverse.uniq.reverse.join(" ").strip
    end
  end
end
