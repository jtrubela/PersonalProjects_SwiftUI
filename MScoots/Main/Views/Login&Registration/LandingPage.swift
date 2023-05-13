//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI
//import Firebase
//import FirebaseAuth
//import FirebaseFirestore

struct LandingPageView: View {
    let db = FirebaseManager.shared.auth
    
    //: @ObservedObject: This property wrapper is used to observe changes to an external object, typically a model object. When the observed object changes, the view is automatically re-rendered.
    @ObservedObject private var model = Firebase_Authorization()
    //Database variables
    //allows the login function for firebase to be used
    
    /*---------------------------------------------------------------------------------------------------------*/
    //
    // View Modifying variables
    //      Allows system to know when events happen to trigger page updates/view switches
    //      Alerts/Status messages shown back to the user
    //          DB requests
    //          Email/Password related
    //      Status error message shows back to the user if login Error
    //
    /*---------------------------------------------------------------------------------------------------------*/
    //View Variables
    // Loading Page View
    @State private var LoadingPageIsShowing = Firebase_Authorization().showLoadingPageView
    // LoadingScreen Sheet View
    @State private var LoadingIsShowing = Firebase_Authorization().showLoadingView
    // LandingPage View
    @State private var LandingPageIsShowing = Firebase_Authorization().showLandingPageView
    
    
    
    //Animation variables for scooter & rocky
    @State private var animate: Bool = Firebase_Authorization().animate
    let animation = Firebase_Authorization().animation
    @State private var animationAmount = Firebase_Authorization().animationAmount
    
    @Environment(\.dismiss) var dismiss
    
    
    @State var shouldShowRegistrationSheet = Firebase_Authorization().shouldShowRegistrationSheet
    
    /*---------------------------------------------------------------------------------------------------------*/
    //
    //  User Input/Keyboard variables
    //
    //      input for Email and Password
    //          checks if keyboard on focusmode
    //      checks if the user has valid email
    //
    /*---------------------------------------------------------------------------------------------------------*/
    //User Variables
    //User input fields to verify against the db
    
    //keyboard variables for changing focus on fields
    @State var buttonsDisabled = true


    var body: some View {
        if LoadingPageIsShowing{
            ZStack {
                    LoadingPage()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            LoadingIsShowing.toggle()
                        }
                    }
            }
            .navigationBarBackButtonHidden(true)
                .sheet(isPresented: $LoadingIsShowing) {
                
                ZStack {
                        LoadingView()
                }
                .animation(.default, value: LoadingIsShowing)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        LoadingIsShowing.toggle()
                        LoadingPageIsShowing.toggle()
                        LandingPageIsShowing.toggle()
                    }
                }
            }
        }
  
        else if LandingPageIsShowing {
            LandingPage()
        }
    }
}




struct LandingPage: View {
    @ObservedObject private var model = Firebase_Authorization()
    @State private var buttonsDisabled = LandingPageView().buttonsDisabled
    @State var shouldShowRegistrationSheet = Firebase_Authorization().shouldShowRegistrationSheet

    var body: some View{
        NavigationView{
            ZStack{
                LandingPageBackground()
                
                //Stack for Title and Image
                VStack{
                    //Title & Animation of Rocky and Scooter & Divider
                    VStack{
                        //Title
                        Section{
                            Text("MS Scoots")
                                .foregroundColor(.white)
                                .font(.system(size: 65, weight: .bold, design: .rounded))
                        }
                        //Animation
                        ZStack{
                            //Animation of scooter and rocky
                            GeometryReader {
                                geo in
                                HStack(spacing: -5) {
                                    RockyOnScooter()
                                }
                                .frame(width: geo.size.width, height: geo.size.height,
                                       alignment: model.animate ? .trailing : .leading)
                            }
                            .onAppear {
                                withAnimation(model.animation) {
                                    model.animate.toggle()
                                }
                            }
                        }
                        //Divider separating animation and login fields
                        Section{
                            Rectangle()
                                .AddMyDivider()
                                .foregroundColor(.white)
                            
                        }
                        Spacer()
                    }
                    
                    //Login and Registration
                    VStack{
                        //Email and Password Fields
                        VStack{
                            //Have an account text
                            Section{
                                Text("Have an account?")
                                    .AddLandingFieldText()
                            }
                            //Email TextField
                            Section{
                                TextField("Email Address", text: $model.email)
                                    .AddTextboxFieldEntry()
                                
                                    .onChange(of: model.email) { _ in
                                        //Enable buttons?
                                        buttonsDisabled.toggle()
                                        
                                    }
                            }
                            //Password
                            Section{
                                SecureField("Password", text: $model.password)
                                    .AddMyPasswordBoxFieldEntry()
                                
                            }
                        }
                    }
                    //Status Error Message
                    Section{
                        VStack{
                            Text(model.statusErrorMessage)
                                .foregroundColor(
                                    model.showingAlert || model.showingPWAlert ? .red : .blue )
                                .frame(width: 320, height: 60, alignment: .center)
                            
                        }
                    }
                    //Login Button
                    Section{
                        Button{
                            model.signIn()
                            
                        } label: {
                            Text("Login")
                                .Add_ButtonSytle()
                            
                            
                        }
                        if model.isAdmin{
                            NavigationLink(destination: AdminUserHomeView()) {
                                if model.isLoggedIn{
                                    Text("AdminHome").foregroundColor(.white)
                                        .AddMyButtonStyle()
                                }
                            }
                        }
                        else {
                            NavigationLink(destination: UserHomeView()) {
                                if model.isLoggedIn{
                                    Text("UserHome")
                                        .foregroundColor(.white).AddMyButtonStyle()
                                }
                            }
                        }
                        
                        
                        //Reset PW Button / Create an Account Button - DONE
                        Section{
                            //Reset Password - Done
                            Section{
                                Rectangle()
                                    .AddMyDivider()
                                //Forgot Password
                                Text("Forgot your password?")
                                    .AddLandingFieldText()
                                //Reset Password Button
                                Section{
                                    Button{
                                        model.checkResetPassword()
                                    } label: {
                                        Text("Reset Password")
                                            .underline()
                                            .fontWeight(.bold)
                                    }
                                    .alert(isPresented: $model.showingPWAlert) {
                                        Alert(title: Text("Reset Password"), message: Text(model.statusErrorMessage), dismissButton: .default(Text("OK")))
                                    }
                                }
                            }
                            Spacer()
                            //Create and account - Register
                            Section{
                                Text("Don't have an account?")
                                    .AddLandingFieldText()
                                //Registration - Done
                                Section{
                                    //show registration sheet
                                    Button{
                                        shouldShowRegistrationSheet.toggle()
                                    } label: {
                                        Text("Create an Account")
                                            .fontWeight(.bold)
                                            .underline()
                                    }
                                }
                                Spacer()
                                
                                Spacer()
                                //Show registration on change
                                    .sheet(isPresented: $shouldShowRegistrationSheet, content: {
                                        RegistrationView()
                                    })
                                    .navigationViewStyle(StackNavigationViewStyle())
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
}


struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}




struct LandingFieldText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundColor(.white)
    }
}
extension View {
    func AddLandingFieldText() -> some View {
        modifier(LandingFieldText())
    }
}


struct TextboxEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 10)
            .padding(10)
            .frame(width: 320, height: 40, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(.title2)
            .textFieldStyle(.plain)
            .foregroundColor(.black)
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
}
extension View {
    func AddTextboxFieldEntry() -> some View {
        modifier(TextboxEntryField())
    }
}

struct MyEmailEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .keyboardType(.emailAddress)
            .autocorrectionDisabled().padding(5)
            .textInputAutocapitalization(.never)
            .submitLabel(.next)
    }
}
extension View {
    func AddMyEmailFieldEntry() -> some View {
        modifier(MyEmailEntryField())
    }
}

struct PasswordBoxEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .submitLabel(.done)
            .padding(10)
            .frame(width: 320, height: 40, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(.title2)
            .textFieldStyle(.plain)
    }
}
extension View {
    func AddMyPasswordBoxFieldEntry() -> some View {
        modifier(PasswordBoxEntryField())
    }
}



struct TextEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(width: 350, height: 50, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.title2)
            .textFieldStyle(.plain)
            .padding(10)
    }
}
extension View {
    func MakeTextFieldEntry() -> some View {
        modifier(TextEntryField())
    }
}


struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .frame(width: 150, height: 50)
            .background(Color.white)
            .background(RoundedRectangle(cornerRadius: 10,style:.continuous))
            .clipShape(Capsule())
        
            .font(.title2).fontWeight(.bold)
            .foregroundColor(.red)
            .padding(20)
    }
}
extension View {
    func Add_ButtonSytle() -> some View {
        modifier(ButtonStyle())
    }
}


struct MyButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 180, height: 50, alignment: .center)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .buttonStyle(.borderedProminent)
            .padding(.leading,10)
            .font(.system(size: 25)).bold()
    }
}
extension View {
    func AddMyButtonStyle() -> some View {
        modifier(MyButtonStyle())
    }
}


struct myDivider: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 380, height: 5)
            .clipShape(Capsule())
        //            .foregroundColor(.white)
            .padding(15)


    }
}
extension View {
    func AddMyDivider() -> some View {
        modifier(myDivider())
    }
}

struct RockyOnScooter: View {
    
    var body: some View {
        ZStack{
            Image("scooter")
                .scaleEffect(x: 1.4, y: 1.3, anchor: .center)
            Image("rocky")
                .position(x:155,y:110)
                .scaleEffect(x:2.6,y:1.6)
            Image("smoke-effect")
                .position(x: -100,y:205)
                .scaleEffect(x:0.8)
        }
        .aspectRatio(contentMode: .fit)
    }
    
}
struct LandingPageBackground: View {
    var body: some View {
            Color.black.ignoresSafeArea()
            Rectangle()
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 350)
                .rotationEffect(.degrees(135))
                .offset(y: -440)
    }
}
