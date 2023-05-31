//
//  GameModel.swift
//  CheckOUTS
//
//  Created by Justin Trubela
//  Date - 1/22/22

import SwiftUI

struct GameModel {
    // Alerts
    @State var outSuccessAlert = false
    @State var noOutFailureAlert = false
    @State var scoreNotPossible = false
    var scoreNotPossibleErrorMessage = "Score not possible try again"
    var errorMessage = "No Out for this number"
    @State  var outTitle = ""
    @State var noOutTitle = ""
    

    
    // Keyboard Modifiers
    @FocusState  var amountIsFocused: Bool

    
    
    
    
    
    //Darts Checkouts Data
    @State var validOuts = Checkouts().validOuts
    @State var invalidOuts = Checkouts().invalidOuts
    @State var practiceNumbers = Checkouts().practiceNumbers.shuffled()

    
    
    
    //Login Variables
    @State var username = ""
    @State var password = ""
    
    
    
    //Whats my out variables
    @State var thisOut = 106
    @State var currentTurnPoints = 0
    
    //Whats my out
    func getOut() {
        if player1_501.isTurn{
            thisOut = player1_501.points
        }
        else{
            thisOut = player2_501.points
        }
    }
    
//    struct Scoring {
//        var points: Int
//        var currentScore: Int
//        var lastScore: Int
//
//        var scores = [Int]()
//
//        init(points: Int, currentScore: Int, lastScore: Int, scores: [Int] = [Int]()) {
//            self.points = points
//            self.currentScore = currentScore
//            self.lastScore = lastScore
//            self.scores = scores
//        }
//
//    }
    
    
    struct Calculator {
        var buttons = [" + ", "0", " * "]
    }
    
    
    
    //Play 501
    //Home
    var calculationButtons = [" + ", "0", " * "]
    
    
    
    
    struct Player {
            var isTurn: Bool
            var name: String
            var currentScore = 0
            var lastScore = 0
        
            var points: Int
        
            var dartsThrown = 0
            var ThreeDartAverage = 0.0
            var highestTurn = 0
            var attemptsAtOut = 0
            var totalPointsEarned = 0
            var dartsThrownAtOut = 0
        
            var practiceHits = 0
            var practiceMisses = 0
            var practiceAttempts = 0
            var practice_HighestHit = 0
            var currentPracticeNumber = 0
        
        
            var scores = [Int]()
        
            init(isTurn: Bool, name: String, points: Int, scores: [Int] = [Int]()) {
                self.isTurn = isTurn
                self.name = name
                self.points = points
        
                self.scores = scores
            }
        
        }

    
    
    @State var player1_501 = Player(isTurn: true, name: "", points: 501)
    @State var player2_501 = Player(isTurn: false, name: "", points: 501)
    
    
//    @State var player1Turn = true
//    @State var player1Name = ""
//    @State var player1Points = 501
//    @State var player1Scores = [Int]()
//    //Away
//    @State var player2Turn = false
//    @State var player2Name = ""
//    @State var player2Points = 501
//    @State var player2Scores = [Int]()
    //Other
//    @State var currentScore = 0
//    @State var lastScore = 0
    
    @State var calculationString = "0"
    @State var undoLastTurn = 0
    
    var winner: String {
        var thisWinner = ""
        if player1_501.points == 0{
            thisWinner = player1_501.name
        }
        if player2_501.points == 0{
            thisWinner = player2_501.name
        }
        return thisWinner
    }

    
//TODO: Implement Cricket studds
    //Cricket variables
    //Home
    @State  var player1CRICKETPoints = 0
//    @State var player1_cricket = Player(isTurn: true, name: "", points: 0)

    //Away
    @State  var player2CRICKETpoints = 0
//    @State var player2_cricket = Player(isTurn: false, name: "", points: 0)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //------------------------------------------------------------------------------------------------------------
    //                          STATISTICS VARIABLES/FUNCTIONS/COMPUTED PROPERTIES
    //------------------------------------------------------------------------------------------------------------
    //Home
//    @State  var dartsThrownHome = 0
//    @State  var ThreeDartAverageHome = 0.0
//    @State  var highestTurnHome = 0
//    @State  var attemptsAtOutHome = 0
//    @State  var totalPointsEarnedHome = 0
//    @State  var dartsThrownAtOutHome = 0
    //Away
//    @State  var dartsThrownAway = 0
//    @State  var ThreeDartAverageAway = 0.0
//    @State  var highestTurnAway = 0
//    @State  var attemptsAtOutAway = 0
//    @State  var totalPointsEarnedAway = 0
//    @State  var dartsThrownAtOutAway = 0
    //Other
    func checkHighestScore(_ : Int){
        // Update new highest turn score for player?
        if player1_501.isTurn && player1_501.currentScore > player1_501.highestTurn {
            player1_501.highestTurn = player1_501.currentScore
        }
        if player2_501.isTurn && player2_501.currentScore > player2_501.highestTurn {
            player2_501.highestTurn = player2_501.currentScore
        }
    }

    func calculate3DartAverage() -> String {
        if (player1_501.isTurn){
            if (player1_501.dartsThrown > 0) {
                return "\((player1_501.totalPointsEarned/player1_501.dartsThrown)*3) PPR"
            } else {
                return "0.0 PPR"
            }
        }
        else {
            if (player2_501.dartsThrown > 0) {
                return "\((player2_501.totalPointsEarned/player2_501.dartsThrown)*3) PPR"
            } else {
                return "0.0 PPR"
            }
        }
    }


    var calculateOutAverage: String {
        if (player1_501.isTurn){
            if (player1_501.attemptsAtOut > 0) {
                return "\(player1_501.attemptsAtOut/player1_501.dartsThrownAtOut) %"
            }
        }
        else if (player2_501.isTurn) {
            if (player2_501.attemptsAtOut > 0){
                return "\(player2_501.attemptsAtOut/player2_501.dartsThrownAtOut) %"
            }
        }
        return "0.0 %"
    }
    
    
    
    
    
    //MARK: PLAYERS
    //MARK: PRACTICE
    //MARK: AVERAGE/HIGH SCORE
    
    
    
    
    
    //Practice game variables
//    @State  var practiceHits = 0
//    @State  var practiceMisses = 0
//    @State  var practiceAttempts = 0
//    @State  var practice_HighestHit = 0
//    @State  var currentPracticeNumber = 0
//
    var randNum = Int.random(in: 1..<62)
    
    var getPracticeNumber: String {
        return practiceNumbers[randNum]
    }
    
    
    //    var body: some View {
    
    //        ZStack {
    //            LinearGradient(
    //                gradient: Gradient(colors: [.black,.gray]),
    //                startPoint: .top, endPoint: .bottom).ignoresSafeArea()
    
    /*if homeScreenView{
     VStack{
     HStack{
     Button("Log in"){
     homeScreenView.toggle()
     loginMenuView.toggle()
     }
     .padding(30)
     
     Spacer()
     
     Button("Today's Stats"){
     homeScreenView.toggle()
     statsScreenView.toggle()
     }
     .padding(30)
     }
     
     Spacer()
     
     VStack{
     Text("iPlay Darts")
     .font(.largeTitle.bold())
     .foregroundColor(.white)
     TextField("Enter Player 1 Name", text: $player1Name)
     .MakeTextFieldEntry()
     .shadow(color: .blue, radius: 10, x: 8, y: 2)
     
     TextField("Enter Player 2 Name", text: $player2Name)
     .MakeTextFieldEntry()
     .shadow(color: .blue, radius: 10, x: 8, y: 2)
     
     }.padding(10)
     Spacer()
     Spacer()
     VStack{
     Button("What's My Out?"){
     whatsMyOutScreenView = true
     checkoutViewMissed = false
     homeScreenView = false
     gameView = false
     practiceView = false
     }
     .MakeWhiteButton()
     
     HStack{
     Button("501"){
     whatsMyOutScreenView = false
     checkoutViewMissed = false
     homeScreenView = false
     gameView = true
     }
     .MakeWhiteButton()
     
     Button("Cricket"){
     homeScreenView = false
     cricketView = true
     }
     .MakeWhiteButton()
     }
     Button("Practice Game"){
     whatsMyOutScreenView = false
     checkoutViewMissed = false
     homeScreenView = false
     gameView = false
     practiceView = true
     }
     .MakeWhiteButton()
     
     }
     .foregroundColor(.black)
     .font(.title)
     Spacer()
     }
     }*/
    /*else if loginMenuView{
     VStack{
     HStack{
     Button("Main Menu"){
     homeScreenView = true
     loginMenuView = false
     }.padding(30)
     Spacer()
     Button("New User"){
     
     }.padding(30)
     }
     
     Spacer()
     
     Text("Welcome Back!").font(.largeTitle.bold()).foregroundColor(Color.white)
     
     
     
     TextField("Enter Email Address", text: $username)
     .MakeTextFieldEntry()
     .shadow(color: .white, radius: 10, x: 8, y: 2)
     TextField("Enter Password", text: $password)
     .MakeTextFieldEntry()
     .shadow(color: .white, radius: 10, x: 8, y: 2)
     
     
     HStack{
     Spacer()
     Spacer()
     Button(){
     
     } label: {
     Text("Forgot Password")
     }
     Spacer()
     
     Button(){
     player1Name = "Justin"
     homeScreenView.toggle()
     loginMenuView.toggle()
     }label: {
     Text("Login")
     }
     .MakeGreenButton()
     Spacer()
     Spacer()
     }
     Spacer()
     Spacer()
     }
     }*/
    /*else if statsScreenView{
     VStack{
     HStack{
     Button("Play 501"){
     statsScreenView.toggle()
     gameView.toggle()
     }.padding(30)
     Spacer()
     Button("Main Menu"){
     statsScreenView.toggle()
     homeScreenView.toggle()
     }.padding(30)
     }
     Spacer()
     Text("Today's Statistics").foregroundColor(.white).font(.title.bold())
     Spacer()
     VStack{
     Spacer()
     //501 STATISTICS
     Section{
     HStack{
     Spacer()
     //Home
     Section{
     VStack{
     Text("\(player1Name)").foregroundColor(.yellow).font(.title3.bold())
     //Darts thrown
     Text("Darts Thrown: \(dartsThrownHome)")
     //Highest Turn
     Text("Highest Turn: \(highestTurnHome)")
     //3 Dart Average
     Text("3 Dart Avg.: \(calculate3DartAverageHome)")
     //Check Out Percentage
     Text("Checkout %: \(calculateOutAverage)")
     //Matches Won/Lost
     Text("Matches Won: 1")
     Text("Matches Lost: 0")
     }
     }
     Spacer()
     //Away
     Section{
     VStack{
     Text("\(player2Name)").foregroundColor(.yellow).font(.title3.bold())
     //Darts thrown
     Text("Darts Thrown: \(dartsThrownAway)")
     //Highest Turn
     Text("Highest Turn: \(highestTurnAway)")
     //3 Dart Average
     Text("3 Dart Avg.: \(calculate3DartAverageAway)")
     //Check Out Percentage
     Text("Checkout %: \(calculateOutAverage)")
     //Matches Won/Lost
     Text("Matches Won: 0")
     Text("Matches Lost: 1")
     }
     }
     Spacer()
     }
     } header: {
     Text("501").font(.title2)
     }
     Spacer()
     //CRICKET STATISTICS
     Section{
     Text("Under Construction").foregroundColor(.red)
     HStack{
     Spacer()
     VStack{
     Text("\(player1Name)").foregroundColor(.yellow).font(.title3.bold())
     
     Text("9 Marks: 0")
     Text("7 Marks: 0")
     Text("6 Marks: 0")
     Text("5 Marks: 0")
     Text("Darts Thrown: 0")
     Text("Marks/Round: ")
     Text("0.0 MPR")
     Text("Matches Won: 0")
     Text("Matches Lost: 0")
     }
     Spacer()
     VStack{
     Text("\(player2Name)").foregroundColor(.yellow).font(.title3.bold())
     
     Text("9 Marks: 0")
     Text("7 Marks: 0")
     Text("6 Marks: 0")
     Text("5 Marks: 0")
     Text("Darts Thrown: 0")
     Text("Marks/Round: ")
     Text("0.0 MPR")
     Text("Matches Won: 0")
     Text("Matches Lost: 0")
     }
     Spacer()
     }
     
     
     
     } header: {
     Text("Cricket").font(.title2)
     }
     Spacer()
     //PRACTICE STATISTICS
     Section{
     
     Text("Attempts: \(practiceAttempts)")
     Text("Attempts Hit: \(practiceHits)")
     Text("Attempts Missed: \(practiceMisses)")
     } header: {
     Text("Practice").font(.title2)
     }
     Spacer()
     }.foregroundColor(.white)
     }
     }*/
    /*else if gameView {
     VStack{
     Spacer()
     HStack{
     Spacer()
     Button("Quit"){
     player1Points = 501
     player2Points = 501
     gameView = false
     homeScreenView = true
     calculationString = "0"
     }
     Spacer()
     Button("Main Menu"){
     homeScreenView = true
     gameView = false
     }
     Spacer()
     }
     
     Spacer()
     //------------------PLAYER1&2 SCORES/NAMES + LEDS--------------------
     Section{
     HStack{
     Spacer()
     //Player 1&2 score
     VStack{
     HStack{
     Spacer()
     VStack{
     Button(){
     player1Turn.toggle()
     player2Turn.toggle()
     } label: {
     Image(player1Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     Text("\(player1Name)").foregroundColor(.white).font(.title3)
     }
     Spacer()
     Button(){
     restartGame()
     } label: {
     Image(systemName: "arrow.triangle.2.circlepath.circle")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     .tint(.green)
     
     }
     Spacer()
     VStack{
     Button(){
     player1Turn.toggle()
     player2Turn.toggle()
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     Text("\(player2Name)")
     .foregroundColor(.white)
     .font(.title3)
     }
     Spacer()
     }
     HStack{
     Spacer()
     VStack{
     
     
     Text("\(player1Points)")
     .MakePlayerPointsBox()
     
     }
     
     Spacer()
     
     VStack{
     
     
     Text("\(player2Points)")
     .MakePlayerPointsBox()
     }
     Spacer()
     }
     }
     Spacer()
     }
     }
     Spacer()
     Spacer()
     //-------------------------CALCULATION STRING------------------------
     Section{
     HStack{
     
     Text("\(calculationString)")
     .MakeCalculationStringBox()
     Button("C"){
     calculationString = "0"
     }
     .frame(width: 50, height: 50, alignment: .center)
     .background(.white)
     .clipShape(RoundedRectangle(cornerRadius: 20))
     }
     }
     //--------------------------CALC BUTTONS-----------------------------
     Section{
     VStack{
     Spacer()
     HStack{
     ForEach(7..<10) { number in
     Button {
     appendToCalculationString(text: "\(String(number))")
     } label : {
     Text("\(String(number))")
     .MakeNumberButtonBackground()
     }
     }
     }
     HStack{
     ForEach(4..<7) { number in
     Button {
     appendToCalculationString(text: "\(String(number))")
     } label : {
     Text("\(String(number))")
     .MakeNumberButtonBackground()
     }
     }
     }
     HStack{
     ForEach(1..<4) { number in
     Button {
     appendToCalculationString(text: "\(String(number))")
     } label : {
     Text("\(String(number))")
     .MakeNumberButtonBackground()
     }
     }
     }
     HStack{
     ForEach(0..<3) { button in
     Button {
     appendToCalculationString(text: "\(calculationButtons[button])")
     } label : {
     Text("\(calculationButtons[button])")
     .MakeNumberButtonBackground()
     }
     }
     }
     
     //----------------------ENTER AND BACK BUTTON------------------------
     Section{
     HStack{
     Button(){
     let expn = NSExpression(format:"\(calculationString)")
     currentScore = expn.expressionValue(with: nil, context: nil)as! Int
     
     if currentScore > 180 {
     scoreNotPossible = true
     }
     else{
     lastScore = currentScore
     checkHighestScore(currentScore)
     
     if player1Turn == true{
     player1Scores.append(currentScore)
     player1Points = player1Points - currentScore
     dartsThrownHome += 3
     totalPointsEarnedHome += currentScore
     
     }
     if player2Turn == true {
     player2Points =  player2Points - currentScore
     player2Scores.append(currentScore)
     dartsThrownAway += 3
     totalPointsEarnedAway += currentScore
     
     }
     calculationString = "0"
     currentScore = 0
     undoLastTurn = 0
     changeTurns()
     
     }
     
     if player1Points == 0 || player2Points == 0
     {
     outSuccessAlert = true
     restartGame()
     }
     
     } label: {
     Text("Enter").foregroundColor(.green)
     }
     .frame(width: 240, height: 80, alignment: .center)
     .MakeEnterAndClearButtonBackground()
     .alert(scoreNotPossibleErrorMessage, isPresented: $scoreNotPossible) {
     Button("Continue", action: resetCalculationString)
     }
     
     Button(){
     undoTurn()
     } label: {
     VStack{
     Image(systemName: "arrow.uturn.backward")
     Text("Undo Last Turn")
     .font(.caption)
     }
     }
     .frame(width: 120, height: 80, alignment: .center)
     .MakeEnterAndClearButtonBackground()
     }
     }
     Spacer()
     }
     }
     .font(.largeTitle).foregroundColor(.black)
     Spacer()
     //-----------WHATS MY OUT QUIT/HOME/WHATSMYOUT/MENU BUTTONS----------
     Section{
     HStack{
     Button("What's My Out?"){
     getOut()
     whatsMyOutScreenView = true
     checkoutViewMissed = false
     homeScreenView = false
     gameView = false
     practiceView = false
     }.MakeButtonWhite()
     }
     }
     }.alert(outTitle, isPresented: $outSuccessAlert) {
     Button("Continue"){}
     } message: {
     Text("WINNER: \(winner) CONGRATULATIONS!")
     }.keyboardType(.numberPad)
     }*/
    /*else if whatsMyOutScreenView{
     VStack{
     //-------------------------ENTER SCORE TEXTFIELD---------------------
     Section{
     VStack{
     Spacer()
     TextField("Enter Score", value: $thisOut, format: .number)
     .MakeRoundedSquareBackground()
     .frame(width: 100, height: 10, alignment: .center)
     .padding(20)
     .foregroundColor(.black)
     .font(.largeTitle.weight(.heavy))
     .keyboardType(.numberPad)
     .focused($amountIsFocused)
     .frame(width: 150, height: 30, alignment: .center).padding()
     Text("Remaining")
     .foregroundColor(.white)
     .font(.title2)
     .frame(width: 250, height: 5, alignment: .center)
     Spacer()
     }
     }
     Spacer()
     //-------------------------HIT OR MISS BUTTONS-----------------------
     Section{
     HStack {
     Spacer()
     Button {
     //SHOW ALERT
     outSuccessAlert = true
     } label: {
     Image("Hit")
     }.shadow(radius: 20)
     Spacer()
     Button{
     checkoutViewMissed = true
     whatsMyOutScreenView = false
     currentTurnPoints = 0
     } label: {
     Image("Miss")
     }.shadow(radius: 20)
     Spacer()
     }.padding(25)
     }
     Spacer()
     //------------------------------OPTIONS------------------------------
     Section{
     VStack{
     Spacer()
     Section{
     OutText(text: "\(Checkout1.checkoutOptions.first?["\(thisOut)"]?.out ?? "")")
     } header: {
     OptionText(text: "     Option 1:")
     }
     Spacer()
     Section{
     OutText(text: "\(Checkout2.checkoutOptions.first?["\(thisOut)"]?.out ?? "")")
     } header: {
     OptionText(text: "     Option 2:")
     }
     Spacer()
     Section{
     OutText(text: "\(Checkout3.checkoutOptions.first?["\(thisOut)"]?.out ?? "")")
     } header: {
     OptionText(text: "     Option 3:")
     }
     Spacer()
     }.MakeRoundedSquareBackground().padding(5)
     }
     //-------------------------WHATS MY OUT BUTTONS----------------------
     Spacer()
     Spacer()
     Section{
     HStack {
     Button("New Out"){
     whatsMyOutScreenView = false
     hitOutScreenView = true
     }
     .buttonStyle(.borderedProminent)
     .tint(.green)
     .shadow(radius: 10)
     Button("Back to 501"){
     whatsMyOutScreenView = false
     checkoutViewMissed = false
     homeScreenView = false
     gameView = true
     }
     .buttonStyle(.borderedProminent)
     .foregroundColor(.black)
     .tint(Color.white)
     .shadow(radius: 10)
     Button("Main Menu"){
     whatsMyOutScreenView = false
     checkoutViewMissed = false
     homeScreenView = true
     gameView = false
     }
     .buttonStyle(.borderedProminent)
     .foregroundColor(.white)
     .tint(.red)
     .shadow(radius: 10)
     }.foregroundColor(.black).font(.title2)
     }
     Spacer()
     Spacer()
     //-------------------------WHATS MY OUT BUTTONS----------------------
     }.alert(outTitle, isPresented: $outSuccessAlert) {
     Button("Continue"){}
     } message: {
     Text("Nice Shot\n Added to your stats")
     }.keyboardType(.numberPad)
     }*/
    /*else if hitOutScreenView{
     ZStack {
     RadialGradient(stops: [
     .init(color: Color(red: 0.0 , green: 0.5, blue: 0.0) , location: 0.3),
     .init(color: .black, location: 0.7),
     ],   center: .center, startRadius: 0, endRadius: 350).ignoresSafeArea()
     VStack {
     VStack{
     //--------------------------ENTER THE OUT-------------------------
     Section{
     TextField("Enter", value: $thisOut, format: .number)
     .padding()
     .foregroundColor(.black)
     .font(.title2)
     .background(.thinMaterial)
     .frame(width: 100, height: 50, alignment: .center)
     .clipShape(RoundedRectangle(cornerRadius: 20))
     .keyboardType(.numberPad)
     .focused($amountIsFocused)
     } header: {
     Text("Enter new out").font(.largeTitle)
     }
     //------------------------GET NEW OUT BUTTON----------------------
     Section{
     Button("Get New Out"){
     if thisOut > 170
     || thisOut <= 1
     || thisOut == invalidOuts[0]
     || thisOut == invalidOuts[1]
     || thisOut == invalidOuts[2]
     || thisOut == invalidOuts[3]
     || thisOut == invalidOuts[4]
     || thisOut == invalidOuts[5]
     || thisOut == invalidOuts[6]
     {
     noOutFailureAlert = true
     noOutTitle = "No out for this number. Try again"
     }
     else{
     whatsMyOutScreenView = true
     hitOutScreenView = false
     }
     }.buttonStyle(.borderedProminent)
     .font(.title)
     .cornerRadius(20).font(.title3).tint(.black).frame(width: 200, height: 60, alignment: .center)
     }
     }
     }
     }.alert(noOutTitle, isPresented: $noOutFailureAlert) {
     Button("Continue"){
     hitOutScreenView = true
     }
     }
     }*/
    /*else if practiceView{
     VStack{
     //-------------------------TITLE---------------------------
     Section{
     VStack{
     Text("Practice Game")
     .font(.largeTitle.bold())
     .foregroundColor(.white)
     }
     }
     Spacer()
     //--------------------HIT NUMBER PROMPT--------------------
     Section{
     VStack{
     Text("Hit \(getPracticeNumber)")
     .MakePracticeNumberWindow()
     }
     }
     Spacer()
     //--------------------HITS/MISS BUTTONS--------------------
     Section{
     HStack {
     Spacer()
     Button {
     practiceNumbers.shuffle()
     practiceHits += 1
     } label: {
     Image("Hit")
     }.shadow(radius: 20)
     
     Spacer()
     Button{
     practiceNumbers.shuffle()
     practiceMisses += 1
     } label: {
     Image("Miss")
     }.shadow(radius: 20)
     Spacer()
     }
     }
     Spacer()
     //--------------------ROUND STATISTICS---------------------
     Section{
     VStack{
     HStack{
     Spacer()
     Text("Hit:  \(practiceHits)  ").font(.title.bold()).foregroundColor(.green)
     Spacer()
     Text("      Missed: \(practiceMisses)").font(.title.bold())
     Spacer()
     }
     .font(.title3).foregroundColor(.green)
     
     Text("Hits/Misses: \(practiceHits)/\(practiceMisses)")
     .font(.title.bold()).foregroundColor(.black)
     }
     Spacer()
     }
     //-----------------------MENU BUTTON-----------------------
     Section{
     Button("Main Menu"){
     homeScreenView = true
     practiceView = false
     }
     .MakeButtonWhite()
     }
     .foregroundColor(.black).font(.title2)
     }
     Spacer()
     }*/
    /*else if checkoutViewMissed{
     ZStack {
     RadialGradient(stops: [
     .init(color: Color(red: 0.5 , green: 0.0, blue: 0.0) , location: 0.3),
     .init(color: .black, location: 0.7),
     ],   center: .center, startRadius: 0, endRadius: 350).ignoresSafeArea()
     VStack(spacing: 50){
     Spacer()
     //-----------------------TITLE-------------------------
     Section{
     Text("CHECKOUT MISSED")
     .foregroundColor(.white)
     .padding()
     .fixedSize()
     .font(.largeTitle)
     }
     Spacer()
     //---------------ENTER POINTS FOR TURN-----------------
     //---------------------TEXTFIELD-----------------------
     Section{
     VStack {
     Section{
     TextField("Enter points scored on this turn", value: $currentTurnPoints, format: .number)
     .padding()
     .foregroundColor(.black)
     .font(.title2)
     .background(.thinMaterial)
     .frame(width: 100, height: 50, alignment: .center)
     .clipShape(RoundedRectangle(cornerRadius: 20))
     .keyboardType(.numberPad)
     .focused($amountIsFocused)
     } header: {
     Text("Enter points scored on this turn").foregroundColor(.white)
     }
     
     }.MakeCapsuledBackground()
     }
     Spacer()
     //---------------GET NEW OUT BUTTON--------------------
     Section{
     VStack {
     Button("Get New Out", role: .destructive){
     thisOut = thisOut-currentTurnPoints
     whatsMyOutScreenView = true
     checkoutViewMissed = false
     }
     .buttonStyle(.borderedProminent)
     .font(.title)
     .padding(40)
     }.foregroundColor(.white).font(.title2).fixedSize()
     }
     Spacer()
     }
     }
     }*/
    /*else if cricketView{
     //------------------PLAYER1&2 SCORES/NAMES + LEDS--------------------
     VStack{
     Section{
     HStack{
     Spacer()
     //Player 1&2 score
     VStack{
     HStack{
     Spacer()
     VStack{
     Button(){
     player1Turn.toggle()
     player2Turn.toggle()
     } label: {
     Image(player1Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     Text("\(player1Name)")
     .foregroundColor(.white)
     .font(.title3)
     }
     Spacer()
     Button(){
     restartGame()
     } label: {
     Image(systemName: "arrow.triangle.2.circlepath.circle")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     .tint(.green)
     
     }
     Spacer()
     VStack{
     Button(){
     changeTurns()
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     Text("\(player2Name)")
     .foregroundColor(.white)
     .font(.title3)
     }
     Spacer()
     }
     //Player Points
     Section{
     HStack{
     Spacer()
     VStack{
     Text("\(player1CRICKETPoints)")
     .MakeCricketPointText()
     }
     Spacer()
     VStack{
     Text("\(player2CRICKETpoints)")
     .MakeCricketPointText()
     }
     Spacer()
     }
     }
     Spacer()
     }
     }
     }
     // Buttons and Number
     Section{
     //Row 1 - 20
     HStack{
     ForEach(1..<4){ image in
     Button(){
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     Text("20").padding(10)
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     }.padding(20)
     //Row 2 - 19
     HStack{
     
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     Text("19").padding(10)
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     }.padding(20)
     //Row 3 - 18
     HStack{
     
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     Text("18").padding(10)
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     }.padding(20)
     //Row 4 - 17
     HStack{
     
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     Text("17").padding(10)
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     }.padding(20)
     //Row 5 - 16
     HStack{
     
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     Text("16").padding(10)
     ForEach(1..<4){ image in
     Button(){
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     }.padding(20)
     //Row 6 - 15
     HStack{
     
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     Text("15").padding(10)
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     }.padding(20)
     //Row 7 - B
     HStack{
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     Text("B").padding(10)
     ForEach(1..<4){ image in
     Button(){
     
     } label: {
     Image(player2Turn ? "LEDOn" : "LEDOff")
     .resizable()
     .frame(width: 40, height: 40, alignment: .center)
     }
     }
     }.padding(20)
     }
     
     
     HStack{
     Button(){
     cricketView = false
     homeScreenView = true
     } label: {
     Text("Main Menu")
     }
     }
     
     }
     }*/
    
    //        }
    //        .toolbar {
    //            ToolbarItemGroup(placement: .keyboard) {
    //                Spacer()
    //                Button("Done"){
    //                    amountIsFocused = false
    //                }
    //            }
    //        }
    //    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameModel()
//    }
//}
/*
 Text("testing")
 .onAppear {
 let result: Checkout = Bundle().decode("CheckoutOption1.json")
 print("\n----> result: \(result) ")
 print("\n----> checkoutOptions1: \(result.checkoutOptions1) ")
 print("\n----> first: \(result.checkoutOptions1.first) ")
 print("\n----> 170: \(result.checkoutOptions1.first?["170"]) ")
 print("\n----> 170 out: \(result.checkoutOptions1.first?["170"]?.out) ")
 }
 */