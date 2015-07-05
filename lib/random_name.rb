# https://gist.github.com/afriggeri/1266756
module RandomName
  class << self
    def generate
      rnd = Random.rand(64)

      "#{ adjectives[rnd%adjectives.length] }_#{ nouns[rnd%adjectives.length] }_#{rnd}"
    end

    def adjectives
      %w(autumn hidden bitter misty silent empty dry dark summer icy delicate quiet white cool spring winter patient twilight dawn crimson wispy weathered blue billowing broken cold damp falling frosty green long late bold little morning muddy red rough still small sparkling shy wandering withered wild black young holy solitary fragrant aged snowy proud floral restless polished purple lively nameless)
    end

    def nouns
      %w("waterfall river breeze moon rain wind sea morning snow lake sunset pine shadow leaf dawn glitter forest hill cloud meadow sun glade bird brook butterfly bush dew dust field fire flower firefly feather grass haze mountain night pond darkness snowflake silence sound sky shape surf thunder violet water wildflower wave water resonance sun wood dream cherry tree fog frost voice paper frog smoke star")
    end
  end
end
