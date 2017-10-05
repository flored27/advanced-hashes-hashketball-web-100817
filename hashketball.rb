def game_hash
  stats = {
    :home => {
      :team_name =>"Brooklyn Nets",
      :colors =>["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number=>0,
          :shoe=>16,
          :points=>22,
          :rebounds=>12,
          :assists=>12,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>1
        },
        "Reggie Evans" => {
          :number=>30,
          :shoe=>14,
          :points=>12,
          :rebounds=>12,
          :assists=>12,
          :steals=>12,
          :blocks=>12,
          :slam_dunks=>7
        },
        "Brook Lopez" => {
          :number=>11,
          :shoe=>17,
          :points=>17,
          :rebounds=>19,
          :assists=>10,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>15
        },
        "Mason Plumlee" => {
          :number=>1,
          :shoe=>19,
          :points=>26,
          :rebounds=>12,
          :assists=>6,
          :steals=>3,
          :blocks=>8,
          :slam_dunks=>5
        },
        "Jason Terry" => {
          :number=>31,
          :shoe=>15,
          :points=>19,
          :rebounds=>2,
          :assists=>2,
          :steals=>4,
          :blocks=>11,
          :slam_dunks=>1
        }
    }
  },
    :away =>
    {
    :team_name =>"Charlotte Hornets",
    :colors =>["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number=>4,
        :shoe=>18,
        :points=>10,
        :rebounds=>1,
        :assists=>1,
        :steals=>2,
        :blocks=>7,
        :slam_dunks=>2
      },
      "Bismak Biyombo" => {
        :number=>0,
        :shoe=>16,
        :points=>12,
        :rebounds=>4,
        :assists=>7,
        :steals=>7,
        :blocks=>15,
        :slam_dunks=>10
      },
      "DeSagna Diop" => {
        :number=>2,
        :shoe=>14,
        :points=>24,
        :rebounds=>12,
        :assists=>12,
        :steals=>4,
        :blocks=>5,
        :slam_dunks=>5
      },
      "Ben Gordon" => {
        :number=>8,
        :shoe=>15,
        :points=>33,
        :rebounds=>3,
        :assists=>2,
        :steals=>1,
        :blocks=>1,
        :slam_dunks=>0
      },
      "Brendan Haywood" => {
        :number=>33,
        :shoe=>15,
        :points=>6,
        :rebounds=>12,
        :assists=>12,
        :steals=>22,
        :blocks=>5,
        :slam_dunks=>12
      }
  }
  }
}
end

def num_points_scored(name)
  if game_hash.dig(:home, :players).include?(name)
    return game_hash.dig(:home, :players, "#{name}", :points)
  elsif game_hash.dig(:away, :players).include?(name)
    return game_hash.dig(:away, :players, "#{name}", :points)
  else
    return "nope"
  end
end

def shoe_size(name)
  if game_hash.dig(:home, :players).include?(name)
    return game_hash.dig(:home, :players, "#{name}", :shoe)
  elsif game_hash.dig(:away, :players).include?(name)
    return game_hash.dig(:away, :players, "#{name}", :shoe)
  else
    return "nope"
  end
end

def team_colors(name)
  if game_hash.dig(:home, :team_name).include?(name)
    return game_hash.dig(:home, :colors)
  elsif game_hash.dig(:away, :team_name).include?(name)
    return game_hash.dig(:away, :colors)
  else
    return "nope"
  end
end

def team_names
    teams = []
    teams.push(game_hash.dig(:home, :team_name))
    teams.push(game_hash.dig(:away, :team_name))
    return teams
end


def player_stats(name)
  if game_hash.dig(:home, :players).include?(name)
    return game_hash.dig(:home, :players, "#{name}")
  elsif game_hash.dig(:away, :players).include?(name)
    return game_hash.dig(:away, :players, "#{name}")
  else
    return "nope"
  end
end

def player_numbers(teamname)
  ryt = []
  if game_hash.dig(:home, :team_name) == (teamname)
    game_hash.each do |location, data|
      #location= home/away, data = hashes
      if location == :home
       data.each do |subject, attribute|#sub = name,color,player  attribute = data, including hash, string, array

           if attribute.is_a?(Hash)
 #conditional to check if its a hash and its in the players hash
             attribute.each do |person, data2|

 #person = player, data2 = category, number

               data2.each do |category, quality|
                 if category == :number
                 ryt.push(quality)
               end
             end
               end
               end
             end
           end
         end



  elsif game_hash.dig(:away, :team_name) == (teamname)
    game_hash.each do |location, data|
      #location= home/away, data = hashes
      if location == :away
       data.each do |subject, attribute|#sub = name,color,player  attribute = data, including hash, string, array

           if attribute.is_a?(Hash)
  #conditional to check if its a hash and its in the players hash
             attribute.each do |person, data2|

  #person = player, data2 = category, number

               data2.each do |category, quality|
                 if category == :number
                 ryt.push(quality)
               end
             end
               end
               end
             end
           end
         end
  else
    return "nope"
  end
  return ryt
end

def big_shoe_rebounds
  shoesizes = []
  rebounds2 = []
    game_hash.each do |location, data|
       data.each do |subject, attribute|
           if attribute.is_a?(Hash)
             attribute.each do |person, data2|
               data2.each do |category, quality|
                 if category == :shoe
                 shoesizes.push(quality)
                  end
                end
               end
              end
             end
           end
           game_hash.each do |location, data|
              data.each do |subject, attribute|
                  if attribute.is_a?(Hash)
                    attribute.each do |person, data2|
                      data2.each do |category, quality|
                        if category == :rebounds
                        rebounds2.push(quality)
                         end
                       end
                      end
                     end
                    end
                  end

  return rebounds2[shoesizes.index(shoesizes.max)]
end
