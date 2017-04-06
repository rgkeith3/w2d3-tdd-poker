class Array
  def my_uniq
    results = []
    self.each {|el| results << el unless results.include?(el)}
    results
  end

  def two_sum
    pairs = []
    i = 0
    while(i < length - 1)
      j = i + 1
      while(j < length)
        pairs << [i,j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    pairs
  end

  def my_transpose
    rows = self.length
    columns = self[0].length
    results = Array.new(columns) { Array.new(rows) }
    columns.times do |i|
      rows.times do |j|
        results[i][j] = self[j][i]
      end
    end
    results
  end

  def stock_picker
    self.map.with_index do |day, i|
      sub_days = self[i + 1..-1]
      sub_days.map.with_index do |sub_day, j|
        day_diffs = [sub_day - day, [i, i + (j + 1)]]
      end
    end
    .flatten(1)
    .reduce {|high_day, day| high_day.first < day.first ? day : high_day }
    .last
  end

end
