# Humanization
module HumanHelper
  def human_time(time)
    # Massage Fixnum timestamps -> Time
    my_time = time.is_a?(Fixnum) ? Time.at(time) : time
    time_ago_in_words(my_time)
  end
end
