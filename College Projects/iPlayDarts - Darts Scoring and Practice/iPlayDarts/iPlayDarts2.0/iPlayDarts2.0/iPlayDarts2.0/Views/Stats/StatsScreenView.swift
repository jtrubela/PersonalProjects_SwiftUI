//
//  StatsScreenView.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct StatsScreenView: View {
    
    @State var getPracticeNumber = GameModel().getPracticeNumber
    @State var practiceNumbers = GameModel().practiceNumbers
    @State var practiceAttempts = GameModel().player1_501.practiceAttempts
    
    @State var practiceHits = GameModel().player1_501.practiceHits
    @State var practiceMisses = GameModel().player1_501.practiceMisses
    
    @State var player1Name = GameModel().player1_501.name
    @State var dartsThrownHome = GameModel().player1_501.dartsThrown
    @State var highestTurnHome = GameModel().player1_501.highestTurn
//    @State var calculate3DartAverageHome = GameModel().player1_501.calculate3DartAverage
    
    @State var player2Name = GameModel().player2_501.name
    @State var dartsThrownAway = GameModel().player2_501.dartsThrown
    @State var highestTurnAway = GameModel().player2_501.highestTurn
//    @State var calculate3DartAverageAway = GameModel().player2_501.calculate3DartAverage
    
    
    @State var calculateOutAverage = GameModel().calculateOutAverage
    
    
    var body: some View {
        NavigationView{
            ZStack{
                HomeScreenViewBackground()
                VStack{
                    HStack{
                        Play501Button()
                        //                        NavigationLink(destination: Play501View(), label: {
                        //                            Text("Play 501")
                        //                        })
                            .padding(30)
                        MainMenuButton()
                        Spacer()
                        //                        NavigationLink(destination: HomeScreenView(), label: {
                        //                            Text("Main Menu")
                        //                        })
                        
                            .padding(30)
                    }
                    Spacer()
                    Text("Today's Statistics")
                        .foregroundColor(.white)
                        .font(.title.bold())
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
                                        Text("\(player1Name)")
                                            .foregroundColor(.yellow)
                                            .font(
                                                .title3.bold())
                                        //Darts thrown
                                        Text("Darts Thrown: \(dartsThrownHome)")
                                        //Highest Turn
                                        Text("Highest Turn: \(highestTurnHome)")
                                        //3 Dart Average
                                        Text("3 Dart Avg.: \(GameModel().calculate3DartAverage())")
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
                                        Text("\(player2Name)")
                                            .foregroundColor(.yellow).font(.title3.bold())
                                        //Darts thrown
                                        Text("Darts Thrown: \(dartsThrownAway)")
                                        //Highest Turn
                                        Text("Highest Turn: \(highestTurnAway)")
                                        //3 Dart Average
                                        Text("3 Dart Avg.: \(GameModel().calculate3DartAverage())")
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
            }
        }
    }
}


struct StatsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StatsScreenView()
    }
}
