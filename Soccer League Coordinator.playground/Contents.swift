import UIKit
import Foundation

var countExperincedPlayers = 0
var countUnexperincedPlayers = 0
var expOnEachTeam = 0
var unExpOnEachTeam = 0
var eachTeamTotal = 0

// Empty team dicto

var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []

var parentLetters: [String] = []

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

//List of team names and practice dates and times

var teamsPractice = ["Sharks" : "March 17, 3pm",
                     "Dragons" : "March 17, 1pm",
                     "Raptors" : "March 18, 1pm"
]

func theExperincedPlayersCount() {
    for (_, value) in players {
        if value[1] == "yes" {
            countExperincedPlayers += 1
        } else {
            countUnexperincedPlayers += 1
        }
    }
    
    expOnEachTeam = countExperincedPlayers / 3
    unExpOnEachTeam = countUnexperincedPlayers / 3
    
    eachTeamTotal = expOnEachTeam + unExpOnEachTeam
    
    
}


func pickTeamsExpPlayers() {
    for (key, value) in players {
        
        let parentName = value[2]
        let childName = key
        var teamName = ""
        var firstPractice = ""
        
        if value[1] == "yes" && teamSharks.count < expOnEachTeam {
            teamName = "Sharks"
            firstPractice = "March 17, 3pm"
            teamSharks.append(key)
            letter(parentName, childName, teamName, firstPractice)
        } else if value[1] == "yes" && teamDragons.count < expOnEachTeam {
            teamName = "Dragons"
            firstPractice = "March 17, 1pm"
            teamDragons.append(key)
            letter(parentName, childName, teamName, firstPractice)
        } else if value[1] == "yes" && teamRaptors.count < expOnEachTeam {
            teamName = "Raptors"
            firstPractice = "March 18, 1pm"
            teamRaptors.append(key)
            letter(parentName, childName, teamName, firstPractice)
        }
    }
}

func letter(_ parentName: String, _ childName: String, _ teamName: String, _ firstPractice: String) {
    parentLetters.append("Hello \(parentName) your child \(childName) is now a part of the best team the \(teamName). \r\n The first team practice will be \(firstPractice).")
}


func pickTeamsUnexpPlayer() {
    for (key, value) in players {
        if value[1] == "no" && teamSharks.count < eachTeamTotal {
            teamSharks.append(key)
        } else if value[1] == "no" && teamDragons.count < eachTeamTotal {
            teamDragons.append(key)
        } else if value[1] == "no" && teamRaptors.count < eachTeamTotal {
            teamRaptors.append(key)
        }
    }
}

// user switch statement for the letter

//func parentLetter() {
//    for (key, value) in players {
//        parentLetters.append("\()")
//    }
//}

theExperincedPlayersCount()
pickTeamsExpPlayers()
pickTeamsUnexpPlayer()

print(parentLetters)





