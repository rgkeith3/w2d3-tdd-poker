class Hand
  attr_accessor :cards
  HAND_TYPES = [:high_card, :pair, :two_pair, :triple, :straight,
    :flush, :full_house, :four_kind, :straight_flush]

  def initialize cards=[]
    @cards = cards
  end

  def add card
    @cards << card
  end

  def discard array
    if array.length > 3 || !array.all?{|el| el.between?(0,4)}
      raise ArgumentError.new("what in tarnation")
    else
      array.each {|id| @cards[id] = nil}
      @cards = @cards.compact
    end
  end

  def type
    if straight? && flush?
      return :straight_flush
    elsif four_kind?
      return :four_kind
    elsif triple? && pair?
      return :full_house
    elsif flush?
      return :flush
    elsif straight?
      return :straight
    elsif triple?
      return :triple
    elsif !pair?.nil? && pair?.length == 2
      return :two_pair
    elsif !pair?.nil? && pair?.length == 1
      return :pair
    else
      return :high_card
    end
  end

  def rank
    base = HAND_TYPES.index(type) * 1_000_000

    case type
    when :straight_flush
      base += @cards.map(&:value).max
    when :four_kind
      four_kind = four_kind?
      other = @cards.map(&:value).reject{|val| val == four_kind.first }
      base += other.first
    when :full_house
      base += triple?.first * 13 + pair?.first
    when :flush
      base += multiplier(@cards.map(&:value).sort{|a,b| b <=> a})
    when :straight
      base += @cards.map(&:value).max
    when :triple
      triple = triple?
      others = @cards.map(&:value).reject{|val| val == triple.first }.sort{|a,b| b <=> a}
      base += multiplier(triple + others)
    when :two_pair, :pair
      pairs = pair?.sort {|a,b| b <=> a}
      other = @cards.map(&:value).reject{|val| pairs.include?(val)}.sort {|a,b| b <=> a}
      base += multiplier(pairs + other)
    when :high_card
      base += multiplier(@cards.map(&:value).sort{|a,b| b <=> a})
    end

    return base
  end

  def multiplier arr_val
    arr_val.map{|val| val.to_s(13)}.join('').to_i(13)
  end

  def pair?
    contains_pairs = count_cards.values.any? {|count| count == 2}
    contains_pairs ? count_cards.select {|k,v| v == 2 }.keys : nil
  end

  def count_cards
    count_obj = @cards.reduce({}) do |obj, card|
      obj[card.value] ||= 0
      obj[card.value] += 1
      obj
    end
  end

  def four_kind?
    contains_pairs = count_cards.values.any? {|count| count == 4}
    contains_pairs ? count_cards.select {|k,v| v == 4 }.keys : nil
  end

  def triple?
    contains_pairs = count_cards.values.any? {|count| count == 3}
    contains_pairs ? count_cards.select {|k,v| v == 3 }.keys : nil
  end

  def straight?
    sorted = @cards.sort {|a,b| a.value <=> b.value }
    sorted.each_cons(2).all? {|a, b| a.value + 1 == b.value}
  end

  def flush?
    @cards.each_cons(2).all? {|a, b| a.suite == b.suite }
  end
end
