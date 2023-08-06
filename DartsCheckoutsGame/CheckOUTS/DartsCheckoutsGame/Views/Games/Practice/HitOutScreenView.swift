//
//  HitOutScreenView.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct HitOutScreenView: View {
    @State var invalidOuts = GameModel().invalidOuts
    @State var thisOut = GameModel().thisOut
    @State var noOutTitle = GameModel().noOutTitle
    @State var noOutFailureAlert = GameModel().noOutFailureAlert
    
//    @State var invalidOuts = invalidOuts
    
    var body: some View {
        NavigationView{
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
                                .focused(GameModel().$amountIsFocused)
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
                                    //                                    GameModel().whatsMyOutScreenView = true
                                    //                                    GameModel().hitOutScreenView = false
                                }
                            }.buttonStyle(.borderedProminent)
                                .font(.title)
                                .cornerRadius(20).font(.title3).tint(.black).frame(width: 200, height: 60, alignment: .center)
                        }
                    }
                }
            }.alert(noOutTitle, isPresented: $noOutFailureAlert) {
                Button("Continue"){
                    //                    GameModel().hitOutScreenView = true
                }
            }
        }
        
    }
}

struct HitOutScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HitOutScreenView()
    }
}
