//
//  Play501View.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct Play501View: View {

    
    // Keyboard Modifiers
    @FocusState  var amountIsFocused: Bool
    
    //View Alerts
    @State var scoreNotPossible = false
    @State var scoreNotPossibleErrorMessage = "Score not possible"
    
    @State var outSuccessAlert = false
    @State var outTitle = "This is temporary out title"
    
    
    //Darts Checkouts Data
    // JSON files
    let Checkout1: Checkout = Bundle().decode("CheckoutOption1.json")
    let Checkout2: Checkout = Bundle().decode("CheckoutOption2.json")
    let Checkout3: Checkout = Bundle().decode("CheckoutOption3.json")
    
    

    @State var calculationString = "0"
    

    //initialize the players playing the game
    @State var player1: Player = Player.init(user: User(name: "Name1", email: "", password: ""))
    @State var player2: Player = Player.init(user: User(name: "Name2", email: "", password: ""))
    
    @State var player1Turn =  true
    @State var player2Turn = false

    
    var body: some View {
        NavigationView {
            ZStack{
                HomeScreenViewBackground()
                
                VStack{
                    Spacer()
                    //-----------WHATS MY OUT QUIT/HOME/WHATSMYOUT/MENU BUTTONS----------
                    Section{
                        HStack{
                            Spacer()
                            Section{
                                WhatsMyOutButton()
                                    .MakeButtonWhite()
                            }
                            Spacer()
                            Section{
                                MainMenuButton()
                                    .MakeButtonWhite()
                            }
                            Spacer()
                        }
                    }
                    
                    //------------------PLAYER1&2 SCORES/NAMES + LEDS--------------------
                    
                    Section{
                        HStack{
                            Spacer()
                            //Player 1&2 score
                            VStack{
                                HStack{
                                    Spacer()
                                    //Player 1 LED indicator
                                    Section{
                                        VStack{
                                            Button(){
                                                changeTurns()
                                            } label: {
                                                Image( player1Turn ? "LEDOn" : "LEDOff")
                                                    .resizable()
                                                    .frame(width: 40, height: 40, alignment: .center)
                                            }
                                            Text("\(player1.user.name)").foregroundColor(.white).font(.title3)
                                        }
                                    }
                                    Spacer()
                                    //Reset Button
                                    Section{
                                        Button(){
                                            restartGame()
                                            startGame()

                                        } label: {
                                            Image(systemName: "arrow.triangle.2.circlepath.circle")
                                                .resizable()
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .tint(.green)
                                        }
                                    }
                                    Spacer()
                                    //Player 2 LED indicator
                                    Section{
                                        VStack{
                                            Button(){
                                                changeTurns()
                                            } label: {
                                                Image(player2Turn ? "LEDOn" : "LEDOff")
                                                    .resizable()
                                                    .frame(width: 40, height: 40, alignment: .center)
                                            }
                                            Text("\(player2.user.name)")
                                                .foregroundColor(.white)
                                                .font(.title3)
                                        }
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Spacer()
                                    //Player1 Points
                                    Section{
                                        VStack{
                                            Text("\(player1.score.totalScore)")
                                                .MakePlayerPointsBox()
                                        }
                                    }
                                    
                                    Spacer()
                                    //Player2 Points
                                    Section{
                                        VStack{
                                            Text("\(player2.score.totalScore)")
                                                .MakePlayerPointsBox()
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                    }.padding(.all, 10)
                    
                    Section{
                        //-------------------------CALCULATION STRING------------------------
                        Section{
                            HStack{
                                Text("\(calculationString)")
                                    .MakeCalculationStringBox()
                                Button("C"){
                                    calculationString = ""
                                }
                                .MakeWhiteButton()
                            }
                        }
                        //--------------------------CALC BUTTONS-----------------------------
                        Section{
                            VStack{
                                GridStack(rows: 4, columns: 3) { row, col in
                                    let number = (row * 3) + col + 1
                                    
                                    Button{
                                        getCalcButtonNumbers(number: number)
                                    } label: {
                                        switch (row, col) {
                                            case (3, 0):
                                                Text("+")
                                                    .font(.system(size: 40))
                                                    .MakeNumberButtonBackground()
                                            case (3, 1):
                                                Text("0")
                                                    .MakeNumberButtonBackground()
                                            case (3,2):
                                                Text("x")
                                                    .font(.system(size: 40))
                                                    .MakeNumberButtonBackground()
                                            default:
                                                Text("\(number-1 + 1)")
                                                    .MakeNumberButtonBackground()
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            //----------------------ENTER AND BACK BUTTON------------------------
                            Section{
                                HStack{
                                    Button(){
                                        //TODO: Undo score
                                        if  !player1Turn {
                                            print(player1.score.roundScores.last ?? 0)
                                            undoTurn()
                                        }
                                        else if  !player2Turn {
                                            print(player2.score.roundScores.last ?? 0)
                                            undoTurn()
                                        }
                                        
                                    } label: {
                                        VStack{
                                            Image(systemName: "arrow.uturn.backward")
                                            Text("Undo Last Turn")
                                                .font(.caption)
                                        }
                                    }
                                    .frame(width: 120, height: 80, alignment: .center)
                                    .MakeEnterAndClearButtonBackground()
                                    
                                    Button(){
                                        //TODO: Enter score
//                                        CalculateOut()
                                        
                                        //Declare an expression that will be used to calculate the players score
                                        let expn = NSExpression(format:"\(calculationString)")
                                        let currentScore = expn.expressionValue(with: nil, context: nil)as? Int
                                        
                                        //Take the calculation string and calculate the value to be deducted from the players score
                                        if player1Turn && player1.score.totalScore > 180{
                                            //Check if the score is greater than 180
                                            scoreNotPossible = true
                                            print("Score is above 180 points")
                                        }
                                        else if player2Turn && player2.score.totalScore > 180 {
                                            scoreNotPossible = true
                                            print("Score is above 180 points")
                                        }
                                        
                                        if player1Turn{
                                            player1.score.updateCurrentScore(score: currentScore ?? -1)
                                        }
                                        else{
                                            player2.score.updateCurrentScore(score: currentScore ?? -1)
                                        }
                                        
                                        
                                        
                                        resetCalculationString()
                                        changeTurns()

                                    } label: {
                                        Text("Enter").foregroundColor(.green)
                                    }
                                    .frame(width: 240, height: 80, alignment: .center)
                                    .MakeEnterAndClearButtonBackground()
                                    .alert( scoreNotPossibleErrorMessage, isPresented:  $scoreNotPossible) {
                                        Button("Continue", action: {
                                            calculationString = ""
                                        })
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .font(.largeTitle).foregroundColor(.black)
                }
                .alert( outTitle, isPresented:  $outSuccessAlert)
                {
                    Button("Continue"){}
                } message: {
                    Text("WINNER: \(GetWinner(player1, player2).user.name) CONGRATULATIONS!")
                }.keyboardType(.numberPad)
            }
        }
    }
    
    
    //Turns the score shown to "0" string
    func resetCalculationString(){
        calculationString = "0"
    }
    
    //Takes the calculation made and turns it into a string representation
    func appendToCalculationString(text: String){
        if calculationString == "0"{
            calculationString = ""
            calculationString += "\(text)"
        }
        else{
            calculationString += "\(text)"
        }
    }
    
    
    func succesfulOut(){
        outSuccessAlert = true
    }
    
    func checkoutSuccess (){
        outSuccessAlert.toggle()
    }
    //
    //
    //
    //--------------------------Calculation FUNCTIONS---------------------------//
    
    
    // Calculate Turn
    
    func CalculateOut() {
        
        //Declare an expression that will be used to calculate the players score
        let expn = NSExpression(format:"\(calculationString)")
        let currentScore = expn.expressionValue(with: nil, context: nil)as? Int
        
        //Take the calculation string and calculate the value to be deducted from the players score
        if player1Turn && player1.score.totalScore > 180{
            //Check if the score is greater than 180
            scoreNotPossible = true
            print("Score is above 180 points")
            player1.score.updateCurrentScore(score: currentScore ?? -1)
        }
        else if player2Turn && player2.score.totalScore > 180 {
            scoreNotPossible = true
            print("Score is above 180 points")
            player2.score.updateCurrentScore(score: currentScore ?? -1)
        }
        
        
        
        resetCalculationString()
        changeTurns()
        
    }
    
    
    func getCalcButtonNumbers(number: Int) {
        if number == 10{
            appendToCalculationString(text: "+")
        }
        else if number == 11 {
            appendToCalculationString(text: "0")
        }
        else if number == 12 {
            appendToCalculationString(text: "*")
        }
        else {
            appendToCalculationString(text: "\(String(number))")
        }
    }
    
    func EnterButton(){
        
        //Declare an expression that will be used to calculate the players score
        let expn = NSExpression(format:"\(calculationString)")
        let currentScore = expn.expressionValue(with: nil, context: nil)as! Int
        
        //Take the calculation string and calculate the value to be deducted from the players score
        if player1Turn{
            //Check if the score is greater than 180
            if player1.score.totalScore > 180 {
                scoreNotPossible = true
                print("Score is above 180 points")
            }
            player1.score.updateCurrentScore(score: currentScore)
        }
        else {
            //Check if the score is greater than 180
            if player2.score.totalScore > 180 {
                scoreNotPossible = true
                print("Score is above 180 points")
            }
            player2.score.updateCurrentScore(score: currentScore)
        }
        
        resetCalculationString()
        changeTurns()
    }
    
    
    
    
    func startGame() {
        
        
        
        //        let player1 = Play501View().player1
        //        let player2 = Play501View().player2
        //
        //        let player1Name = player1.user.name
        //        let player2Name = player2.user.name
        //
        //        let gameName = game.gameName
        
        
        //initialize the players points to the points for the game chosen
        player1.score.totalScore = 501
        player2.score.totalScore = 501
        
        //initialize the players to start
        self.player1Turn = true
        self.player2Turn = false
        
        
        //        print("The game being played is \(gameName). In this game each player will start with \(gameName) and for each turn the player will have the points scored deducted from their total points")
        print("\nThe player that starts the game is: \(player1.user.name)")
        print("\n\(player1.user.name) will follow")
        
    }
    
    
    
    
    
    
    func showScores(_ player1: Player, _ player2: Player){
        let name1 = player1.user.name
        let currentScore1 = player1.score.currentScore
        let totalScore1 = player1.score.totalScore
        let scores1 = player1.score.roundScores
        
        let name2 = player2.user.name
        let currentScore2 = player2.score.currentScore
        let totalScore2 = player2.score.totalScore
        let scores2 = player2.score.roundScores
        
        print("\t\t\t\t\(name1)(\(totalScore1)) - \(name2)(\(totalScore2))")
        print(scores1)
        print(currentScore1)
        
        print(scores2)
        print(currentScore2)
        
        
    }
    //    mutating
    func updateP1Score(_ score: Int){
        
        player1.score.updateCurrentScore(score: score)
        print("\n--------------------------------------------------------\n")
        
        print("\t\t***** Player1 scored \(score) points *****\n")
        showScores(player1, player2)
    }
    //    mutating
    func updateP2Score(_ score: Int){
        player2.score.updateCurrentScore(score: score)
        print("\n--------------------------------------------------------\n")
        print("\t\t***** Player2 scored \(score) points *****\n")
        
        showScores(player1, player2)
    }
    
    //    mutating func undoP1Score() {
    //        print(player1.score.roundScores.count)
    //        print("\n------------------- CLEAR BUTTON PRESSED -----------------\n")
    //        print("\t\t \(player1.score.roundScores.last ?? 0) was removed from the player2's scores")
    //
    //        player1.score.undoLastRound()
    //
    //        print("\n--------------------------------------------------------\n")
    //    }
    //    mutating func undoP2Score() {
    //        print("\n------------------- CLEAR BUTTON PRESSED -----------------\n")
    //        print("\t\t \(player2.score.roundScores.last ?? 0) was removed from the player1's scores")
    //
    //        player1.score.undoLastRound()
    //
    //        print("\n--------------------------------------------------------\n")
    //    }
    
    
    
    
    
    
    
    
    //--------------------------GAME FUNCTIONS---------------------------//
    //
    //
    //
    //Change the opponents turn
    func changeTurns(){
        //Changes LED Status for player in 501 game
        player1Turn.toggle()
        player2Turn.toggle()
    }
    //Undo button resets the last turn and starts the previous turn over
    func undoTurn() {
        //UNDOING LAST TURN FOR PLAYER
        //While player?'s turn and player? has scored more than 1 turn prior
        //set calc string to 0
        //get last turns points
        //deduct last turns points from total points earned for stats sheet
        //deduct 3 darts from total darts thrown
        //add back the points that were taken away from last round
        //put the last turns points in the calculation bar
        //remove the last turns points from the list of points
        changeTurns()
        calculationString = "0"
        
        if player1Turn && player1.score.roundScores.count > 0 && player1.totalPointsEarned != 501{
            let endOfPlayer1Scores = player1.score.roundScores.count-1
            player1.totalPointsEarned -=  endOfPlayer1Scores
            player1.dartsThrown -= 3
            player1.score.currentScore += player1.score.roundScores[endOfPlayer1Scores]
            calculationString = "\(player1.score.roundScores[player1.score.roundScores.count-1])"
            player1.score.totalScore += player1.score.roundScores.last ?? 0
            player1.score.roundScores.removeLast()
            changeTurns()
        }
        else if player2Turn && player2.score.roundScores.count > 0 && player2.score.totalScore != 501{
            let endOfPlayer2Scores = player2.score.roundScores.count-1
            player2.totalPointsEarned -=  endOfPlayer2Scores
            player2.dartsThrown -= 3
            player2.score.currentScore += player2.score.roundScores[endOfPlayer2Scores]
            calculationString = "\(player2.score.roundScores[player2.score.roundScores.count-1])"
            player2.score.totalScore += player1.score.roundScores.last ?? 0
            player2.score.roundScores.removeLast()
            changeTurns()
        }
        changeTurns()
    }
    
    
    //Get the winner to the current game
    func GetWinner(_ player1: Player, _ player2: Player) -> Player {
        if player1.score.totalScore == 0{
            return player1
        }
        else if player2.score.totalScore == 0 {
            return player2
        }
        return player1
    }
    //Resets the current game status for both players
    func restartGame(){
        //Restart game points 501
        //Empty player1 & player2 point arrays
        //Reset calculation string
        player1.score.totalScore = 501
        player2.score.totalScore = 501
        player1.score.roundScores.removeAll()
        player2.score.roundScores.removeAll()
        resetCalculationString()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //------------------------------------------------------------------------------------------------------------
    //                          STATISTICS VARIABLES/FUNCTIONS/COMPUTED PROPERTIES
    //------------------------------------------------------------------------------------------------------------
    func checkHighestScore(_ : Int){
        // Update new highest turn score for player?
        if player1Turn && player1.score.currentScore > player1.highestTurn {
            player1.highestTurn = player1.score.currentScore
        }
        if player2Turn && player2.score.currentScore > player2.highestTurn {
            player2.highestTurn = player2.score.currentScore
        }
    }
    
    func calculate3DartAverage() -> String {
        if (player2Turn){
            if (player2.dartsThrown > 0) {
                return "\((player2.totalPointsEarned/player2.dartsThrown)*3) PPR"
            } else {
                return "0.0 PPR"
            }
        }
        else {
            if (player2.dartsThrown > 0) {
                return "\((player2.totalPointsEarned/player2.dartsThrown)*3) PPR"
            } else {
                return "0.0 PPR"
            }
        }
    }
    
    
    
    func calculateOutAverage() -> String {
        if (player1Turn && player1.attemptsAtOut > 0){
            return "\(player1.attemptsAtOut/player1.dartsThrownAtOut) %"
        }
        else if (player2Turn && player2.attemptsAtOut > 0) {
            return "\(player2.attemptsAtOut/player2.dartsThrownAtOut) %"
        }
        return "0.0 %"
    }
    
}


struct Play501View_Previews: PreviewProvider {
    static var previews: some View {
        Play501View()
    }
}





struct CalculationStringBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 275, maxHeight: 50)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .font(.largeTitle)
            .foregroundColor(.black)
            .shadow(radius: 10)
        
    }
}
extension View {
    func MakeCalculationStringBox() -> some View {
        modifier(CalculationStringBox())
    }
}

struct WhiteButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .tint(.white)
            .shadow(radius: 10)
    }
}

extension View {
    func MakeWhiteButton() -> some View {
        modifier(WhiteButton())
    }
}
struct EnterAndClearButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.title.bold())
            .foregroundColor(.red)
            .tint(.white)
            .shadow(radius: 10)
            .padding(5)
    }
}
extension View {
    func MakeEnterAndClearButtonBackground() -> some View {
        modifier(EnterAndClearButton())
    }
}

struct NumberButtonBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 120, height: 80, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 10)
    }
}
extension View {
    func MakeNumberButtonBackground() -> some View {
        modifier(NumberButtonBackground())
    }
}


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}


struct User {
    var name: String
    var email: String
    var password: String
}

enum DartGame {
    case threeHundredOne
    case fourHundredOne
    case fiveHundredOne
    case cricket
    
    var startingScore: Int {
        switch self {
            case .threeHundredOne:
                return 301
            case .fourHundredOne:
                return 401
            case .fiveHundredOne:
                return 501
            case .cricket:
                return 0
        }
    }
    
    var gameName: String {
        switch self {
            case .threeHundredOne:
                return "301"
            case .fourHundredOne:
                return "401"
            case .fiveHundredOne:
                return "501"
            case .cricket:
                return "Cricket"
        }
    }
    
    var isCricket: Bool {
        return self == .cricket
    }
    }



