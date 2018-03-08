require "minitest/autorun"
require_relative "wordplay"

class WordPlayTest < Minitest::Test
  def test_sentences
    assert_equal ["a", "b", "c d", "e ef g"], "a. b? c d! e ef g.".sentences
    text = "Hello! This is a test of sentence separation. This is the end of the test"
    expected_sentences = [
      "Hello",
      "This is a test of sentence separation",
      "This is the end of the test"
    ]
    assert_equal expected_sentences, text.sentences
  end

  def test_words
    assert_equal %w{this is a test}, "this is a test".words
    assert_equal %w{these are mostly words}, "these are, mostly, words".words
  end

  def test_sentence_choice
    hot_words = %w[test great this]
    sentences = ["This is a test", "This is another test", "This is a great test"]
    assert_equal "This is a great test", WordPlay.best_sentence(sentences, hot_words)
    assert_equal "This is a great test",
      WordPlay.best_sentence(["This is a great test"], %w[still the best])
  end

  def test_switch_pronouns
    assert_equal "i am a robot", WordPlay.switch_pronouns("you are a robot")
    assert_equal "you are a person", WordPlay.switch_pronouns("i am a person")
    assert_equal "i love you", WordPlay.switch_pronouns("you love me")
    assert_equal "you gave me life", WordPlay.switch_pronouns("i gave you life")
    assert_equal "i am not what you are", WordPlay.switch_pronouns("you are not what i am")
    assert_equal "i annoy your dog", WordPlay.switch_pronouns("you annoy my dog")
    assert_equal "yes, i rule", WordPlay.switch_pronouns("yes, you rule")
    assert_equal "why do i cry", WordPlay.switch_pronouns("why do you cry")
  end
end
