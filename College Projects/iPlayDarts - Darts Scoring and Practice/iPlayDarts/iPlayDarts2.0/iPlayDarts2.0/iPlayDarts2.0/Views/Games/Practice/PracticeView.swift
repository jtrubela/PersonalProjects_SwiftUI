//
//  PracticeView.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct PracticeView: View {
    
    @State var getPracticeNumber = GameModel().getPracticeNumber
    @State var practiceNumbers = GameModel().practiceNumbers
//    @State var practiceHits = GameModel().practiceHits
//    @State var practiceMisses = GameModel().practiceMisses
    
    
    
    var body: some View {
        NavigationView {
            ZStack{
                HomeScreenViewBackground()
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
                                GameModel().player1_501.practiceHits += 1
                            } label: {
                                Image("Hit")
                            }.shadow(radius: 20)
                            
                            Spacer()
                            Button{
                                practiceNumbers.shuffle()
                                GameModel().player1_501.practiceMisses += 1
                            } label: {
                                Image("Miss")
                            }.shadow(radius: 20)
                            Spacer()
                        }
                    }
                    Spacer()
                    //--------------------ROUND STATISTICS---------------------
                    //  Hits  /  Missed  /  Hits/Misses
                    Section{
                        VStack{
                            HStack{
                                Spacer()
                                Text("Hit:  \(GameModel().player1_501.practiceHits)  ")
                                    .font(.title.bold()).foregroundColor(.green)
                                Spacer()
                                Text("      Missed: \(GameModel().player1_501.practiceMisses)")
                                    .font(.title.bold())
                                Spacer()
                            }
                            .font(.title3).foregroundColor(.green)
                            
                            Text("Hits/Misses: \(GameModel().player1_501.practiceHits)/\(GameModel().player1_501.practiceMisses)")
                            
                                .font(.title.bold()).foregroundColor(.black)
                        }
                        Spacer()
                    }
                    //-----------------------MENU BUTTON-----------------------
                    Section{
                        MainMenuButton()
                            .MakeButtonWhite()
                    }
                    .foregroundColor(.black).font(.title2)
                }
                
            }
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
