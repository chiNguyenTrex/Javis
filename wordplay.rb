require_relative "./string"

class WordPlay
  def self.best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |sentence|
      words = sentence.downcase.words
      words.select{|word| desired_words.include? word}.length
    end
    ranked_sentences.last
  end

  def self.switch_pronouns(text)
    text.gsub(/\b(i am|you are|i|you|your|my|me)\b/i) do |pronoun|
      case pronoun.downcase
      when "i am"
        "you are"
      when "you are"
        "i am"
      when "i"
        "you"
      when "you"
        "me"
      when "your"
        "my"
      when "my"
        "your"
      when "me"
        "you"
      end
    end.sub(/(^|,\s*|do\s*|did\s*|have\s*)me\b/){|match| match.sub("me", "i")}
  end
end
