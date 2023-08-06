//
//  LoginMenuView.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//

import SwiftUI

struct LoginMenuView: View {
    @State private var password: String = GameModel().password
    @State private var username: String = GameModel().username
    
    var body: some View {
        NavigationView{
            ZStack{
                HomeScreenViewBackground()
                VStack{
                    HStack{
                        //Menu and Register button
                        Section{
                            MainMenuButton().buttonStyle(.bordered)
                                .padding(30)
                            
                            Spacer()
                            
                            RegistrationButton().buttonStyle(.borderedProminent)
                                .padding(30)
                        }
                    }
                    //Title
                    Section{
                        Text("Welcome Back!")
                            .font(.largeTitle.bold()).foregroundColor(Color.white)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    //Email & Password
                    Section{
                        TextField("Enter Email Address", text: $username)
                            .MakeTextFieldEntry()
                            .shadow(color: .white, radius: 10, x: 8, y: 2)
                        TextField("Enter Password", text: $password)
                            .MakeTextFieldEntry()
                            .shadow(color: .white, radius: 10, x: 8, y: 2)
                    }
                    .padding(.bottom, 10)
                    
                    Spacer()
                    
                    //Forgot Password & Login Button
                    Section{
                        VStack{
//                            ForgotPasswordButton()
                            
                            LoginButton()
                                .buttonStyle(.borderedProminent)
                            
                        }
                    }
                    Spacer()
                }
            }
        }.navigationTitle("Welcome Back!")
    }
}
struct LoginMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LoginMenuView()
    }
}
