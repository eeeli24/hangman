module Hangman
  class Game
    attr_accessor :letter, :cipher, :steps, :word

    def initialize(word = Word.new)
      @instance = word
      @word = @instance.word
      @cipher = @instance.hidden
      @letter = ''
      @steps = cipher.length + 2
    end

    def get_letter
      print "Letter: "
      @letter = gets.chomp.downcase
    end

    def check_for_match(letter)
      if !@word.include?(letter)
        puts "Word doesn't include '#{letter}'."
      else
        show_letter_in_word(letter)
      end
    end

    def show_letter_in_word(letter)
      @word.chars.each_with_index do |char, index|
        @cipher[index] = letter if char == letter
      end
      @cipher
    end

    def save
      savefile = File.open('save/save.yaml', 'w') { |f| f.write(YAML::dump(self)) }
      puts "Game saved!"
    end

    def load
      yaml = nil
      savefile = File.open('save/save.yaml', 'r') { |f| yaml = f.read}
      load = YAML::load(yaml)
      @word = load.word
      @cipher = load.cipher
      @steps = load.steps
      puts "\n\nGame loaded!"
    end

    def play
      puts "Guess the word."
      puts "Type 'load' to load a saved game"
      (@steps).downto(1) do |step|
        @steps = step
        puts "You have #{@steps} tries. Type 'save' to save the game.\n\n#{@cipher}"
        puts get_letter
        if @letter == 'save'
          self.save
          puts get_letter
        elsif @letter == 'load'
          self.load
          self.play
          break
        end
        check_for_match(@letter)
        if !@cipher.include?('_')
          puts "You won! The word was '#{@cipher}'."
          break
        elsif @cipher.include?('_') && @steps == 0
          puts "The word was '#{@word}'."
        end
      end
    end
  end
end