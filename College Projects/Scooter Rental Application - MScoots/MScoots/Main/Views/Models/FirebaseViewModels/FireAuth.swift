//
//  Firebase_Auth.swift
//  MScoots
//
//
//  Created by Justin Trubela on 2/27/23.
//
import FirebaseAuth
import SwiftUI
import Foundation


final class Firebase_Authorization: ObservableObject {
    //allows this class to used the shared authorization code used in the firebase manager
    @State private var db = FirebaseManager.shared.auth

    /*---------------------------------------------------------------------------------------------------------*/
    //
    // View Modifying variables - Loading / LoadingPage / LandingPage
    //      Allows system to know when events happen to trigger page updates/view switches
    //
    /*---------------------------------------------------------------------------------------------------------*/
    //
    // Loading Page View
    @Published var showLoadingPageView = true
    // LoadingScreen Sheet View
    @Published var showLoadingView = false
    @Published var showLoading = false

    // LandingPage View
    @Published var showLandingPageView = false

    
    
    
    //MARK: Login
    /*---------------------------------------------------------------------------------------------------------*/
    //
    // View Modifying variables - LandingPage - Login
    //      Allows system to know when events happen to trigger page updates/view switches
    //
    /*---------------------------------------------------------------------------------------------------------*/
    //LandingPageView / Login Variables
    enum Field {
        case email, password
    }
    @Published var email = ""
    @Published var password = ""
    
    @Published var isAdmin = false
    
    @Published var isLoggedIn = false
    @Published var isRegistered = false
    @Published var unsuccessfulRegistration = false
    
    @Published var showingAlert = false
    @Published var statusErrorMessage = ""
    
    
    // Password Reset View
    @Published var showingPWAlert = false
    
    // Registration Sheet View
    @Published var showRegistrationSheet = false
    @Published var shouldShowRegistrationSheet = false
    
    
    
    @Published var signInError: String?
    
    //    @Published var adminView = AdminUserHomeView()
    //    @Published var userView = UserHomeView()
    
    
    
    func checkUser(){
        
        let allowedEmails = [
            "trubelaj1@montclair.edu",
            "olatunji1@montclair.edu",
            "dorchs1@montclair.edu",
            "prados1@montclair.edu",
            "cavallarov1@montclair.edu"
        ]
        
        for allowedEmail in allowedEmails {
            if self.email == allowedEmail {
                isAdmin = true
            }
        }
    }
    
    
    
    
    
    //Animation variables for scooter & rocky
    @Published var animate: Bool = false
    @Published var animation: Animation = Animation.linear(duration: 10.0).repeatForever(autoreverses: false)
    @Published var animationAmount = 0.0
    

    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //  AUTH - SIGN IN - LOGIN
    //      Log the user into the DB
    //
    //      accesses the DB with email and passowrd input
    //          if theres an error make the user trying to login have an error appear
    //          otherwise continue
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    func signIn() {
        if password.isEmpty || email.isEmpty{
            statusErrorMessage = "No email and/or password was not entered."
            func isValidEmail(email: String) -> Bool {
                // Regular expression pattern for email validation
                let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
                
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
                return emailPredicate.evaluate(with: email)
            }
            
            if !isValidEmail(email: email) {
                showingAlert.toggle()
                statusErrorMessage = "Invalid Email: Check and try again"
            }
            
        } else {
            checkUser()
            
            FirebaseManager.shared.auth.signIn(withEmail: self.email, password: self.password) { (result, error) in
                self.showingAlert = true
                if let error = error {
                    // Handle sign-in error
                    self.statusErrorMessage = self.checkError(err: error as NSError)
                    // Handle sign-in error
                    self.signInError = error.localizedDescription
                    //                 print("handling signInErr: \(String(describing: signInError))")
                    self.statusErrorMessage = self.checkError(err: error as NSError)
                    //                 print("handling stErrMess Error: \(String(describing: signInError))")
                } else {
                    if (self.db.currentUser != nil) {
                        self.signInError = nil
                        // Sign-in successful
                        let user = self.db.currentUser
                        let userEmail = user!.email
                        let userUID = user!.uid
                        
                        self.statusErrorMessage = "Welcome back \( userEmail!)"
                        print("currentUser UID:\(userUID),\nemail:\(userEmail!) has been successfully Logged In")
                        
                        //set isLoggedIn to true
                        self.isLoggedIn.toggle()
                        print("isLoggedIn:\(String(self.isLoggedIn)) and isAdmin: \(String(self.isAdmin))")

                        
                    }
                }
            }
        }
    }

//    func checkSignIn(){
//        checkUser()
////        if isAdmin{
////            print("is Admin")
//            signIn(email: email, password: password) { (error) in
//                if let error = error {
////                    self.showingAlert = true
//                    
//
//                }
//                // Sign-in successful
//                else {
//                    // Perform additional actions after successful sign-in
//                    print("isLoggedIn:\(String(self.isLoggedIn)) and isAdmin: \(String(self.isAdmin))")
//
//                    
//                    
//                }
//            }
//    }
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    // AUTH - ISVALID EMAIL
    //
    //      checks the email provided for a valid format
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    func isValidEmail(email: String) -> Bool {
        // Regular expression pattern for email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    

    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    // AUTH - RESET PASSWORD
    //
    //      Checks the valid email on the db entered for a resettable password
    //
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    func checkResetPassword(){
        self.showingAlert = false
        //If the email is not empty
        if !email.isEmpty {
            //check if the email is valid
            if isValidEmail(email: email){
                //if it is valid try a PW reset request
                resetPWrequest(for: email) { (error) in
                    //if pw request error
                    if let error = error {
                        self.showingAlert = true
                        self.statusErrorMessage = self.checkError(err: error as NSError)
                    }
                    //show request sent to user
                    else {
                        self.showingPWAlert = true
                        self.statusErrorMessage = "A request to change your password has been successfully sent to your email"
                    }
                }
            }
            else{
                self.showingAlert = true
                self.statusErrorMessage = "Email entered is invalid. Try again"
            }
        }
        else{
            self.showingAlert = true
            self.statusErrorMessage = "Email field was empty. Please enter an email"
        }
    }
    func resetPWrequest(for email: String, completion: @escaping (Error?) -> Void){
        db.sendPasswordReset(withEmail: email) { error in
            if let error = error {
                    //Handle error
                print("Error resetting password: \(error.localizedDescription)")
                completion(error)
            }else{
                    //Password reset email sent successfully
                print("Password reset email sent successfully")
                completion(nil)
            }
        }
    }
    

    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //  AUTH - CREATE ACCOUNT - REGISTER
    //
    //      accesses the DB with email and passowrd input
    //          if theres an error make the newUser error appear
    //
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    
    
//    struct getShieldColor: View {
//
//        
//        @ObservedObject var model = Firebase_Authorization()
//        
//        var body: some View {
//            
//            
//        }
//    }
//    
    //    Image(systemName: "checkmark.circle.fill")
    //        .font(.system(size: 30))
    //        .foregroundColor(model.isCWIDValid(cwid: CWID) ? .green : .gray)
    //
    
    
    
    
    @Published var password2 = ""
    
    @Published var statusAlertMessage = ""
    @Published var isShowingAlert = false
    
    @Published var passwordLength = false
    @Published var passwordContainsUCLet = false
    @Published var passwordContainsLCLet = false
    @Published var passwordContainsDigit = false
    @Published var passwordContainsSC = false
    @Published var passwordsMatch = false
    
    @Published var isRegisterd = false

    @Published var first_name = ""
    @Published var last_name = ""
    @Published var CWID = ""
    
    
    
    
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
        if containsUppercaseLetter(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    var containsLowerCase: Bool {
        if containsLowercaseLetter(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    var containsDigit: Bool {
        if containsDigit(input: password) {
            return true
            
        }else{
            return false
        }
    }
    
    var containsSC: Bool {
        if containsSC (input: password) {
            return true
        }else{
            return false
        }
    }
    
    
    
    var getRegistrationStatus: Bool {
        if isRegistered {
            isShowingAlert.toggle()
            isRegisterd = true
            return true
        }
        else {
            return false
        }
    }
    @State var isShowingErrorAlert = false
    
    var isNotRegistered: Bool {
        if unsuccessfulRegistration{
            unsuccessfulRegistration = !unsuccessfulRegistration
            isShowingAlert.toggle()
            return true
        }
        else {
            isRegisterd.toggle()
            return false
        }
    }

    
    func circleCheckmarkColor(bool_: Bool) -> some View{
        VStack{
            if bool_ {
                
                return Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                
            } else {
                
                return Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.gray)
            }
        }
    }
    func shieldColor(bool_: Bool) -> some View{
        VStack{
            if bool_ {
                
                return Image(systemName: "checkmark.shield.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.green)
                
            } else {
                
                return Image(systemName: "checkmark.shield.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
            }
        }
    }
    
    func squareColor(bool_: Bool, text: String?) -> some View{
        VStack{
            if bool_ {
                
                
                HStack {
                    Image(systemName: "checkmark.square.fill")
                        .foregroundColor(.green)
                    Text(text ?? "")
                }
                
            } else {
                
                HStack {
                    Image(systemName: "checkmark.square.fill")
                        .foregroundColor(.gray)
                    Text(text ?? "")
                    
                }
            }
        }
    }

    
    func registerAccount(email: String, password: String) -> Bool {
        var isSuccessful = false
        //if previous error...set error message back to false
        db.createUser(withEmail: email, password: password) { (auth, error) in
            
            if let maybeError = error { //if there was an error, handle it
                isSuccessful = false
                self.showingAlert.toggle()
                self.statusErrorMessage = self.checkError(err: maybeError as NSError)
                print(self.checkError(err: maybeError as NSError))
                
            } else {
                if (self.db.currentUser != nil) {
                    isSuccessful = true
                    let newUserInfo = self.db.currentUser
                    let u_uid = newUserInfo?.uid
                    let u_email = newUserInfo?.email

                    self.showingAlert = true
                    self.statusErrorMessage = "User has been successfully created!\nUID:\(u_uid!)),\(u_email!)"
                    print("User has been successfully created!\nUID:\(u_uid!)),\(u_email!)")
                }
            }
        }
        return isSuccessful
        
    }
    
    
    
    
    
    
    /*--------------------------------------------------------------------------------------*/
    //
    //
    //  REGISTRATION - CHECK PW SECURITY
    //      Checks the password for UC/LC/DIGIT/SPECIAL CHAR
    //
    //
    /*--------------------------------------------------------------------------------------*/
    func isValidPassword(password: String) -> Bool {
        let minLength = 8 // Minimum length requirement
        let maxLength = 16 // Maximum length requirement
        
        // Check if password length is within the allowed range
        if password.count < minLength || password.count > maxLength {
            return false
        }
        
        // Check if password contains at least one uppercase letter, one lowercase letter, and one digit
        let uppercaseRegex = ".*[A-Z]+.*"
        let lowercaseRegex = ".*[a-z]+.*"
        let digitRegex = ".*\\d+.*"
        let uppercasePredicate = NSPredicate(format:"SELF MATCHES %@", uppercaseRegex)
        let lowercasePredicate = NSPredicate(format:"SELF MATCHES %@", lowercaseRegex)
        let digitPredicate = NSPredicate(format:"SELF MATCHES %@", digitRegex)
        
        return uppercasePredicate.evaluate(with: password) &&
        lowercasePredicate.evaluate(with: password) &&
        digitPredicate.evaluate(with: password)
    }
    
    func containsUppercaseLetter(input: String) -> Bool {
        let pattern = ".*[A-Z].*"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: input.utf16.count)
        let match = regex?.firstMatch(in: input, options: [], range: range)
        return match != nil
    }
    
    func containsLowercaseLetter(input: String) -> Bool {
        let pattern = ".*[a-z].*"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: input.utf16.count)
        let match = regex?.firstMatch(in: input, options: [], range: range)
        return match != nil
    }
    
    func containsDigit(input: String) -> Bool {
        let pattern = ".*[0-9].*"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: input.utf16.count)
        let match = regex?.firstMatch(in: input, options: [], range: range)
        return match != nil
    }
    
    func containsSC (input: String) -> Bool {
        let pattern = ".*[^A-Za-z0-9].*"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: input.utf16.count)
        let match = regex?.firstMatch(in: input, options: [], range: range)
        return match != nil
    }
    
    /*--------------------------------------------------------------------------------------*/
    //
    //
    //  REGISTRATION - CHECK CWID LENGTH
    //      Checks the valid email on the db entered for a resettable password
    //
    //
    /*--------------------------------------------------------------------------------------*/
    func isCWIDValid(cwid: String) -> Bool {
        return cwid.count == 8
    }
    
    
    
//    db.createUser(withEmail: email, password: password) { (auth, error) in
//
//    if let maybeError = error { //if there was an error, handle it
//        let err = model.checkError(err: maybeError as NSError)
//        print(err)
//    } else {
//        if (db.currentUser != nil) {
//            print(db.currentUser ?? "! default user (2)")
//        }
//    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //  AUTH - DB ERROR HANDLING - LOGIN/REGISTER/RESET PW
    //      Check switch category for checking the status error messages in the database
    //
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    func checkError(err: NSError) -> String{
            //PASSWORD
        switch err.code {
                    //Password invalid
            case AuthErrorCode.wrongPassword.rawValue:
                return "Password entered is not correct"
                    //Email is invalid
            case AuthErrorCode.invalidEmail.rawValue:
                return "Email is invalid"
                    //Email is unverified
            case AuthErrorCode.unverifiedEmail.rawValue:
                return "An email link was sent to your account, please verify it before loggin in"
                    //Network error
            case AuthErrorCode.networkError.rawValue:
                return "Error in network connection"
                    //User disabled
            case AuthErrorCode.userDisabled.rawValue:
                return "User has been disabled. Please contact support for further instructions - JT"
            case AuthErrorCode.invalidCustomToken.rawValue:
                return "The custom token format is incorrect"
            case AuthErrorCode.customTokenMismatch.rawValue:
                return "The custom token corresponds to a different audience"
            case AuthErrorCode.invalidCredential.rawValue:
                return "The supplied auth credential is malformed or has expired"
            case AuthErrorCode.userDisabled.rawValue:
                return "The user account has been disabled by an administrator"
            case AuthErrorCode.operationNotAllowed.rawValue:
                return "The given sign-in provider is disabled for this Firebase project"
                    //EMAIL TAKEN
            case AuthErrorCode.emailAlreadyInUse.rawValue:
                return "The email address is already in use by another account"
            case AuthErrorCode.invalidEmail.rawValue:
                return "The email address is badly formatted"
            case AuthErrorCode.wrongPassword.rawValue:
                return "The password is invalid or the user does not have a password"
            case AuthErrorCode.tooManyRequests.rawValue:
                return "We have blocked all requests from this device due to unusual activity"
            case AuthErrorCode.userNotFound.rawValue:
                print("Found no user")
                return "There is no user record corresponding to this identifier"
                    //CREDENTIALS TAKEN
            case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                return "An account already exists with the same email address but differentsign-in credentials"
            case AuthErrorCode.requiresRecentLogin.rawValue:
                return "This operation is sensitive and requires recent authentication. Log inagain before retrying this request"
            case AuthErrorCode.providerAlreadyLinked.rawValue:
                return "This account is already linked to a different provider"
            case AuthErrorCode.noSuchProvider.rawValue:
                return "The specified provider is not enabled for this Firebase project"
            case AuthErrorCode.invalidUserToken.rawValue:
                return "The user's credential is no longer valid. The user must sign in again"
            case AuthErrorCode.userTokenExpired.rawValue:
                return "The user's credential has expired. The user must sign in again"
            case AuthErrorCode.invalidAPIKey.rawValue:
                return "Your API key is invalid, please check you have copied it correctly"
            case AuthErrorCode.userMismatch.rawValue:
                return "The supplied credentials do not correspond to the previously signed inuser"
            case AuthErrorCode.credentialAlreadyInUse.rawValue:
                return "This credential is already associated with a different user account"
            case AuthErrorCode.weakPassword.rawValue:
                return "!!!The password must be 6 characters long or more"
            case AuthErrorCode.appNotAuthorized.rawValue:
                return "This app is not authorized to use Firebase Authentication. Please verifythat the correct bundle identifier has been entered in the Firebase Console"
            case AuthErrorCode.expiredActionCode.rawValue:
                return "The action code has expired"
            case AuthErrorCode.invalidActionCode.rawValue:
                return "The action code is invalid. This can happen if the code is malformed,expired, or has already been used"
            case AuthErrorCode.invalidMessagePayload.rawValue:
                return "The message payload was invalid"
            case AuthErrorCode.invalidSender.rawValue:
                return "The sender ID provided for an Auth instance is invalid"
            case AuthErrorCode.invalidRecipientEmail.rawValue:
                return "The recipient email address is invalid"
            case AuthErrorCode.missingPhoneNumber.rawValue:
                return "To send verification codes, provide a phone number for the recipient"
            case AuthErrorCode.missingVerificationCode.rawValue:
                return "The phone auth credential was created with an empty SMS verification code"
            case AuthErrorCode.missingVerificationID.rawValue:
                return "The phone auth credential was created with an empty verification ID"
            case AuthErrorCode.quotaExceeded.rawValue:
                return "The quota for this operation has been exceeded"
            case AuthErrorCode.sessionExpired.rawValue:
                return "Session Expired"
            case AuthErrorCode.missingEmail.rawValue:
                return "Missing the email field"
            default:
                return "unknown error: \(err.localizedDescription)"
        }
    }
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //     AUTH - SIGNOUT
    //     Log the user out of the DB
    //
    //          accesses the current users Unique ID logged into the DB
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    func logOut() -> Bool{
        
        let userUID = db.currentUser?.uid
        
        do {
            try db.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", checkError(err: signOutError as NSError))
            return true
        }
        
        statusErrorMessage = "user(\(String(describing: userUID))): Signed out Successfully"
        print("user(\(String(describing: userUID))): Signed out Successfully---no user currently logged in")
        return false
    }
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //  AUTH - GET AUTH STATUS
    //        UNTESTED - Authethication Status
    //
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    
    func getUserAuthStatus() -> String {
        if db.currentUser != nil {
                // User is signed in.
                // ...
            let user = db.currentUser
            
            if let user = user {
                    // The user's ID, unique to the Firebase project.
                    // Do NOT use this value to authenticate with your backend server,
                    // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                self.statusErrorMessage = "currentUser.Auth: Successful---User:\(uid) is logged in"
                print("currentUser.Auth: Successful---User:\(uid) is logged in")
                return "currentUser.Auth: Successful---User:\(uid) is logged in"
            } else {
                    // No user is signed in.
                    // ...
                print("currentUser.Auth: unsuccessful---No user is currently signed in")
                self.statusErrorMessage = "currentUser.Auth: unsuccessful---No user is currently signed in"
                return "currentUser.Auth: unsuccessful---No user is currently signed in"
            }
        }
        return "function call failed"
    }
    

    
    
    
}
        
        
/*
//UNUSED AND UNFINISHED ITEMS TO USE

    //MARK: get currentUser info


    //TODO: uid

    //TODO: providerID

    //TODO: email
    
/*
    if (db.currentUser? != nil) {
        let user = Auth.auth().currentUser
        let user_email = user?.email
        let user_UID = user?.uid
        let user_hashValue = user?.hashValue
        let user_photoURL = user?.photoURL

        let user_updatePassword = user?.updatePassword(to: "Password!1234")
        let user_updateEmail = user?.updateEmail(to: "justintrubela@icloud.com")
    }
    else{
      handle errors
    }

 */
            
            

    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //                          Authethication ERRORS
    //
    //
    /*------------------------------------------------------------------------------------------------------------------------*/

    //Errors
    /*
     /** Indicates a validation error with the custom token.
      */
     public static var invalidCustomToken: AuthErrorCode.Code { get }

     /** Indicates the service account and the API key belong to different projects.
      */
     public static var customTokenMismatch: AuthErrorCode.Code { get }

     /** Indicates the IDP token or requestUri is invalid.
      */
     public static var invalidCredential: AuthErrorCode.Code { get }

     /** Indicates the user's account is disabled on the server.
      */
     public static var userDisabled: AuthErrorCode.Code { get }

     /** Indicates the administrator disabled sign in with the specified identity provider.
      */
     public static var operationNotAllowed: AuthErrorCode.Code { get }

     /** Indicates the email used to attempt a sign up is already in use.
      */
     public static var emailAlreadyInUse: AuthErrorCode.Code { get }

     /** Indicates the email is invalid.
      */
     public static var invalidEmail: AuthErrorCode.Code { get }

     /** Indicates the user attempted sign in with a wrong password.
      */
     public static var wrongPassword: AuthErrorCode.Code { get }

     /** Indicates that too many requests were made to a server method.
      */
     public static var tooManyRequests: AuthErrorCode.Code { get }

     /** Indicates the user account was not found.
      */
     public static var userNotFound: AuthErrorCode.Code { get }

     /** Indicates account linking is required.
      */
     public static var accountExistsWithDifferentCredential: AuthErrorCode.Code { get }

     /** Indicates the user has attemped to change email or password more than 5 minutes after
         signing in.
      */
     public static var requiresRecentLogin: AuthErrorCode.Code { get }

     /** Indicates an attempt to link a provider to which the account is already linked.
      */
     public static var providerAlreadyLinked: AuthErrorCode.Code { get }

     /** Indicates an attempt to unlink a provider that is not linked.
      */
     public static var noSuchProvider: AuthErrorCode.Code { get }

     /** Indicates user's saved auth credential is invalid, the user needs to sign in again.
      */
     public static var invalidUserToken: AuthErrorCode.Code { get }

     /** Indicates a network error occurred (such as a timeout, interrupted connection, or
         unreachable host). These types of errors are often recoverable with a retry. The
         `NSUnderlyingError` field in the `NSError.userInfo` dictionary will contain the error
         encountered.
      */
     public static var networkError: AuthErrorCode.Code { get }

     /** Indicates the saved token has expired, for example, the user may have changed account
         password on another device. The user needs to sign in again on the device that made this
         request.
      */
     public static var userTokenExpired: AuthErrorCode.Code { get }

     /** Indicates an invalid API key was supplied in the request.
      */
     public static var invalidAPIKey: AuthErrorCode.Code { get }

     /** Indicates that an attempt was made to reauthenticate with a user which is not the current
         user.
      */
     public static var userMismatch: AuthErrorCode.Code { get }

     /** Indicates an attempt to link with a credential that has already been linked with a
         different Firebase account
      */
     public static var credentialAlreadyInUse: AuthErrorCode.Code { get }

     /** Indicates an attempt to set a password that is considered too weak.
      */
     public static var weakPassword: AuthErrorCode.Code { get }

     /** Indicates the App is not authorized to use Firebase Authentication with the
         provided API Key.
      */
     public static var appNotAuthorized: AuthErrorCode.Code { get }

     /** Indicates the OOB code is expired.
      */
     public static var expiredActionCode: AuthErrorCode.Code { get }

     /** Indicates the OOB code is invalid.
      */
     public static var invalidActionCode: AuthErrorCode.Code { get }

     /** Indicates that there are invalid parameters in the payload during a "send password reset
      *  email" attempt.
      */
     public static var invalidMessagePayload: AuthErrorCode.Code { get }

     /** Indicates that the sender email is invalid during a "send password reset email" attempt.
      */
     public static var invalidSender: AuthErrorCode.Code { get }

     /** Indicates that the recipient email is invalid.
      */
     public static var invalidRecipientEmail: AuthErrorCode.Code { get }

     /** Indicates that an email address was expected but one was not provided.
      */
     public static var missingEmail: AuthErrorCode.Code { get }

     /** Indicates that the iOS bundle ID is missing when a iOS App Store ID is provided.
      */
     public static var missingIosBundleID: AuthErrorCode.Code { get }

     /** Indicates that the android package name is missing when the `androidInstallApp` flag is set
         to true.
      */
     public static var missingAndroidPackageName: AuthErrorCode.Code { get }

     /** Indicates that the domain specified in the continue URL is not allowlisted in the Firebase
         console.
      */
     public static var unauthorizedDomain: AuthErrorCode.Code { get }

     /** Indicates that the domain specified in the continue URI is not valid.
      */
     public static var invalidContinueURI: AuthErrorCode.Code { get }

     /** Indicates that a continue URI was not provided in a request to the backend which requires
         one.
      */
     public static var missingContinueURI: AuthErrorCode.Code { get }

     /** Indicates that a phone number was not provided in a call to
         `verifyPhoneNumber:completion:`.
      */
     public static var missingPhoneNumber: AuthErrorCode.Code { get }

     /** Indicates that an invalid phone number was provided in a call to
         `verifyPhoneNumber:completion:`.
      */
     public static var invalidPhoneNumber: AuthErrorCode.Code { get }

     /** Indicates that the phone auth credential was created with an empty verification code.
      */
     public static var missingVerificationCode: AuthErrorCode.Code { get }

     /** Indicates that an invalid verification code was used in the verifyPhoneNumber request.
      */
     public static var invalidVerificationCode: AuthErrorCode.Code { get }

     /** Indicates that the phone auth credential was created with an empty verification ID.
      */
     public static var missingVerificationID: AuthErrorCode.Code { get }

     /** Indicates that an invalid verification ID was used in the verifyPhoneNumber request.
      */
     public static var invalidVerificationID: AuthErrorCode.Code { get }

     /** Indicates that the APNS device token is missing in the verifyClient request.
      */
     public static var missingAppCredential: AuthErrorCode.Code { get }

     /** Indicates that an invalid APNS device token was used in the verifyClient request.
      */
     public static var invalidAppCredential: AuthErrorCode.Code { get }

     /** Indicates that the SMS code has expired.
      */
     public static var sessionExpired: AuthErrorCode.Code { get }

     /** Indicates that the quota of SMS messages for a given project has been exceeded.
      */
     public static var quotaExceeded: AuthErrorCode.Code { get }

     /** Indicates that the APNs device token could not be obtained. The app may not have set up
         remote notification correctly, or may fail to forward the APNs device token to Auth
         if app delegate swizzling is disabled.
      */
     public static var missingAppToken: AuthErrorCode.Code { get }

     /** Indicates that the app fails to forward remote notification to Auth.
      */
     public static var notificationNotForwarded: AuthErrorCode.Code { get }

     /** Indicates that the app could not be verified by Firebase during phone number authentication.
      */
     public static var appNotVerified: AuthErrorCode.Code { get }

     /** Indicates that the reCAPTCHA token is not valid.
      */
     public static var captchaCheckFailed: AuthErrorCode.Code { get }

     /** Indicates that an attempt was made to present a new web context while one was already being
         presented.
      */
     public static var webContextAlreadyPresented: AuthErrorCode.Code { get }

     /** Indicates that the URL presentation was cancelled prematurely by the user.
      */
     public static var webContextCancelled: AuthErrorCode.Code { get }

     /** Indicates a general failure during the app verification flow.
      */
     public static var appVerificationUserInteractionFailure: AuthErrorCode.Code { get }

     /** Indicates that the clientID used to invoke a web flow is invalid.
      */
     public static var invalidClientID: AuthErrorCode.Code { get }

     /** Indicates that a network request within a SFSafariViewController or WKWebView failed.
      */
     public static var webNetworkRequestFailed: AuthErrorCode.Code { get }

     /** Indicates that an internal error occurred within a SFSafariViewController or WKWebView.
      */
     public static var webInternalError: AuthErrorCode.Code { get }

     /** Indicates a general failure during a web sign-in flow.
      */
     public static var webSignInUserInteractionFailure: AuthErrorCode.Code { get }

     /** Indicates that the local player was not authenticated prior to attempting Game Center
         signin.
      */
     public static var localPlayerNotAuthenticated: AuthErrorCode.Code { get }

     /** Indicates that a non-null user was expected as an argmument to the operation but a null
         user was provided.
      */
     public static var nullUser: AuthErrorCode.Code { get }

     /** Indicates that a Firebase Dynamic Link is not activated.
      */
     public static var dynamicLinkNotActivated: AuthErrorCode.Code { get }

     /**
      * Represents the error code for when the given provider id for a web operation is invalid.
      */
     public static var invalidProviderID: AuthErrorCode.Code { get }

     /**
      * Represents the error code for when an attempt is made to update the current user with a
      * tenantId that differs from the current FirebaseAuth instance's tenantId.
      */
     public static var tenantIDMismatch: AuthErrorCode.Code { get }

     /**
      * Represents the error code for when a request is made to the backend with an associated tenant
      * ID for an operation that does not support multi-tenancy.
      */
     public static var unsupportedTenantOperation: AuthErrorCode.Code { get }

     /** Indicates that the Firebase Dynamic Link domain used is either not configured or is
         unauthorized for the current project.
      */
     public static var invalidDynamicLinkDomain: AuthErrorCode.Code { get }

     /** Indicates that the credential is rejected because it's misformed or mismatching.
      */
     public static var rejectedCredential: AuthErrorCode.Code { get }

     /** Indicates that the GameKit framework is not linked prior to attempting Game Center signin.
      */
     public static var gameKitNotLinked: AuthErrorCode.Code { get }

     /** Indicates that the second factor is required for signin.
      */
     public static var secondFactorRequired: AuthErrorCode.Code { get }

     /** Indicates that the multi factor session is missing.
      */
     public static var missingMultiFactorSession: AuthErrorCode.Code { get }

     /** Indicates that the multi factor info is missing.
      */
     public static var missingMultiFactorInfo: AuthErrorCode.Code { get }

     /** Indicates that the multi factor session is invalid.
      */
     public static var invalidMultiFactorSession: AuthErrorCode.Code { get }

     /** Indicates that the multi factor info is not found.
      */
     public static var multiFactorInfoNotFound: AuthErrorCode.Code { get }

     /** Indicates that the operation is admin restricted.
      */
     public static var adminRestrictedOperation: AuthErrorCode.Code { get }

     /** Indicates that the email is required for verification.
      */
     public static var unverifiedEmail: AuthErrorCode.Code { get }

     /** Indicates that the second factor is already enrolled.
      */
     public static var secondFactorAlreadyEnrolled: AuthErrorCode.Code { get }

     /** Indicates that the maximum second factor count is exceeded.
      */
     public static var maximumSecondFactorCountExceeded: AuthErrorCode.Code { get }

     /** Indicates that the first factor is not supported.
      */
     public static var unsupportedFirstFactor: AuthErrorCode.Code { get }

     /** Indicates that the a verifed email is required to changed to.
      */
     public static var emailChangeNeedsVerification: AuthErrorCode.Code { get }

     /** Indicates that the nonce is missing or invalid.
      */
     public static var missingOrInvalidNonce: AuthErrorCode.Code { get }

     /** Raised when a Cloud Function returns a blocking error. Will include a message returned from
      * the function.
      */
     public static var blockingCloudFunctionError: AuthErrorCode.Code { get }

     /** Indicates an error for when the client identifier is missing.
      */
     public static var missingClientIdentifier: AuthErrorCode.Code { get }

     /** Indicates an error occurred while attempting to access the keychain.
      */
     public static var keychainError: AuthErrorCode.Code { get }

     /** Indicates an internal error occurred.
      */
     public static var internalError: AuthErrorCode.Code { get }

     /** Raised when a JWT fails to parse correctly. May be accompanied by an underlying error
         describing which step of the JWT parsing process failed.
      */
     public static var malformedJWT: AuthErrorCode.Code { get }
    }
     */
    //New Password
    /*
     open func sendPasswordReset(withEmail email: String, completion: ((Error?) -> Void)? = nil)

     /** @fn sendPasswordResetWithEmail:completion:
         @brief Initiates a password reset for the given email address.
     
         @param email The email address of the user.
         @param completion Optionally; a block which is invoked when the request finishes. Invoked
             asynchronously on the main thread in the future.
     
         @remarks Possible error codes:
     
             + `AuthErrorCodeInvalidRecipientEmail` - Indicates an invalid recipient email was
                 sent in the request.
             + `AuthErrorCodeInvalidSender` - Indicates an invalid sender email is set in
                 the console for this action.
             + `AuthErrorCodeInvalidMessagePayload` - Indicates an invalid email template for
                 sending update email.
     
     
      */
     open func sendPasswordReset(withEmail email: String) async throws

     
     /** @fn sendPasswordResetWithEmail:actionCodeSetting:completion:
         @brief Initiates a password reset for the given email address and `ActionCodeSettings` object.
     
         @param email The email address of the user.
         @param actionCodeSettings An `ActionCodeSettings` object containing settings related to
             handling action codes.
         @param completion Optionally; a block which is invoked when the request finishes. Invoked
             asynchronously on the main thread in the future.
     
         @remarks Possible error codes:
     
             + `AuthErrorCodeInvalidRecipientEmail` - Indicates an invalid recipient email was
                 sent in the request.
             + `AuthErrorCodeInvalidSender` - Indicates an invalid sender email is set in
                 the console for this action.
             + `AuthErrorCodeInvalidMessagePayload` - Indicates an invalid email template for
                 sending update email.
             + `AuthErrorCodeMissingIosBundleID` - Indicates that the iOS bundle ID is missing when
                 `handleCodeInApp` is set to true.
             + `AuthErrorCodeMissingAndroidPackageName` - Indicates that the android package name
                 is missing when the `androidInstallApp` flag is set to true.
             + `AuthErrorCodeUnauthorizedDomain` - Indicates that the domain specified in the
                 continue URL is not allowlisted in the Firebase console.
             + `AuthErrorCodeInvalidContinueURI` - Indicates that the domain specified in the
                 continue URL is not valid.
     
     
      */
     open func sendPasswordReset(withEmail email: String, actionCodeSettings: ActionCodeSettings, completion: ((Error?) -> Void)? = nil)

     /** @fn sendPasswordResetWithEmail:actionCodeSetting:completion:
         @brief Initiates a password reset for the given email address and `ActionCodeSettings` object.
     
         @param email The email address of the user.
         @param actionCodeSettings An `ActionCodeSettings` object containing settings related to
             handling action codes.
         @param completion Optionally; a block which is invoked when the request finishes. Invoked
             asynchronously on the main thread in the future.
     
         @remarks Possible error codes:
     
             + `AuthErrorCodeInvalidRecipientEmail` - Indicates an invalid recipient email was
                 sent in the request.
             + `AuthErrorCodeInvalidSender` - Indicates an invalid sender email is set in
                 the console for this action.
             + `AuthErrorCodeInvalidMessagePayload` - Indicates an invalid email template for
                 sending update email.
             + `AuthErrorCodeMissingIosBundleID` - Indicates that the iOS bundle ID is missing when
                 `handleCodeInApp` is set to true.
             + `AuthErrorCodeMissingAndroidPackageName` - Indicates that the android package name
                 is missing when the `androidInstallApp` flag is set to true.
             + `AuthErrorCodeUnauthorizedDomain` - Indicates that the domain specified in the
                 continue URL is not allowlisted in the Firebase console.
             + `AuthErrorCodeInvalidContinueURI` - Indicates that the domain specified in the
                 continue URL is not valid.
     
     
      */
     open func sendPasswordReset(withEmail email: String, actionCodeSettings: ActionCodeSettings) async throws

     
     /** @fn sendSignInLinkToEmail:actionCodeSettings:completion:
         @brief Sends a sign in with email link to provided email address.
     
         @param email The email address of the user.
         @param actionCodeSettings An `ActionCodeSettings` object containing settings related to
             handling action codes.
         @param completion Optionally; a block which is invoked when the request finishes. Invoked
             asynchronously on the main thread in the future.
      */
     */
*/
