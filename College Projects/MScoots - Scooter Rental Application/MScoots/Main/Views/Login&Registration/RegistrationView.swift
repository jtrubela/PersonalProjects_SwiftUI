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
    

    @State var first_name = ""
    @State var last_name = ""
    @State var CWID = ""
    
    @State var email = ""
    
    @State var password = ""
    @State var password2 = ""
    
    @State var statusAlertMessage = ""
    
    @State var passwordLength = false
    var checkPasswordLength: Bool {
        if password.count >= 8{
            passwordLength.toggle()
            return true
        }
        else{
            return false
        }
        
    }
    
    @State var passwordContainsUCLet = false
    var containsUpperCase: Bool {
        if model.containsUppercaseLetter(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    @State var passwordContainsLCLet = false
    var containsLowerCase: Bool {
        if model.containsLowercaseLetter(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    @State var passwordContainsDigit = false
    var containsDigit: Bool {
        if model.containsDigit(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    @State var passwordContainsSC = false
    var containsSC: Bool {
        if model.containsSC (input: password) {
            return true
        }else{
            return false
        }
    }
    
    @State var passwordsMatch = false
    
    
    @State var isRegisterd = false
    var getRegistrationStatus: Bool {
        if model.isRegistered {
            isShowingAlert.toggle()
            isRegisterd = true
            return true
        }
        else {
            return false
        }
    }
    @State var isShowingErrorAlert = false
    
    @State var isShowingAlert = false
    var isNotRegistered: Bool {
        if model.unsuccessfulRegistration{
            model.unsuccessfulRegistration = !model.unsuccessfulRegistration
            isShowingAlert.toggle()
            return true
        }
        else {
            isRegisterd.toggle()
            return false
        }
    }
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
//        NavigationStack(){
            ZStack {
                Color.black.ignoresSafeArea()
                Rectangle()
                    .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 350)
                    .rotationEffect(.degrees(135))
                    .offset(y: -440)
                
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
                                HStack{
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(model.isCWIDValid(cwid: CWID) ? .green : .gray)
                                    
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
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor((model.isValidEmail(email: email)) ? .green : (!model.isValidEmail(email: email) && email.count > 0) ? .red : .gray)
                                    
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
                                    Image(systemName: "checkmark.shield.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(model.isValidPassword(password: password) ? .green : (!model.isValidPassword(password: password) && password.count >= 7) ? .gray : .gray)
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
                                        Image(systemName: "checkmark.shield.fill")
                                            .font(.system(size: 30))
                                            .foregroundColor(password2==password && password2.count>7 ? .green : .gray)
                                        //Password Box 2 match
                                        Section{
                                            SecureField("Re-enter Password", text: $password2)
                                                .AddTextboxFieldEntry()
                                        }
                                    }
                                    VStack{
                                            //Length characters > 8 DONE
                                        HStack{
                                            
                                            Image(systemName: "checkmark.square.fill")
                                                .foregroundColor(password.count>=8 ? .green : (password.count<8 && password.count>0) ? .red : .gray)
                                            
                                            Text("password is 8 characters or more")
                                            Spacer()
                                        }
                                            //Complexity - UC/LC/Digit DONE
                                        HStack{
                                            VStack{
                                                HStack{
                                                    
                                                    Image(systemName: "checkmark.square.fill").foregroundColor(containsUpperCase && containsLowerCase && containsDigit && containsSC ? .green : .gray)
                                                    
                                                    Text("password must contain at least:")
                                                    Spacer()
                                                }
                                                //Password Security Text
                                                VStack{
                                                        //Contains UpperCase
                                                    HStack{
                                                        
                                                        Image(systemName: "checkmark.circle.fill")
                                                            .foregroundColor(containsUpperCase ? .green : .gray)
                                                        
                                                        Text("One uppercase letter")
                                                        Spacer()
                                                    }
                                                    
                                                        //contains LowerCase
                                                    HStack{
                                                        
                                                        Image(systemName: "checkmark.circle.fill")
                                                            .foregroundColor(containsLowerCase ? .green : .gray)
                                                        
                                                        Text("One lowercase letter")
                                                        Spacer()
                                                    }
                                                    
                                                        //Contains Digit
                                                    HStack{
                                                        
                                                        Image(systemName: "checkmark.circle.fill")
                                                            .foregroundColor(containsDigit ? .green : .gray)
                                                        
                                                        Text("One digit")
                                                        Spacer()
                                                    }
                                                    
                                                        //Contains containSC
                                                    HStack{
                                                        Image(systemName: "checkmark.circle.fill")
                                                            .foregroundColor(containsSC ? .green : .gray)
                                                        
                                                        Text("Special Character")
                                                        Spacer()
                                                    }
                                                }
                                                .padding(.leading, 20)
                                            }
                                        }                                          .padding(.leading, 20)
                                            //Match - DONE
                                        HStack{
                                            Image(systemName: "checkmark.square.fill").foregroundColor(((password2 == password) && !password2.isEmpty) ? .green : ((password2 != password) && !password2.isEmpty) ? .red : .gray)
                                            
                                            Text("password matches")
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
