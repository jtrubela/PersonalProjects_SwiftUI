    //
    //  LoginView.swift
    //  MScoots
    //
    //  Created by Justin Trubela and James Olatunji on 4/23/23.
    //

import SwiftUI
import FirebaseAuth

struct RegistrationView: View {
    @ObservedObject private var model = Firebase_Authorization()
    @ObservedObject private var Firestore = Firebase_Firestore()
    
    let db = FirebaseManager.shared.auth
    @Environment(\.scenePhase) private var scenePhase
    

    @State var first_name = Firebase_Authorization().first_name
    @State var last_name = Firebase_Authorization().last_name
    @State var CWID = Firebase_Authorization().CWID

    @State var email = Firebase_Authorization().email

    @State var password = Firebase_Authorization().password
    @State var password2 = Firebase_Authorization().password2

    @State var statusAlertMessage = Firebase_Authorization().statusAlertMessage

    @State var passwordLength = Firebase_Authorization().passwordLength
    
    @State var passwordContainsUCLet = Firebase_Authorization().passwordContainsUCLet
    
    @State var passwordContainsLCLet = Firebase_Authorization().passwordContainsUCLet
    
    @State var passwordContainsDigit = Firebase_Authorization().passwordContainsDigit
    
    @State var passwordContainsSC = Firebase_Authorization().passwordContainsSC
    
    @State var passwordsMatch = Firebase_Authorization().passwordsMatch
    
    
    @State var isRegisterd = Firebase_Authorization().isRegisterd
    
    
    @State var isShowingErrorAlert = Firebase_Authorization().isShowingAlert
    
    @State var isShowingAlert = Firebase_Authorization().isShowingAlert
    
    
    
    @Environment(\.dismiss) var dismiss
    
    
    func checkFields(){
        if (
            CWID.isEmpty ||
            email.isEmpty ||
            password.isEmpty ||
            password2.isEmpty ||
            password2 != password
        )
        {
            isShowingErrorAlert.toggle()
        }
        
        else{
            isRegisterd.toggle()
            Firestore.addData(CWID: CWID, email: email, first_name: first_name, last_name: last_name)
            isShowingAlert = model.registerAccount(email: email, password: password)
            isShowingAlert.toggle()
        }
    }
    
    var checkPasswordLength: Bool {
        if password.count >= 8{
            passwordLength.toggle()
            return true
        }
        else{
            return false
        }
        
    }
    
    var containsUpperCase: Bool {
        if model.containsUppercaseLetter(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    var containsLowerCase: Bool {
        if model.containsLowercaseLetter(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    var containsDigit: Bool {
        if model.containsDigit(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    var containsSC: Bool {
        if model.containsSC (input: password) {
            return true
        }else{
            return false
        }
    }
    
    
    var getRegistrationStatus: Bool {
        if model.isRegistered {
            model.isShowingAlert.toggle()
            model.isRegisterd = true
            return true
        }
        else {
            return false
        }
    }
    var isNotRegistered: Bool {
        if model.unsuccessfulRegistration{
            model.unsuccessfulRegistration = !model.unsuccessfulRegistration
            model.isShowingAlert.toggle()
            return true
        }
        else {
            model.isRegisterd.toggle()
            return false
        }
    }
    

    
    var body: some View {
//        NavigationStack(){
            ZStack {
                LandingPageBackground()

                VStack{
                    Text("Registration").foregroundColor(.white).font(.title).bold()
                    VStack{
                        Spacer()
                        Spacer()
                        //Name
                        Section{
                            VStack{
                                VStack{
                                    TextField("First Name", text: $first_name)
                                        .AddTextboxFieldEntry()
                                }
                                .padding(.leading, 45)
                                VStack{
                                    TextField("Last Name", text: $last_name)
                                        .AddTextboxFieldEntry()
                                }
                                .padding(.leading, 45)
                            }
                            .padding(.bottom, 20)
                        }
                        //CWID
                        Section{
                            VStack {
                                //CWID entry field
                                HStack{
                                    model.circleCheckmarkColor(bool_: model.isCWIDValid(cwid: CWID))                    .font(.system(size: 30))
                                    
                                    TextField("CWID", text: $CWID)
                                        .AddTextboxFieldEntry()
                                }
                            }
                            .padding(.bottom, 20)
                        }
                        //EMAIL
                        Section{
                            VStack{
                                // contains email images
                                HStack{
                                    
                                    model.circleCheckmarkColor(bool_: model.isValidEmail(email: email))                    .font(.system(size: 30))
                                    
                                    
                                    TextField("Email", text: $email)
                                        .AddTextboxFieldEntry()
                                        .disableAutocorrection(true)
                                }
                            }
                            .padding(.bottom, 20)
                        }
                        //PASSWORD
                        Section{
                            VStack{
                                //Password side images
                                HStack{
                                    model.shieldColor(bool_: model.isValidPassword(password: password))
                                    
                                    //Password Box
                                    Section{
                                        // Disable strong password suggestion
                                        // Disable autocorrection
                                        // Disable autocapitalization
                                        SecureField("Password", text: $password)
                                            .textContentType(.none)
                                        
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                            .AddTextboxFieldEntry()
                                    }
                                }
                                VStack{
                                    //Passwords Match DONE
                                    HStack{
                                        model.shieldColor(bool_: password2==password && password2.count>7)
                                        
                                        //Password Box 2 match
                                        Section{
                                            SecureField("Re-enter Password", text: $password2)
                                                .AddTextboxFieldEntry()
                                        }
                                    }
                                    VStack{
                                        //Length characters > 8 DONE
                                        HStack{
                                            model.squareColor(bool_: password.count>=8, text: "password is 8 characters or more" )
                                            
                                            
                                            Spacer()
                                        }
                                        //Complexity - UC/LC/Digit DONE
                                        HStack{
                                            VStack{
                                                HStack{
                                                    model.squareColor(bool_: containsUpperCase && containsLowerCase && containsDigit && containsSC, text: "password must contain at least:")
                                                    
                                                    
                                                    Spacer()
                                                }
                                                //Password Security Text
                                                VStack{
                                                    //Contains UpperCase
                                                    HStack{
                                                        model.circleCheckmarkColor(bool_: containsUpperCase)
                                                        
                                                        
                                                        Text("One uppercase letter")
                                                        Spacer()
                                                    }
                                                    
                                                    //contains LowerCase
                                                    HStack{
                                                        model.circleCheckmarkColor(bool_: containsLowerCase)
                                                        
                                                        
                                                        Text("One lowercase letter")
                                                        Spacer()
                                                    }
                                                    
                                                    //Contains Digit
                                                    HStack{
                                                        model.circleCheckmarkColor(bool_: containsDigit)
                                                        
                                                        
                                                        Text("One digit")
                                                        Spacer()
                                                    }
                                                    
                                                    //Contains containSC
                                                    HStack{
                                                        model.circleCheckmarkColor(bool_: containsSC)
                                                        
                                                        Text("Special Character")
                                                        Spacer()
                                                    }
                                                }
                                                .padding(.leading, 20)
                                            }
                                        }                                          .padding(.leading, 20)
                                        //Match - DONE
                                        HStack{
                                            if password2 == password{
                                                model.squareColor(bool_: (password2 == password) && !password2.isEmpty, text: "password matches")
                                            }
                                            else{
                                                Image(systemName: "checkmark.square.fill").foregroundColor(.red)
                                                Text("password matches")
                                                
                                            }
                                            Spacer()
                                            
                                        }
                                    }
                                    .frame(width: 300).border(.black)
                                }
                            }
                            .padding(.bottom, 20)
                        }
                        //Register Button
                        Section{
                            Button{
                               
                                checkFields()


                                
                            } label: {
                                Text("Register")
                            }
                            .alert(isPresented: $isShowingAlert, content: {
                                Alert(
                                    title: Text("Registration Status"),
                                    message: Text("Successfully Registered")
                                )
                            })
                            .alert(isPresented: $isShowingErrorAlert) {
                                Alert(
                                    title: Text("Registration Status"),
                                    message: Text("Unsucessful Registeration\n Check entry fields")
                                )
                            }
                        }
                        .frame(width: 180, height: 50, alignment: .center)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .buttonStyle(.borderedProminent)
                        .padding(.leading,10)
                        .font(.system(size: 25)).bold()
                        .padding(.bottom, 10)
                        Spacer()
                }
                .foregroundColor(.white)
                .padding()
            }
        }
    }
    
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


