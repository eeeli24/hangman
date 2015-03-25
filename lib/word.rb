module Hangman
  class Word
    attr_reader :word

    def initialize(dictionary = Dictionary.get_dictionary)
      @dictionary = dictionary
      @word = dictionary.sample
    end

    def hidden
      word.chars.map { |char| char = "_"}.join
    end

  end
end