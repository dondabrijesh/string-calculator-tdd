def add(numbers)
    return 0 if numbers.empty?
    # Convert numbers into the array format for 
    number_list = numbers.gsub("\n", ",").split(",").map(&:to_i)
    negatives = number_list.select { |num| num < 0 }
    raise "Negatives not allowed: #{negatives.join(", ")}" unless negatives.empty?
    number_list.reduce(:+)
end