import UIKit
import Foundation

var countExperincedPlayers = 0
var expOnEachTeam = 0

// Empty team dicto

var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []

// List of all the players

var players = ["Joe Smith" : ["42", "yes", "Jim and Jan Smith"],
               "Jill Tanner" : ["36", "yes", "Clara Tanner"],
               "Bill Bon" : ["43", "yes", "Sara and Jenny Bon"],
               "Eva Gordon" : ["45", "no", "Wendy and Mike Gordon"],
               "Matt Gill" : ["40", "no", "Charles and Sylvia Gill"],
               "Kimmy Stein" : ["41", "no", "Bill and Hillary Stein"],
               "Sammy Adams" : ["45", "no", "Jeff Adams"],
               "Karl Saygan" : ["42", "yes", "Heather Bledsoe"],
               "Suzane Greenberg" : ["44", "yes", "Henrietta Dumas"],
               "Sal Dali" : ["41", "no", "Gala Dali"],
               "Joe Kavalier" : ["39", "no", "Sam and Elaine Kavalier"],
               "Ben Finkelstein" : ["44", "no", "Aaron and Jill Finkelstein"],
               "Diego Soto" : ["41", "yes", "Robin and Sarika Soto"],
               "Chloe Alaska" : ["47", "no", "David and Jamie Alaska"],
               "Arnold Willis" : ["43", "no", "Claire Willis"],
               "Phillip Helm" : ["44", "yes", "Thomas Helm and Eva Jones"],
               "Les Clay" : ["42", "yes", "Wynonna Brown"],
               "Herschel Krustofski" : ["45", "yes", "Hyman and Rachel Krustofski"]
]

func theExperincedPlayersCount() {
    for (_, value) in players {
        if value[1] == "yes" {
            countExperincedPlayers += 1
        }
    }
    
    expOnEachTeam = countExperincedPlayers / 3
}

theExperincedPlayersCount()


for (key, value) in players {
    if value[1] == "yes" && players.count == 3 {
        teamSharks.append(key)
    } else if value[1] == "yes"{
        teamDragons.append(key)
    }
}

print(teamSharks)
print(teamDragons)
players.count


//    teamSharks[key] = value[1]
//    print(teamSharks)




