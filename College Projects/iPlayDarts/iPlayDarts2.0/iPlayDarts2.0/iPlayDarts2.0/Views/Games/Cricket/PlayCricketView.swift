//
//  PlayCricketView.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct PlayCricketView: View {
    var body: some View {
        NavigationView {
            ZStack{
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
                                            GameModel().player1_501.isTurn.toggle()
                                            GameModel().player2_501.isTurn.toggle()
                                        } label: {
                                            Image(GameModel().player1_501.isTurn ? "LEDOn" : "LEDOff")
                                                .resizable()
                                                .frame(width: 40, height: 40, alignment: .center)
                                        }
                                        Text("\(GameModel().player1_501.name)")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    Spacer()
                                    Button(){
                                        Play501View().restartGame()
                                    } label: {
                                        Image(systemName: "arrow.triangle.2.circlepath.circle")
                                            .resizable()
                                            .frame(width: 40, height: 40, alignment: .center)
                                            .tint(.green)
                                        
                                    }
                                    Spacer()
                                    VStack{
                                        Button(){
                                            Play501View().changeTurns()
                                        } label: {
                                            Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                                .resizable()
                                                .frame(width: 40, height: 40, alignment: .center)
                                        }
                                        Text("\(GameModel().player2_501.name)")
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
                                            Text("\(GameModel().player1CRICKETPoints)")
                                                .MakeCricketPointText()
                                        }
                                        Spacer()
                                        VStack{
                                            Text("\(GameModel().player2CRICKETpoints)")
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
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }
                            }
                            Text("20").padding(10)
                            ForEach(1..<4){ image in
                                Button(){
                                    
                                } label: {
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
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
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }
                            }
                            Text("19").padding(10)
                            ForEach(1..<4){ image in
                                Button(){
                                    
                                } label: {
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
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
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }
                            }
                            Text("18").padding(10)
                            ForEach(1..<4){ image in
                                Button(){
                                    
                                } label: {
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
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
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }
                            }
                            Text("17").padding(10)
                            ForEach(1..<4){ image in
                                Button(){
                                    
                                } label: {
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
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
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }
                            }
                            Text("16").padding(10)
                            ForEach(1..<4){ image in
                                Button(){
                                } label: {
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
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
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }
                            }
                            Text("15").padding(10)
                            ForEach(1..<4){ image in
                                Button(){
                                    
                                } label: {
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
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
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }
                            }
                            Text("B").padding(10)
                            ForEach(1..<4){ image in
                                Button(){
                                    
                                } label: {
                                    Image(GameModel().player2_501.isTurn ? "LEDOn" : "LEDOff")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }
                            }
                        }.padding(20)
                    }
                    
                    
                    HStack{
                        MainMenuButton()
                        //                        Button(){
                        //                            GameModel().cricketView = false
                        //                            GameModel().homeScreenView = true
                        //                        } label: {
                        //                            Text("Main Menu")
                        //                        }
                    }
                }
            }
        }
    }
}

struct PlayCricketView_Previews: PreviewProvider {
    static var previews: some View {
        PlayCricketView()
    }
}
