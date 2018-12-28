import UIKit
import Foundation

// var to separate the experienced players from unexp players and count them

var countExperincedPlayers = 0
var countUnexperincedPlayers = 0
var expOnEachTeam = 0
var unExpOnEachTeam = 0
var eachTeamTotalPlayers = 0

// If teams are added update the number below

var totalNumberOfTeams = 0

// This is an array of team arrays

var teams = [[String]]()

// players stored in collection names teamSharks - teamDragons - teamRaptors

var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []

// Add the teams to the "TEAMS" array

teams.append(teamSharks)
teams.append(teamDragons)
teams.append(teamRaptors)

totalNumberOfTeams = teams.count

// Array for parent letters

var parentLetters: [String] = []

// make a single collection named "PLAYERS" with all info for players
var players = [
    "Joe Smith": ["name": "Joe Smith", "height": "42", "hasSoccerExperience": "true", "guardians": "Jim and Jan Smith"],
    "Jill Tanner": ["name": "Jill Tanner", "height": "36", "hasSoccerExperience": "true", "guardians": "Clara Tanner"],
    "Bill Bon": ["name": "Bill Bon", "height": "43", "hasSoccerExperience": "true", "guardians": "Sara and Jenny Bon"],
    "Eva Gordon": ["name": "Eva Gordon", "height": "45", "hasSoccerExperience": "false", "guardians": "Sara and Jenny Bon"],
    "Matt Gill": ["name": "Matt Gill", "height": "40", "hasSoccerExperience": "false", "guardians": "Charles and Sylvia Gill"],
    "Kimmy Stein": ["name": "Kimmy Stein", "height": "41", "hasSoccerExperience": "false", "guardians": "Bill and Hillary Stein"],
    "Sammy Adams": ["name": "Sammy Adams", "height": "45", "hasSoccerExperience": "false", "guardians": "Jeff Adams"],
    "Karl Saygan": ["name": "Karl Saygan", "height": "42", "hasSoccerExperience": "true", "guardians": "Heather Bledsoe"],
    "Suzane Greenberg": ["name": "Suzane Greenberg", "height": "44", "hasSoccerExperience": "true", "guardians": "Henrietta Dumas"],
    "Sal Dali": ["name": "Sal Dali", "height": "41", "hasSoccerExperience": "false", "guardians": "Gala Dali"],
    "Joe Kavalier": ["name": "Joe Kavalier", "height": "39", "hasSoccerExperience": "false", "guardians": "Sam and Elaine Kavalier"],
    "Ben Finkelstein": ["name": "Ben Finkelstein", "height": "44", "hasSoccerExperience": "false", "guardians": "Aaron and Jill Finkelstein"],
    "Diego Soto": ["name": "Diego Soto", "height": "41", "hasSoccerExperience": "true", "guardians": "Robin and Sarika Soto"],
    "Chloe Alaska": ["name": "Chloe Alaska", "height": "47", "hasSoccerExperience": "false", "guardians": "David and Jamie Alaska"],
    "Arnold Willis": ["name": "Arnold Willis", "height": "43", "hasSoccerExperience": "false", "guardians": "Claire Willis"],
    "Phillip Helm": ["name": "Phillip Helm", "height": "44", "hasSoccerExperience": "true", "guardians": "Thomas Helm and Eva Jones"],
    "Les Clay": ["name": "Les Clay", "height": "42", "hasSoccerExperience": "true", "guardians": "Wynonna Brown"],
    "Herschel Krustofski": ["name": "Herschel Krustofski", "height": "45", "hasSoccerExperience": "true", "guardians": "Hyman and Rachel Krustofski"]
]

// Func to build and add letters to parentLetters

func letter(_ parentName: String, _ childName: String, _ teamName: String) {
    
    switch teamName {
    case "Raptors": parentLetters.append("Hello \(parentName) your child \(childName) is now a part of the best team the \(teamName). The first team practice will be March 18, 1pm.\n")
    case "Sharks": parentLetters.append("Hello \(parentName) your child \(childName) is now a part of the best team the \(teamName). The first team practice will be March 17, 3pm.\n")
    case "Dragons": parentLetters.append("Hello \(parentName) your child \(childName) is now a part of the best team the \(teamName). The first team practice will be March 17, 1pm.\n")
    default:
        print("We don't have a team for your child at this time.")
    }
    
}

// func to get a count of exp players and unexp players

func theExperincedPlayersCount() {
    for (_, value) in players {
        
        let experience = value["hasSoccerExperience"]
        
        if experience == "true" {
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
        
        let guardians = value["guardians"] ?? "error"
        let experience = value["hasSoccerExperience"]
        let childName = key
        var teamName = ""
        
        if experience == "true" && teamSharks.count < expOnEachTeam {
            teamName = "Sharks"
            teamSharks.append(key)
            players.removeValue(forKey: key)
            letter(guardians, childName, teamName)
            
        } else if experience == "true" && teamDragons.count < expOnEachTeam {
            teamName = "Dragons"
            teamDragons.append(key)
            players.removeValue(forKey: key)
            letter(guardians, childName, teamName)
            
        } else if experience == "true" && teamRaptors.count < expOnEachTeam {
            teamName = "Raptors"
            teamRaptors.append(key)
            players.removeValue(forKey: key)
            letter(guardians, childName, teamName)
            
        }
    }
    
}

// func to separate the unexperienced players and put them on a team

func pickTeamsUnexpPlayers() {
    for (key, value) in players {
        
        let guardians = value["guardians"] ?? "error"
        let experience = value["hasSoccerExperience"]
        let childName = key
        var teamName = ""
        
        if experience == "false" && teamSharks.count < eachTeamTotalPlayers {
            teamName = "Sharks"
            teamSharks.append(key)
            players.removeValue(forKey: key)
            letter(guardians, childName, teamName)
            
        } else if experience == "false" && teamDragons.count < eachTeamTotalPlayers {
            teamName = "Dragons"
            teamDragons.append(key)
            players.removeValue(forKey: key)
            letter(guardians, childName, teamName)
            
        } else if experience == "false" && teamRaptors.count < eachTeamTotalPlayers {
            teamName = "Raptors"
            teamRaptors.append(key)
            players.removeValue(forKey: key)
            letter(guardians, childName, teamName)
        }
    }
}



// Func to print parent letters

func printLetters() {
    for letter in parentLetters {
        print(letter)
    }
}


theExperincedPlayersCount()
pickTeamsExpPlayers()
pickTeamsUnexpPlayers()
printLetters()




