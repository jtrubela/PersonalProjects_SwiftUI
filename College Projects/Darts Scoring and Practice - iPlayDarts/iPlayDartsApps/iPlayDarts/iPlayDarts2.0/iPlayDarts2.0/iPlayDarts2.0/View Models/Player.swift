//
//  Player.swift
//  DartsCheckoutsGame
//
//  Created by Justin Trubela on 5/17/23.
//

import Foundation

class Player: ObservableObject{
    var user: User
    var score: PlayerScore
    var gamesPlayed: Int
    var gamesWon: Int
    
    
    var dartsThrown: Int = 0
    var ThreeDartAverage: Double = 0.0
    var highestTurn: Int = 0
    var attemptsAtOut: Int = 0
    var totalPointsEarned: Int = 0
    var dartsThrownAtOut: Int = 0
    
    init(user: User) {
        self.user = user
        self.score = PlayerScore(currentScore: 0, roundScores: [], totalScore: 501)
        
        self.dartsThrown = 0
        self.ThreeDartAverage = 0.0
        self.highestTurn = 0
        self.attemptsAtOut = 0
        self.totalPointsEarned = 0
        self.dartsThrownAtOut = 0
        
        self.gamesPlayed = 0
        self.gamesWon = 0
    }
    
    //    mutating
    func updateScore(score: Int) {
        self.score.updateCurrentScore(score: score)
        print(score)
    }
    
    //    mutating
    func undoLastRound() {
        self.score.undoLastRound()
    }
    
    //    mutating
    func resetScore() {
        self.score.reset()
    }
    
    //    mutating
    func incrementGamesPlayed() {
        self.gamesPlayed += 1
    }
    
    //    mutating
    func incrementGamesWon() {
        self.gamesWon += 1
    }
    
    func changeName(_to name: String) {
        self.user.name = name
    }
    
    func getScore(player: Player) -> String {
        print(player.score.totalScore)
        return player.score.totalScore.description
    }
}



//
//  Player Scores.swift
//  DartsCheckoutsGame
//
//  Created by Justin Trubela on 5/24/23.
//

import Foundation

struct PlayerScore {
    
    
    var currentScore: Int
    var roundScores: [Int]
    
    var totalScore: Int
    
    mutating func updateCurrentScore(score: Int) {
        
        currentScore = score
        totalScore -= currentScore
        roundScores.append(score)
    }
    
    mutating func undoLastRound() {
        guard let lastRoundScore = self.roundScores.last else {
            return
        }
        
        self.totalScore += lastRoundScore
        self.roundScores.removeLast()
        
    }
    
    mutating func reset() {
        currentScore = 0
        roundScores = []
    }
}
