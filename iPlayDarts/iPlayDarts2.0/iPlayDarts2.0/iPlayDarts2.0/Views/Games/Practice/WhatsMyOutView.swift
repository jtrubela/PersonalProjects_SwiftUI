//
//  WhatsMyOutView.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct WhatsMyOutScreenView: View {
    @State var outTitle = GameModel().outTitle
    //    @State var whatsMyOutScreenView = GameModel().whatsMyOutScreenView
    //    @State var checkoutViewMissed = GameModel().checkoutViewMissed
    //    @State var homeScreenView = GameModel().homeScreenView
    //    @State var gameView = GameModel().gameView
    
    @State var outSuccessAlert = GameModel().outSuccessAlert
    
    @State var Checkout1 = GameModel().Checkout1
    @State var Checkout2 = GameModel().Checkout2
    @State var Checkout3 = GameModel().Checkout3
    
    @State var thisOut = GameModel().thisOut
    
    @State var currentTurnPoints = GameModel().currentTurnPoints
    
    @FocusState var amountIsFocused: Bool
    
    
    var body: some View {
        NavigationView {
            ZStack{
                HomeScreenViewBackground()
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
                                //                                checkoutViewMissed = true
                                //                                whatsMyOutScreenView = false
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
                    
                    //Buttons
                    Section{
                        HStack {
                            Section{
                                Button("New Out"){
                                    //                                    GameModel().whatsMyOutScreenView = false
                                    //                                    GameModel().hitOutScreenView = true
                                }
                                
                                Play501Button()
                                
                                MainMenuButton()
                                
                                
                            }
                            .buttonStyle(.bordered)
                            .tint(.blue)
                            .foregroundColor(.white)
                            .font(.title2)
                            .shadow(radius: 10)
                            
                        }
                        
                    }
                    Spacer()
                    Spacer()
                    //-------------------------WHATS MY OUT BUTTONS----------------------
                }.alert(outTitle, isPresented: $outSuccessAlert) {
                    Button("Continue"){}
                } message: {
                    Text("Nice Shot\n Added to your stats")
                }.keyboardType(.numberPad)
            }
        }
        
    }
}

struct WhatsMyOutView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsMyOutScreenView()
    }
}
