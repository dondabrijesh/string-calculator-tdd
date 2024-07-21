def add(numbers)
    return 0 if numbers.empty?
    if numbers.start_with?("//")
        parts = numbers.split("\n", 2) #split the numbers
        delimiter_section = parts[0][2..-1]
        delimiters = delimiter_section.scan(/\[(.*?)\]/).flatten
        numbers = parts[1]
        delimiters.each { |delim| numbers.gsub!(delim, ",") }
    end
    # Convert numbers into the array format for better iteration and manipulation
    number_list = numbers.gsub("\n", ",").split(",").map(&:to_i)
    negatives = number_list.select { |num| num < 0 }
    raise "Negatives not allowed: #{negatives.join(", ")}" unless negatives.empty?
    number_list.reduce(:+)
end