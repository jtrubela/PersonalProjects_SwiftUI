//
//  UserHomeView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI

struct UserHomeView: View{
    @State private var model = Firebase_Authorization()
    @State private var isLoggedIn = true
    @State private var selection: String? = nil
    
    var body: some View {
        //Navigates to a buttons location
        NavigationView{
            ZStack{
                //Background
                Color.black.ignoresSafeArea()
                //Red Background items
                Section{
                    DoubleRedRectangleBG()
                }
                
                VStack{
                        //TopBar
                        Section{
                            HStack{
                                //Title
                                Section{
                                    Text("Home")
                                        .font(.system(size: 32))
                                        .fontWeight(.bold)
                                }.padding(.leading, 30)
                                
                                
                                //Profile
                                Section{
                                    NavigationLink(destination: UserProfile_SettingsView()) {
                                        VStack{
                                            ProfileButton2(ImageText: "person.fill")
                                            Text("Profile")
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .bold()
                                        }
                                    }.padding(.trailing,30)

                                }.padding(.horizontal,60)
                                
                                
                                //Hamburger Menu Button
                                Section{

                                        NavigationLink(destination: HamburgerMenuView()) {
                                            HamburgerMenu()
                                                .shadow(color: .white, radius: 3, x: 6, y: 6)
                                                .foregroundColor(.white)
                                        }
                                }.padding(.trailing,20)
                            }
                        }
                            
                    Rectangle().AddMyDivider().foregroundColor(.white)
                        Text("\(model.statusErrorMessage)")
                    
                    Spacer()

                    VStack{
                        HStack{

                            //Find a Scoot Button
                            Section{
                                NavigationLink(destination: Scoot_ListView()) {
                                    VStack {
                                        Image( "scooterr")
                                            .font(.system(size: 110))
                                        Text("Find a Scoot!")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                                .padding()
                            }
                        }
                        HStack{
                            //Map Button
                            Section{
                                NavigationLink(destination: Scoot_MapView()) {
                                    VStack {
                                        Image( "mapLogo")
                                        Text("Map")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                                .padding(.leading, 120)
                            }
                            
                            //Wallet Button
                            Section{
                                NavigationLink(destination: WalletView()) {
                                    VStack {
                                        Image( "wallet")
                                            .font(.system(size: 120))
                                        Text("Wallet")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                                .padding(.trailing,10)                            }
                        }.padding(.bottom, 140)
                    }
                    
//                    Spacer()
                    //STACK 1.3 -- Nav Bar Buttons
                    
                    HStack{
                        
                        //QR Code toolbar button
                        Section{
                            NavigationLink(destination: ScanQRView(),
                                           label: {
                                ZStack{
                                    Image(systemName: "qrcode")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: .center)
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                    Image(systemName: "circle")
                                        .font(.system(size: 70))
                                }.frame(width: 100, height: 100, alignment: .center)
                            }
                            )
                        }
                        //MyScootView toolbar button
                        Section{
                            
                            NavigationLink(destination: Scoot_MyScootsView(),
                                           label: {
                                ZStack{
                                    Image(systemName: "circle")
                                        .font(.system(size: 100))
                                        .foregroundColor(.blue)
                                    
                                    Image("scooter")
                                        .resizable()
                                        .frame(width: 60, height: 60, alignment: .center)
                                        .scaledToFit()
                                    //                                            .colorMultiply(.white)
                                    
                                    
                                }
                            }
                            )
                        }.frame(width: 100, height: 100, alignment: .center)
                        //ScooterList toolbar Button
                        Section{
                            NavigationLink(destination: Scoot_ListView(),
                                           label: {
                                ZStack {
                                    Image(systemName: "list.triangle")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: .center)
                                    
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                    Image(systemName: "circle")
                                        .font(.system(size: 70))
                                }
                            }
                            )
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width , height: 100, alignment: .center)
                    
                    .background(Color.secondary)
                    
                    
                }

            }
        }            .navigationBarBackButtonHidden(true)
    }
}



struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}


struct ProfileButton2: View {
    var ImageText: String

    var body: some View {

        Image(systemName: ImageText)
            .font(.system(size: 30))

            .font(.system(size: 34))
            .padding()
            .foregroundColor(Color(.label))
            .overlay(RoundedRectangle(cornerRadius: 64)
                .stroke(Color.black, lineWidth: 3)
            )
    }
}


struct DoubleRedRectangleBG: View {
    var body: some View{
        Rectangle()
            .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 1000, height: 350)
            .rotationEffect(.degrees(135))
            .offset(y: -540)
        
        Rectangle()
            .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 1000, height: 250)
            .rotationEffect(.degrees(135))
            .offset(y: 540)
    }
    }
