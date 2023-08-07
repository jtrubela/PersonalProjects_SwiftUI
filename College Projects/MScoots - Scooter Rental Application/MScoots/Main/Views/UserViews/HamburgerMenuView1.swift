//
//  HamburgerMenuView.swift
//  MScoots
//
//  Created by Vincent Cavallaro on 4/24/23.
//


import SwiftUI
//Home


//Main View if open:false
//@Binding MenuIsShowing:Bool
struct HamburgerMenuView: View {
    @StateObject var model = Firebase_Authorization()
    
    var body: some View {
        ZStack{
            //Background
            Color.black.ignoresSafeArea()
            //Red Background items
            
            
            Section{
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
            
            VStack{
                //Home
                //TODO: ADD BBUTTONFUNCTIONALITY
                Section {
                    
                    
                    
                    NavigationLink(destination: UserHomeView()) {
                        HomeButton().underline()
                    }
                    
                    //Search for scooter
                    NavigationLink(destination: Scoot_MyScootsView()) {
                        ScooterButton()
                    }
                    
                    //Scooter List View
                    NavigationLink(destination: Scoot_ListView()) {
                        Image(systemName: "list.number")
                        Text("Find Scoots").underline()
                    }
                    
                    //Scooter Map View
                    NavigationLink(destination: Scoot_MapView()) {
                        Image(systemName: "map")
                        Text("Charger Map").underline()
                    }
                    
                    //Wallet
                    NavigationLink(destination: WalletView()) {
                        WalletButton()
                    }
                    
                    
                    //Account
                    NavigationLink(destination: UserProfile_SettingsView()) {
                        Image(systemName: "person.crop.circle.fill")
                        Text("My Account").underline()
                    }
                    
                    NavigationLink(destination: ContactUsView()) {
                        HStack{
                            Image(systemName: "ellipsis.message.fill")
                            Text("Contact Us").underline()
                        }
                    }
                    
                    //Logout
                    NavigationLink(destination: LandingPageView()) {
                        LogoutButton()
                    }
                }
                .padding(10)
            }.navigationBarBackButtonHidden()
                .shadow(color: .black, radius: 3, x: 9, y: 7)
                .foregroundColor(.white)
            
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}


struct HamburgerMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerMenuView()
    }
}
