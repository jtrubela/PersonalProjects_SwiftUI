////
////  Play01.swift
////  DartsCheckoutsGame
////
////  Created by Justin Trubela on 5/16/23.
////
//
//import SwiftUI
//
//class : ObservableObject {
//    
//    
//    //initialize the players playing the game
//    @Published var player1: Player = Player.init(user: User(name: "", email: "", password: ""))
//    @Published var player2: Player = Player.init(user: User(name: "", email: "", password: ""))
//    
//    // Keyboard Modifiers
//    @FocusState  var amountIsFocused: Bool
//    
//    
//    //View Alerts
//    @Published var scoreNotPossible = false
//    @Published var scoreNotPossibleErrorMessage = "Score not possible"
//    
//    @Published var outSuccessAlert = false
//    @Published var outTitle = "This is temporary out title"
//    
//    
//    //Darts Checkouts Data
//    // JSON files
//    let Checkout1: Checkout = Bundle().decode("CheckoutOption1.json")
//    let Checkout2: Checkout = Bundle().decode("CheckoutOption2.json")
//    let Checkout3: Checkout = Bundle().decode("CheckoutOption3.json")
//    
//    
//    //Constant Data
//    @Published var validOuts = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,
//                     26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,
//                     51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,
//                     76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,
//                     101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
//                     120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,
//                     141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,160,161,164,167,170]
//    
//    @Published var invalidOuts = [169,168,166,165,163,162,159]
//
//    @Published var practiceNumbers = Checkouts().practiceNumbers.shuffled()
//    
//    @Published var player1Turn = true
//    @Published var player2Turn = false
//    
//
//    
//    
//    
//    
//    // Game chosen
//    
//    //initialize the game
////    @Published var game = DartGame.fiveHundredOne
////    //    let gameName = game.gameName
////    @Published var gameName = ""
//    
//
//    
//    //initialize the game score
//    //    let gameStartScore = game.startingScore
//    @Published var gameStateScore: Int = 0
//    
//    
////    enum DartGame {
////        case threeHundredOne
////        case fourHundredOne
////        case fiveHundredOne
////        case cricket
////
////        var startingScore: Int {
////            switch self {
////                case .threeHundredOne:
////                    return 301
////                case .fourHundredOne:
////                    return 401
////                case .fiveHundredOne:
////                    return 501
////                case .cricket:
////                    return 0
////            }
////        }
////
////        var gameName: String {
////            switch self {
////                case .threeHundredOne:
////                    return "301"
////                case .fourHundredOne:
////                    return "401"
////                case .fiveHundredOne:
////                    return "501"
////                case .cricket:
////                    return "Cricket"
////            }
////        }
////
////        var isCricket: Bool {
////            return self == .cricket
////        }
////    }
////
//
//    
//    
//    func startGame() {
//        
//
//        
////        let player1 = Play501View().player1
////        let player2 = Play501View().player2
////
////        let player1Name = player1.user.name
////        let player2Name = player2.user.name
////
////        let gameName = game.gameName
//        
//        
//        //initialize the players points to the points for the game chosen
//        Play501View().player1.score.totalScore = 501
//        Play501View().player2.score.totalScore = 501
//        
//        //initialize the players to start
//        self.player1Turn = true
//        self.player2Turn = false
//
//        
////        print("The game being played is \(gameName). In this game each player will start with \(gameName) and for each turn the player will have the points scored deducted from their total points")
//        print("\nThe player that starts the game is: \(Play501View().player1.user.name)")
//        print("\n\(Play501View().player1.user.name) will follow")
//        
//    }
//
//    
//    
//    
//    
//    
//    func showScores(_ player1: Player, _ player2: Player){
//        let name1 = Play501View().player1.user.name
//        let currentScore1 = Play501View().player1.score.currentScore
//        let totalScore1 = Play501View().player1.score.totalScore
//        let scores1 = Play501View().player1.score.roundScores
//        
//        let name2 = Play501View().player2.user.name
//        let currentScore2 = Play501View().player2.score.currentScore
//        let totalScore2 = Play501View().player2.score.totalScore
//        let scores2 = Play501View().player2.score.roundScores
//        
//        print("\t\t\t\t\(name1)(\(totalScore1)) - \(name2)(\(totalScore2))")
//        print(scores1)
//        print(currentScore1)
//
//        print(scores2)
//        print(currentScore2)
//
//        
//    }
////    mutating
//    func updateP1Score(_ score: Int){
//        
//        Play501View().player1.score.updateCurrentScore(score: score)
//        print("\n--------------------------------------------------------\n")
//        
//        print("\t\t***** Player1 scored \(score) points *****\n")
//        showScores(Play501View().player1, Play501View().player2)
//    }
////    mutating
//    func updateP2Score(_ score: Int){
//        Play501View().player2.score.updateCurrentScore(score: score)
//        print("\n--------------------------------------------------------\n")
//        print("\t\t***** Player2 scored \(score) points *****\n")
//        
//        showScores(Play501View().player1, Play501View().player2)
//    }
//    
//    //    mutating func undoP1Score() {
//    //        print(player1.score.roundScores.count)
//    //        print("\n------------------- CLEAR BUTTON PRESSED -----------------\n")
//    //        print("\t\t \(player1.score.roundScores.last ?? 0) was removed from the player2's scores")
//    //
//    //        player1.score.undoLastRound()
//    //
//    //        print("\n--------------------------------------------------------\n")
//    //    }
//    //    mutating func undoP2Score() {
//    //        print("\n------------------- CLEAR BUTTON PRESSED -----------------\n")
//    //        print("\t\t \(player2.score.roundScores.last ?? 0) was removed from the player1's scores")
//    //
//    //        player1.score.undoLastRound()
//    //
//    //        print("\n--------------------------------------------------------\n")
//    //    }
//    
//    
//    
//    
//    
//    
//    
//    
//    //--------------------------GAME FUNCTIONS---------------------------//
//    //
//    //
//    //
//    //Change the opponents turn
//    func changeTurns(){
//        //Changes LED Status for player in 501 game
//        Play501View().player1Turn.toggle()
//        Play501View().player2Turn.toggle()
//    }
//    //Undo button resets the last turn and starts the previous turn over
//    func undoTurn() {
//        //UNDOING LAST TURN FOR PLAYER
//        //While player?'s turn and player? has scored more than 1 turn prior
//        //set calc string to 0
//        //get last turns points
//        //deduct last turns points from total points earned for stats sheet
//        //deduct 3 darts from total darts thrown
//        //add back the points that were taken away from last round
//        //put the last turns points in the calculation bar
//        //remove the last turns points from the list of points
//        changeTurns()
//        Play501View().calculationString = "0"
//        
//        if Play501View().player1Turn && Play501View().player1.score.roundScores.count > 0 && Play501View().player1.totalPointsEarned != 501{
//            let endOfPlayer1Scores = Play501View().player1.score.roundScores.count-1
//            Play501View().player1.totalPointsEarned -=  endOfPlayer1Scores
//            Play501View().player1.dartsThrown -= 3
//            Play501View().player1.score.currentScore += Play501View().player1.score.roundScores[endOfPlayer1Scores]
//            Play501View().calculationString = "\(Play501View().player1.score.roundScores[Play501View().player1.score.roundScores.count-1])"
//            Play501View().player1.score.roundScores.removeLast()
//            changeTurns()
//        }
//        else if Play501View().player2Turn && Play501View().player2.score.roundScores.count > 0 && Play501View().player2.score.totalScore != 501{
//            let endOfPlayer2Scores = Play501View().player2.score.roundScores.count-1
//            Play501View().player2.totalPointsEarned -=  endOfPlayer2Scores
//            Play501View().player2.dartsThrown -= 3
//            Play501View().player2.score.currentScore += Play501View().player2.score.roundScores[endOfPlayer2Scores]
//            Play501View().calculationString = "\(Play501View().player2.score.roundScores[Play501View().player2.score.roundScores.count-1])"
//            Play501View().player2.score.roundScores.removeLast()
//            changeTurns()
//        }
//        changeTurns()
//    }
//    
//    
//    //Get the winner to the current game
//    func GetWinner(_ player1: Player, _ player2: Player) -> Player {
//        if player1.score.totalScore == 0{
//            outSuccessAlert.toggle()
//            return player1
//        }
//        else if player2.score.totalScore == 0 {
//            outSuccessAlert.toggle()
//            return player2
//        }
//        return player1
//    }
//    //Resets the current game status for both players
//    func restartGame(){
//        //Restart game points 501
//        //Empty player1 & player2 point arrays
//        //Reset calculation string
//        Play501View().player1.score.totalScore = 501
//        Play501View().player2.score.totalScore = 501
//        Play501View().player1.score.roundScores.removeAll()
//        Play501View().player2.score.roundScores.removeAll()
//        Play501View().resetCalculationString()
//    }
//    
//    
//    
//    
//    
//    
//
//    
//    
//    
//    
//    
//
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    //------------------------------------------------------------------------------------------------------------
//    //                          STATISTICS VARIABLES/FUNCTIONS/COMPUTED PROPERTIES
//    //------------------------------------------------------------------------------------------------------------
//    func checkHighestScore(_ : Int){
//        // Update new highest turn score for player?
//        if Play501View().player1Turn && Play501View().player1.score.currentScore > Play501View().player1.highestTurn {
//            Play501View().player1.highestTurn = Play501View().player1.score.currentScore
//        }
//        if Play501View().player2Turn && Play501View().player2.score.currentScore > Play501View().player2.highestTurn {
//            Play501View().player2.highestTurn = Play501View().player2.score.currentScore
//        }
//    }
//    
//    func calculate3DartAverage() -> String {
//        if (Play501View().player2Turn){
//            if (Play501View().player2.dartsThrown > 0) {
//                return "\((Play501View().player2.totalPointsEarned/Play501View().player2.dartsThrown)*3) PPR"
//            } else {
//                return "0.0 PPR"
//            }
//        }
//        else {
//            if (Play501View().player2.dartsThrown > 0) {
//                return "\((Play501View().player2.totalPointsEarned/Play501View().player2.dartsThrown)*3) PPR"
//            } else {
//                return "0.0 PPR"
//            }
//        }
//    }
//    
//    
//
//    func calculateOutAverage() -> String {
//        if (Play501View().player1Turn && Play501View().player1.attemptsAtOut > 0){
//            return "\(Play501View().player1.attemptsAtOut/Play501View().player1.dartsThrownAtOut) %"
//        }
//        else if (Play501View().player2Turn && Play501View().player2.attemptsAtOut > 0) {
//            return "\(Play501View().player2.attemptsAtOut/Play501View().player2.dartsThrownAtOut) %"
//        }
//        return "0.0 %"
//    }
//    
//}
