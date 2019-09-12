require "pry"

  def game_hash
    hash = {
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
          {:player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :block => 1,
          :slam_dunks => 1
          },
          {:player_name => "Reggie Evans", 
          :number => 30, 
          :shoe => 14, 
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :block => 12,
          :slam_dunks => 7
          },
          {:player_name => "Brook Lopez", 
          :number => 11,
          :shoe => 17, 
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :block => 1,
          :slam_dunks => 15
          },
          {:player_name => "Mason Plumlee", 
          :number => 1, 
          :shoe => 19, 
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :block => 8,
          :slam_dunks => 5
          },
          {:player_name => "Jason Terry", 
          :number => 31,
          :shoe => 15, 
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :block => 11,
          :slam_dunks => 1
          }
        ]
      },
      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => [
          {:player_name => "Jeff Adrien", 
          :number => 4, 
          :shoe => 18, 
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :block => 7,
          :slam_dunks => 2
          },
          {:player_name => "Bismack Biyombo", 
          :number => 0, 
          :shoe => 16, 
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :block => 15,
          :slam_dunks => 10
          },
          {:player_name => "DeSagna Diop", 
          :number => 2,
          :shoe => 14, 
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :block => 5,
          :slam_dunks => 5
          },
          {:player_name => "Ben Gordon", 
          :number => 8, 
          :shoe => 15, 
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :block => 1,
          :slam_dunks => 0
          },
          {:player_name => "Kemba Walker", 
          :number => 33,
          :shoe => 15, 
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :block => 5,
          :slam_dunks => 12
          }
        ]
      }
    }
    hash
  end
  
  def num_points_scored(player_name)
    hash = game_hash
    name_player = []
    players_points = []
    im = 0 
    while im<hash[:home][:players].length do
      name_player.push("#{game_hash[:home][:players][im][:player_name]}")
      im+=1
    end
    i = 0
    while i<hash[:away][:players].length do
      name_player.push("#{hash[:away][:players][i][:player_name]}")
      i+=1
    end
    u = 0 
    while u<hash[:home][:players].length do
      players_points.push(hash[:home][:players][u][:points])
      u+=1
    end
    m = 0 
    while m<hash[:away][:players].length do
      players_points.push(hash[:away][:players][m][:points])
      m+=1
    end
    name_with_points = Hash[name_player.zip players_points]
    name_with_points[player_name]
  end

 def shoe_size(player)
   hash = game_hash
   name_player = []
   players_shoe_size = []
    im = 0 
    while im<hash[:home][:players].length do
      name_player.push("#{game_hash[:home][:players][im][:player_name]}")
      im+=1
    end
    i = 0
    while i<hash[:away][:players].length do
      name_player.push("#{game_hash[:away][:players][i][:player_name]}")
      i+=1
    end
    u = 0 
    while u<hash[:home][:players].length do
      players_shoe_size.push(game_hash[:home][:players][u][:shoe])
      u+=1
    end
    m = 0 
    while m<hash[:away][:players].length do
      players_shoe_size.push(game_hash[:away][:players][m][:shoe])
      m+=1
    end
    name_with_shoe_size = Hash[name_player.zip players_shoe_size]
    name_with_shoe_size[player]
  end


def team_colors(teams_name)
  hash = game_hash
  hash.each do |key, value|
    if value[:team_name] == teams_name
      return value[:colors]
    end 
  end
end

def team_names
  hash = game_hash
  teams = []
  teams.push(hash[:home][:team_name])
  teams.push(hash[:away][:team_name])
  teams
end

def player_numbers(team_name)
  hash = game_hash
  brooklyn_numbers = []
  charlotte_numbers = []
  i = 0
  while i<hash[:home][:players].length do
      brooklyn_numbers.push(hash[:home][:players][i][:number])
  i+=1 
  end
  m = 0
  while m<hash[:home][:players].length do
     charlotte_numbers.push(hash[:away][:players][m][:number])
  m+=1 
  end
  if team_name == "Brooklyn Nets"
    return brooklyn_numbers
  else
    return charlotte_numbers
  end
end

def player_stats(name)
  hash = game_hash
  players_stat_hash = {}
  hash.each do |k, v|
    v[:players].each do |index|
      if index[:player_name] == name
        index.each do |key, value|
          i = 0 
          while i<v[:players].length do
            if key != (:player_name)
              players_stat_hash[key] = value
              i+=1
              
            end
          end
        end
      end
    end
  end 
  players_stat_hash
end

def big_shoe_rebounds
  hash = game_hash
  return hash[:home][:players][3][:rebounds]
end

def most_points_scored
  hash = game_hash
  max_points = []
  hash.each do |key, value|
    i = 0 
    while i<hash[key][:players].length do
      max_points.push(hash[key][:players][i][:points])
      
    end
  end
end

def winning_team
end

def player_with_longest_name
end

def long_name_steals_a_ton?
end


player_stats("DeSagna Diop")