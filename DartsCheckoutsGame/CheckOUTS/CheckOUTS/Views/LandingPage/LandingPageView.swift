//
//  HomeScreenView.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct LandingPageView: View {
    @State private var player1Name = GameModel().player1_501.name
    @State private var player2Name = GameModel().player2_501.name
    
    var body: some View {
        NavigationView{
            ZStack{
                HomeScreenViewBackground()
                VStack{
                    HStack{
                        LoginButton()
                            .buttonStyle(.borderedProminent)
                            .padding(30)
                        Spacer()
                        TodaysStatsButton()
                            .buttonStyle(.bordered)
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
                        WhatsMyOutButton()
                            .MakeWhiteButton()
                        HStack{
                            Play501Button()
                                .MakeWhiteButton()
                            PlayCricketButton()
                                .MakeWhiteButton()
                        }
                        PracticeButton()
                            .MakeWhiteButton()
                    }
                    .padding(30)
                    .foregroundColor(.black)
                    .font(.title)
                    Spacer()
                }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
