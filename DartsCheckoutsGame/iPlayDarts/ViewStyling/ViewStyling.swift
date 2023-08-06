//
//  ViewStyling.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 5/14/23.
//
import SwiftUI

//struct ForgotPasswordButton: View {
//    @available(iOS 16.0, *)
//    var body: some View{
//        NavigationLink(destination: ForgotPassword()) {
//            Text("Forgot Password")
//        }.font(.title2)
//            .underline(true, pattern: .dot, color: .green)
//            .bold()
//    }
//    
//}


struct MainMenuButton: View {
    var body: some View{
        NavigationLink(destination: LandingPageView()) {
            VStack{
                Text("Main Menu")
            }.buttonStyle(.bordered)
        }
    }
}


struct RegistrationButton: View {
    var body: some View{
        NavigationLink(destination: RegistrationView()) {
            VStack{
                Text("Registration")
            }.buttonStyle(.bordered)
        }
    }
}

struct LoginButton: View {
    var body: some View{
        NavigationLink(destination: LoginMenuView()) {
            VStack{
                Text("Log In")
            }
        }
    }
}

struct WhatsMyOutButton: View {
    var body: some View{
        NavigationLink(destination:  WhatsMyOutScreenView()) {
            VStack{
                Text("What's My Out")
            }
        }
    }
}


struct TodaysStatsButton: View {
    var body: some View{
        NavigationLink(destination: StatsScreenView()) {
            VStack{
                Text("Today's Stats")
            }
        }
    }
}

struct Play501Button: View {
    var body: some View{
        NavigationLink(destination: Play501View()) {
            VStack{
                Text("501")
            }
        }
    }
}



struct PlayCricketButton: View {
    var body: some View{
        NavigationLink(destination: PlayCricketView()) {
            VStack{
                Text("Cricket")
            }
        }
    }
}


struct PracticeButton: View {
    var body: some View{
        NavigationLink(destination: PracticeView()) {
            VStack{
                Text("Practice Game")
            }
        }
    }
}




struct HomeScreenViewBackground: View {
    var body: some View{
        LinearGradient(
            gradient: Gradient(colors: [.black,.gray]),
            startPoint: .top, endPoint: .bottom).ignoresSafeArea()
    }
}

struct OptionText: View {
    var text: String        //takes in some text
    
    var body: some View {
        Text(text)          //uses that text in some Text and applies modifiers to it
            .font(.subheadline.bold())
            .italic()
            .frame(minWidth: 50, idealWidth: .infinity, maxWidth: .infinity, minHeight: 30, idealHeight: 30, maxHeight: 30, alignment: .leading)
    }
}

struct OutText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 250, height: 30, alignment: .center)
            .foregroundColor(.black)
            .font(.system(size: 40.0))
    }
}

struct SquareBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(5)
    }
}
extension View {
    func MakeRoundedSquareBackground() -> some View {
        modifier(SquareBackground())
    }
}

struct CapsuleBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(50)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 160))
    }
}
extension View {
    func MakeCapsuledBackground() -> some View {
        modifier(CapsuleBackground())
    }
}




struct TextEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(width: 325, height: 50, alignment: .center)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(.title2)
            .padding(5)
    }
}
extension View {
    func MakeTextFieldEntry() -> some View {
        modifier(TextEntryField())
    }
}



struct GreenButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .shadow(radius: 10)
            .padding(10)
            .foregroundColor(Color.white)
    }
}
extension View {
    func MakeGreenButton() -> some View {
        modifier(GreenButton())
    }
}


struct PlayerPointsBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 75, alignment: .center)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.largeTitle.bold())
    }
}
extension View {
    func MakePlayerPointsBox() -> some View {
        modifier(PlayerPointsBox())
    }
}



struct PracticeNumberWindow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 320, maxHeight: 75)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.largeTitle)
            .foregroundColor(.black)
            .shadow(radius: 10)
    }
}
extension View {
    func MakePracticeNumberWindow() -> some View {
        modifier(PracticeNumberWindow())
    }
}

struct CricketPointText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 75, alignment: .center)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.largeTitle.bold())
    }
}
extension View {
    func MakeCricketPointText() -> some View {
        modifier(CricketPointText())
    }
}

struct ButtonWhite: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .tint(.white)
            .foregroundColor(.black)
            .shadow(radius: 10)
    }
}
extension View {
    func MakeButtonWhite() -> some View {
        modifier(ButtonWhite())
    }
}


