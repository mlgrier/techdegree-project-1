import UIKit
import Foundation

// var to separate the experienced players from unexp players and count them

var countExperincedPlayers = 0
var countUnexperincedPlayers = 0
var expOnEachTeam = 0
var unExpOnEachTeam = 0
var eachTeamTotalPlayers = 0

// players stored in collection names teamSharks - teamDragons - teamRaptors

var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []

var totalNumberOfTeams = 3

// Array for parent letters

var parentLetters: [String] = []

// make a single collection named "PLAYERS" with all info for players

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

// func to get a count of exp players and unexp players

func theExperincedPlayersCount() {
    for (_, value) in players {
        if value[1] == "yes" {
            countExperincedPlayers += 1
        } else {
            countUnexperincedPlayers += 1
        }
    }
    
    expOnEachTeam = countExperincedPlayers / totalNumberOfTeams
    unExpOnEachTeam = countUnexperincedPlayers / totalNumberOfTeams
    
    eachTeamTotalPlayers = expOnEachTeam + unExpOnEachTeam
    
    
}

// func to separate the experienced players and put them on a team

func pickTeamsExpPlayers() {
    for (key, value) in players {
        
        let parentName = value[2]
        let childName = key
        var teamName = ""
        
        if value[1] == "yes" && teamSharks.count < expOnEachTeam {
            teamName = "Sharks"
            teamSharks.append(key)
            players.removeValue(forKey: key)
            letter(parentName, childName, teamName)
            
        } else if value[1] == "yes" && teamDragons.count < expOnEachTeam {
            teamName = "Dragons"
            teamDragons.append(key)
            players.removeValue(forKey: key)
            letter(parentName, childName, teamName)
            
        } else if value[1] == "yes" && teamRaptors.count < expOnEachTeam {
            teamName = "Raptors"
            teamRaptors.append(key)
            players.removeValue(forKey: key)
            letter(parentName, childName, teamName)
            
        }
    }
    
}


// func to separate the unexperienced players and put them on a team

func pickTeamsUnexpPlayer() {
    for (key, value) in players {
        
        let parentName = value[2]
        let childName = key
        var teamName = ""
        
        if value[1] == "no" && teamSharks.count < eachTeamTotalPlayers {
            teamName = "Sharks"
            teamSharks.append(key)
            players.removeValue(forKey: key)
            letter(parentName, childName, teamName)
            
        } else if value[1] == "no" && teamDragons.count < eachTeamTotalPlayers {
            teamName = "Dragons"
            teamDragons.append(key)
            players.removeValue(forKey: key)
            letter(parentName, childName, teamName)
            
        } else if value[1] == "no" && teamRaptors.count < eachTeamTotalPlayers {
            teamName = "Raptors"
            teamRaptors.append(key)
            players.removeValue(forKey: key)
            letter(parentName, childName, teamName)
        }
    }
}

//Team parent letters func

func letter(_ parentName: String, _ childName: String, _ teamName: String) {
    switch teamName {
    case "Raptors": print("Hello \(parentName) your child \(childName) is now a part of the best team the \(teamName). The first team practice will be March 18, 1pm.\n")
    case "Sharks": print("Hello \(parentName) your child \(childName) is now a part of the best team the \(teamName). The first team practice will be March 17, 3pm.\n")
    case "Dragons": print("Hello \(parentName) your child \(childName) is now a part of the best team the \(teamName). The first team practice will be March 17, 1pm.\n")
    default:
        print("We don't have a team for your child at this time.")
    }
}


theExperincedPlayersCount()
pickTeamsExpPlayers()
pickTeamsUnexpPlayer()

print(parentLetters)







