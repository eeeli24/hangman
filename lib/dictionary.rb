module Hangman
  class Dictionary

    def self.get_dictionary
      dictionary = []
      File.readlines('lib/5desk.txt').each do |line|
        dictionary << line.chomp.downcase if line.chomp.length.between?(5,12)
      end
      dictionary
    end
  end
end
