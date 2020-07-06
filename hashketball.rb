require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


def num_points_scored(player_name)
  #for every player in :home and :away, return [:points]
  #test if the player_name == to :home, :player_name elseif == to :away, :player
  hash = game_hash()
  index = 0  #counter for moving through array players[] which is an array of hashes


  while index < hash[:away][:players][index].length || index < hash[:home][:players][index].length  do  #so long as index is less then the lenght of either array of the team's roster
    if hash[:away][:players][index][:player_name] == player_name    #find the away team player, and if there is a match, return the player's points
      return hash[:away][:players][index][:points]

    elsif hash[:home][:players][index][:player_name] == player_name #if not on away team, compare home team, if match, return points
      return hash[:home][:players][index][:points]
    end #end if block

    index+=1
  end #while do loop :away    #[:points]
end #end num_points_scored()


def shoe_size(player_name)
  hash = game_hash()
  index = 0  #counter for moving through array players[] which is an array of hashes

  while index < hash[:away][:players][index].length || index < hash[:home][:players][index].length  do  #so long as index is less then the lenght of either array of the team's roster
    if hash[:away][:players][index][:player_name] == player_name    #find the away team player, and if there is a match, return the player's shoe size
      return hash[:away][:players][index][:shoe]

    elsif hash[:home][:players][index][:player_name] == player_name #if not on away team, compare home team, if match, return shoe size
      return hash[:home][:players][index][:shoe]
    end #end if block

    index+=1
  end #while do loop

end #end of shoe_size()


def team_colors(team_name)
  hash = game_hash()

  if hash[:home][:team_name] == team_name
    return hash[:home][:colors]

  elsif hash[:away][:team_name] == team_name
    return hash[:away][:colors]

  end #end if block

end #end team_colors()

def team_names ()
  #["Brooklyn Nets", "Charlotte Hornets"]
  #hash = game_hash()
  team_names_array = []

  team_names_array[0] = "Brooklyn Nets"
  team_names_array[1] =  "Charlotte Hornets"

  team_names_array
end #end team_names()


def player_numbers(team_name)
  #return player jersey numbers for a team
  # loop through the team_name's hash, if team_name == team_name, finding the jersey numbers, adding jersey numbers into array

  team_numbers = []
  hash = game_hash()

    hash.each do |location_home_or_away, team_information|  #loop through hash, to find the key/value pair of home/away status and its matching team name
      if team_name == team_information[:team_name]        #compare the input of team_name to the key/value|key/value pair of :team_name, if match, execute next steps
          team_information[:players].each do |index|    #for every player in the array :players,
            team_numbers << index[:number]            #add the :number into a holding array
          end #end team_info do loop
        end
    end #end hash.each do loop

team_numbers.sort #return array numbers of the team passed in
end #player_numbers()



def player_stats(player_name)
  #Build a method, player_stats, that takes in an argument of a player's name and returns a hash of that player's stats.
  #loop through hash, compare player_name to each player, if match, return the hash of player states
  # sequence/nesting of the hash/array:  game_hash[:home][:players][array_index_var][:shoe]

  hash = game_hash()  #access the main data

  hash.each do |location_home_or_away, team_information|  #loop through the home and away values
      team_information[:players].each do |index|          #loop through values looking for a player name

        if player_name == index[:player_name]           #only at player_name level, if matching input, return the hash of player_name data
          return index

      end #end if
    end #team_information.each do
  end #end hash.each do

end #end player_stats()


def big_shoe_rebounds
  #return the number of rebounds associated with the player that has the largest shoe size


  all_player_data = hash[:home][:players] + hash[:away][:players]   #Combine the two team hashes into one hash table to make it easier to compare

  player_with_largest_shoe = all_player_data.max do |first_player, second_player| #loop through with max, looking to see which :shoe is bigger, based on 1, 0, -1, max returns the hash of the largest shoe
    first_player[:shoe] <=> second_player[:shoe]
  end
  binding.pry


  player_with_largest_shoe[:rebounds]


end #end big_shoe_rebounds()
