//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

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
    @State private var showLoadingPageView = true
    // LoadingScreen Sheet View
    @State private var showLoadingView = false
    // LandingPage View
    @State private var showLandingPageView = true

    
    
    //Animation variables for scooter & rocky
    @State var animate: Bool = false
    let animation: Animation = Animation.linear(duration: 10.0).repeatForever(autoreverses: false)
    @State private var animationAmount = 0.0

    @Environment(\.dismiss) var dismiss
    

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
    @State private var buttonsDisabled = true
    
    /*---------------------------------------------------------------------------------------------------------*/
    //
    //  View Modifier Variables
    //
    //      checks if user is an admin or regular user
    //          checks if email address is contains montclair.edu
    //      checks if the user is loggedIn or not
    //
    /*---------------------------------------------------------------------------------------------------------*/

    /*---------------------------------------------------------------------------------------------------------*/
    //
    // Database view variables
    //
    //
    //
    /*---------------------------------------------------------------------------------------------------------*/
    
    /*--------------------------------------------------------------------------------------*/
    //
    //
    //              NAVIGATION TO LANDING AND LOADING PAGE
    //
    //
    //
    /*--------------------------------------------------------------------------------------*/
    var body: some View {
        if showLoadingPageView{
            ZStack {
                MyLinearGradientView()
                Section{
                    LoadingPage()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showLoadingView.toggle()
                        }
                    }
                    .padding(.bottom, 60)
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .foregroundColor(.white)
                }
            }.navigationBarBackButtonHidden(true)
            .sheet(isPresented: $showLoadingView) {
                
                ZStack {
                    if showLoadingView {
                        LoadingView()
                    }
                }
                .animation(.default, value: showLoadingView)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        showLoadingView.toggle()
                        showLoadingPageView.toggle()
                    }
                }
            }
        }
  
        else if !showLoadingPageView && !showLoadingView && showLandingPageView {
            
            NavigationView{
                ZStack{
                    Color.black.ignoresSafeArea()
                    Rectangle()
                        .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 1000, height: 350)
                        .rotationEffect(.degrees(135))
                        .offset(y: -440)
                    
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
                                    .frame(width: geo.size.width, height: geo.size.height,
                                           alignment: animate ? .trailing : .leading)
                                }
                                .onAppear {
                                    withAnimation(animation) {
                                        animate.toggle()
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
                                            model.shouldShowRegistrationSheet.toggle()
                                        } label: {
                                            Text("Create an Account")
                                                .fontWeight(.bold)
                                                .underline()
                                        }
                                    }
                                    Spacer()
                                    
                                    Spacer()
                                        //Show registration on change
                                        .sheet(isPresented: $model.shouldShowRegistrationSheet, content: {
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
}



struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}


struct LoadingPage: View {
    var Title: String = "WELCOME TO MScoots"
    var BodyText: String = "MSU Logo"
    var ImageItem: String = "MSU Logo"
    
    var body: some View {
        VStack{
            Text(Title)
                .padding(.bottom, 50)
            
            Image(BodyText)
        }.navigationBarBackButtonHidden(true)
    }
}

struct LoadingView: View {
    @State private var showLoading = true
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.75)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ProgressView()
                Text("Loading...")
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: 200, height: 200)
            }
            .offset(y: -70)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showLoading.toggle()
            }
            
        }
    }
}

