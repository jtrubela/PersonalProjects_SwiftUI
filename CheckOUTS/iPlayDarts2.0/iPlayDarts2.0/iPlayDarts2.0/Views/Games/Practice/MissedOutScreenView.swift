//
//  MissedOutScreenView.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct MissedOutScreenView: View {
    
    @State var currentTurnPoints = GameModel().currentTurnPoints
    @State var thisOut = GameModel().thisOut
    //    @State var whatsMyOutScreenView = GameModel().whatsMyOutScreenView
    //    @State var checkoutViewMissed = GameModel().checkoutViewMissed
    
    
    var body: some View {
        NavigationView {
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
                                    .focused(GameModel().$amountIsFocused)
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
                                //                                whatsMyOutScreenView = true
                                //                                checkoutViewMissed = false
                            }
                            .buttonStyle(.borderedProminent)
                            .font(.title)
                            .padding(40)
                        }.foregroundColor(.white).font(.title2).fixedSize()
                    }
                    Spacer()
                }
            }
            
        }
    }
}

struct MissedOutScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MissedOutScreenView()
    }
}
