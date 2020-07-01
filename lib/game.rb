class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors
    @user_guesses - normalize_letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result =
      @letters.map do |letter|
        if @user_guesses.include?(normalize_letter(letter))
          letter
        else
          nil
        end
      end
    result
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(normalize_letter(letter))
      @user_guesses << letter
    end
  end

  def won?
    (normalize_letters - @user_guesses).empty?
  end

  def lost?
    errors_allowed == 0
  end

  def word
    @letters.join
  end

  def normalize_letter(letter)
    result =
      if letter == 'Ё'
        'Е'
      elsif letter == 'Й'
        'И'
      else
        letter
      end
    result
  end

  def normalize_letters
    @letters.map { |letter| normalize_letter(letter) }
  end
end
