//
//  MScootsApp.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//
// 4539 lines of code
// 16 views
// 7 class models

import SwiftUI

@main
struct MScootsApp: App {

    var body: some Scene {
        
        WindowGroup {
                LandingPageView()
        }
    }
}





/*                          MSCOOTS
 
 
 
//MARK: VIEW

 
 //
 //  View.swift
 //  MScoots
 //
 //  Created by Justin Trubela on 4/29/23.
 //
 //  Represents a swift file with structs that conform to the View
 //      protocols that allow the views code
 
 //  This is where we can find the necessary View elements that are used to interact with
 //  This file needs to be referenced as a property in ContentView that holds the navigationstack
 //  Each view element will have a reference to a NavigationLink and the View elements/structs needed
 //
 
 import Foundation
 
 
 
 //!!!:
 //MARK: View:
 
 //View:
 //- AuthenticationView
 //- AuthenticationViewModel
 //- TextFields for user input
 //    - Buttons for sign up and sign in
 //    - UserHomeView
 //    - UserViewModel
 //    - Display user's profile picture and basic information
 //    - Buttons for accessing user's profile and scooter reservation
 //    - UserProfileView
 //    - UserViewModel
 //    - Displays user's profile picture and information
 //    - Button for editing profile picture and verification status
 //    - ScooterListView
 //    - UserViewModel
 //    - Displays list of available scooters
 //    - Button for reserving scooter
 
 
 
 //- Layout: Define the layout and appearance of the view, including any constraints or UI elements
 
 //- Initialization: Define the initialization logic for the view, such as an initializer method or a convenience init
 //TODO: - this is where the references that hold the data will be located.
 
 //TODO: - Data Binding: Bind the view to the ViewModel to display the appropriate data and respond to user actions
 
 //TODO: - Lifecycle: Implement any necessary lifecycle methods for the view, such as viewDidLoad or viewWillDisappear
 
 
 
 
 
 //MARK: VIEW
 //
 //View:
 //- Properties: Define the properties that represent the state of the ViewModel, such as the data to be displayed or the user's //input
 //
 
 
 
 
 
 
//MARK: MODEL
 
 //
 //  Model.swift
 //  MScoots
 //
 //  Created by Justin Trubela on 4/29/23.
 //
 
 import Foundation
 
 
 /*
  
  //!!!:
  //MARK: MODEL:
  
  Model:
  - Properties: Define the properties that represent the data of the model
  - Initialization: Define the initialization logic for the model, such as an initializer method or a convenience init
  - Methods: Define any methods that operate on the data of the model, such as CRUD operations or other custom logic
  - Conformance: Ensure that the model conforms to any relevant protocols or standards, such as Codable or Equatable
  
  */
 
 
 //MARK: Model
 /*
  Model:
  - User
  - userID: Int
  - firstName: String
  - lastName: String
  - email: String
  - password: String
  - profilePicture: Image
  - isVerified: Bool
  */
 
 
 
 

 



 //!!!: @State: This property wrapper is used to manage state within a view. When the state value changes, the view is automatically re-rendered with the new value.
 
 //!!!: @StateObject: This property wrapper is used to create an observable object that is owned by the current view. The object is automatically created when the view is first created, and is destroyed when the view is destroyed.
 

 @Binding: This property wrapper is used to create a two-way binding between a view and its parent. Changes to the value in the parent view are automatically propagated to the child view, and vice versa.
 
 @Published: This property wrapper is used to create an observable object that automatically publishes its changes to any subscribers.
 
 //!!!: @ObservedObject: This property wrapper is used to observe changes to an external object, typically a model object. When the observed object changes, the view is automatically re-rendered.

 
 @EnvironmentObject: This property wrapper is used to share data across views in the view hierarchy. An environment object is created in a parent view and passed down to child views, allowing them to access and modify the same data
 

 //!!!: @Environment: This property wrapper is used to access values from the environment, such as the current color scheme or localization settings.
 
 //!!!: @FocusState property wrapper, which is used to manage focus state across multiple views.
 
 
 @FetchRequest: This property wrapper is used to fetch data from Core Data, based on a specified predicate and sort order.
 
 
 @Lazy - This property wrapper is used to lazily initialize a property. The property is not initialized until it is first accessed.
 
 @NSCopying - This property wrapper is used to automatically make a copy of an object when it is assigned to a property. This is useful when you want to create a new instance of an object that has value semantics, such as a struct or NSString.
 
 @NSManaged - This property wrapper is used in conjunction with Core Data to indicate that a property is managed by Core Data.
 
 //!!!: @UIApplicationMain - This property wrapper is used to mark the entry point of an iOS application. It is used in the main.swift file of the application.
 
 @escaping - This property wrapper is used to indicate that a closure passed as an argument to a function will be stored and used later. This is needed to prevent a retain cycle when capturing self inside the closure.

*/


//MARK: - Private Methods
//MARK: - Public Methods

//MARK: !!!
//MARK: - Note
//MARK: - Bug:
//MARK: - Experimental
//MARK: - Bug:
//MARK: - Experimental
//MARK: - Hack
 

/*..............................................................*/
/*                                                              */
/*.....................LIBRARIES IMPORTED.......................*/
/*                                                              */
/*
 SwiftUI
 FireBase
 FirebaseAuth
 */
/*                                                              */
/*..............................................................*/
/*                          structs                             */
/*
 MARK:  LandingPageView: View
 
 */
/*..............................................................*/
/*                                                              */
/* Views that are updating this view                            */
/*
 //MARK: NOTE:
 Model-related variables: model, db
 
 View-related variables: showLoadingPageView, showLoadingView, showLandingPageView, animate, animation, animationAmount, showingAlert, statusErrorMessage, sshowingPWAlert, showRegistration, shouldShowRegistration, dismiss, Field, focusField, buttonsDisabled
 
 Authentication-related variables: email, password, isValidEmail, isAdmin, isAdminUser, isTheSame, allowedAdminEmails, isUser, isLoggedIn, signInError
 
 getStatusMessage, allowedAdminEmails, isTheSame (assuming this refers to whether two objects are the same) ,signInError

 model- @ObservedObject 

 
 db
 showLoadingPageView
 showLoadingView
 showLandingPageView
 animate
 animation
 animationAmount
 showingAlert
 statusErrorMessage
 getStatusMessage
 sshowingPWAlert
 showRegistration
 shouldShowRegistration
 dismiss
 Field
 email
 password
 isValidEmail
 focusField
 buttonsDisabled
 isAdmin
 isAdminUser
 isTheSame
 allowedAdminEmails
 isUser                             
 isLoggedIn
 signInError
 
 
 Model-related variables:
 
 model: No property wrapper.
 
 db: @EnvironmentObject, @StateObject, @ObservedObject, or no property wrapper.
 
 
 
 
 View-related variables:
 
 showLoadingPageView: @State.
 showLoadingView: @State.
 showLandingPageView: @State.
 animate: @State.
 animation: @State.
 animationAmount: @State.
 showingAlert: @State.
 statusErrorMessage: @State.
 sshowingPWAlert: @State.
 showRegistration: @State.
 shouldShowRegistration: @State.
 dismiss: No property wrapper.
 Field: No property wrapper.
 focusField: @FocusedState or no property wrapper.
 buttonsDisabled: @State.
 
 
 
 Authentication-related variables:
 
 email: @State.
 password: @State.
 isValidEmail: @State.
 isAdmin: @AppStorage or @State.
 isAdminUser: @AppStorage or @State.
 isTheSame: @State.
 allowedAdminEmails: @AppStorage or @State.
 isUser: @AppStorage or @State.
 isLoggedIn: @AppStorage or @State.
 signInError: @State.
 
 
 //MARK: ENDNOTE
 
 //MARK: LINT
 DispatchQueue.main.asyncAfter(deadline: .now() + 3)
 
 
 
 */
/* Views that are updated by this view                          */
/*                                                              */
/*                                                              */
/*..............................................................*/
/*                                                              */
/*                      LandingPageView                         */
/*                                                              */
/*..............................................................*/

//MARK: - Private Methods
//MARK: - Public Methods
/*                                                              */
/*  Property Wrappers                                           */

/*  Textual Based Elements                                      */
/*  Functions                                                   */
/*  Variables                                                   */
/*  Computed Properties                                         */
/*  Current View Models                                         */
/*  Current View ModelViews                                     */


//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\//
/*  View, Model, Model View                                     */
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\//
/*..............................................................*/
/*  View                                                        */
/*..............................................................*/
/*..............................................................*/
/*  Model                                                       */
/*..............................................................*/
/*..............................................................*/
/*  View Model                                                  */
/*..............................................................*/

/*  Overview of the elements that each project consists of      */
/*  Code Review for Optimization                                */
/*  Items Left To Finish Project                                */

//MARK: FIX:
//MARK: TODO:
//MARK: LINT:
//MARK: BUGS
//MARK: ERRORS
//MARK: !!!
//TODO:

/*..............................................................*/

//SWIFT HELP








//struct ContentView1: View {
//    @Binding var MenuViewStatus: Bool //----> TRUE on One side
//    @StateObject var model = Firebase_Authorization()
//
//    // V/   @Binding property value is modified in the ContentView
//    //VM/       Switches the state of MenuViewStatus to Visible or not Visible
//    func SwitchToContentView(){
//        MenuViewStatus.toggle()
//    }
//
//
//    //ViewItem is shown to the NavStack for to navigate to view
//    //Protocol for ViewItem To conform to Hashable to access
//    struct ViewItem: Identifiable, Hashable {
//        let name: String
//        let id = NSUUID().uuidString
//    }
//    //update the view to the navigationstack path variable
//    func ShowViewForItem(view: ViewItem) -> AnyView {
//        switch view.name {
//            case "WalletView":
//                return AnyView(WalletView())
//            case "UserHomeView":
//                return AnyView(UserHomeView())
//            case "UserProfile_SettingsView":
//                return AnyView(UserProfile_SettingsView())
//            case "Scoot_ReserveView":
//                return AnyView(Scoot_ReserveView())
//            case "Scoot_MapView":
//                return AnyView(Scoot_MapView())
//            case "Scoot_MyScootsView":
//                return AnyView(Scoot_MyScootsView())
//                //            case "Scoot_LotViews":
//                //                return AnyView(Scoot_LotViews())
//            case "Scoot_ListView":
//                return AnyView(Scoot_ListView())
//            case "Scoot_CheckoutView":
//                return AnyView(Scoot_CheckoutView())
//            case "Scoot_CheckoutConfirmMessageSheet":
//                return AnyView(Scoot_CheckoutConfirmMessageSheet())
//            case "ScanQRView":
//                return AnyView(ScanQRView())
//            case "RegistrationView":
//                return AnyView(RegistrationView())
//            case "LandingPageView":
//                return AnyView(LandingPageView())
//            default:
//                return AnyView(ContentView(MenuViewStatus: $MenuViewStatus))
//        }
//    }
//    //Array to hold the viewItems
//
//    let views: [ViewItem] =
//    [
//        .init(name: "ContentView"), //UserHomeView
//        .init(name: "WalletView"),
//        .init(name: "UserHomeView"),
//        .init(name: "UserProfile_SettingsView"),
//        .init(name: "Scoot_ReserveView"),
//        .init(name: "Scoot_MapView"),
//        .init(name: "Scoot_MyScootsView"),
//        .init(name: "Scoot_LotViews"),
//        .init(name: "Scoot_ListView"),
//        .init(name: "Scoot_CheckoutView"),
//        .init(name: "Scoot_CheckoutFinalView"),
//        .init(name: "ScanQRView"),
//        .init(name: "RegistrationView"),
//        .init(name: "LoadingPageView"),
//        .init(name: "LandingPageView"),
//    ]
//    //ScenePhase monitors application state
//    /*The scenePhase is an instance of the ScenePhase enum, which represents thecurrent phase of the app's lifecycle for a particular scene, such asactive, inactive, or background. This property wrapper enables the view toautomatically update and recompute whenever the value of scenePhase changes.
//     By using @Environment(\.scenePhase), you can observe changes to the app's scenephase and respond accordingly in your view. For example, you can use it toperform actions when the app transitions between active, inactive, andbackground states, such as saving data or updating the user interface.
//     */
//    @Environment(\.scenePhase) var scenePhase
//    //NavigationStack Array
//    @State var NavigationPath = [ViewItem]()
//    //List of Stack Array View Struct
//    @State var NavigationPathText = ""
//
//    var body: some View {
//        NavigationStack{
//            // Main content of the view
//            ZStack{
//
//
////                Color.black.ignoresSafeArea()
////
////                VStack{
////                    HamburgerMenuView()
////                        .animation(.default)
////                    //            VStack{
////                    //                HamburgerMenuView(MenuViewStatus: $MenuViewStatus)
////                    //            }
////                        .navigationBarTitle("HamburgerMenu")
////                        .navigationBarItems(
////                            trailing:
////                                Button(
////                                    action: {
////                                        withAnimation {
////                                            MenuViewStatus.toggle()
////                                        }
////                                    }
////                                )
////                            {ContentView(MenuViewStatus: $MenuViewStatus)}
////                        )
////                        .ignoresSafeArea()
////
////                        .frame(width: UIScreen.main.bounds.width)
////                    //if MenuviewStatus
////                        .offset(x: MenuViewStatus ? UIScreen.main.bounds.width : 0)
////
////                        .animation(.default).foregroundColor(.white)
//                }
//            }
////            .aspectRatio(7 / 2, contentMode: .fill)
//
////            .toolbar {
////                ToolbarItem(placement: .navigationBarTrailing)
////                {
////                    Button {}
////                label: {
////                    HamburgerMenu()
////                }
////                }
////            }
////            .navigationDestination(isPresented: $MenuViewStatus, destination:{
////                ShowViewForItem(view: ViewItem(name: NavigationPathText))
////            }
////            )
//
//            //            HamburgerMenuView()
//            //                .frame(width: UIScreen.main.bounds.width)
//            //                .offset(x: MenuViewStatus ? 0 : -UIScreen.main.bounds.width)
//            // Updated offset to open from right side
////            .animation(.default)
//            //            VStack{
//            //                HamburgerMenuView(MenuViewStatus: $MenuViewStatus)
//            //            }
////            .navigationBarTitle("HamburgerMenu")
////            .navigationBarItems(
////                trailing:
////                    Button(
////                        action: {
////                            withAnimation {
////                                MenuViewStatus.toggle()
////                            }
////                        }
////                    )
////                {ContentView(MenuViewStatus: $MenuViewStatus)}
////            )
////            .ignoresSafeArea()
//
////            .frame(width: UIScreen.main.bounds.width * 0.7)
//
////            .offset(x: MenuViewStatus ? UIScreen.main.bounds.width : 0)
//
////            .animation(.default).foregroundColor(.white)
//
//
//    }
//}
//struct HamburgerMenuView1_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var MenuViewStatus = false
//        ContentView(MenuViewStatus: $MenuViewStatus)
//    }
//}










//MARK: NAV VIEW VIEW MODEL

////
////  NavStackViewModel.swift
////  MScoots
////
////  Created by Justin Trubela on 4/27/23.
////
////  Controls the
////
//
//


//create a scooter object so that the user can find them
//  rent/return, admin can add and delete items
//struct Scooter: Identifiable {
//    //conform the object to Identifiable so that we can do a thorough search for
//    // and have complete control over the scooter objects
//    var id = NSUUID().uuidString
//    //location is shown to the user when looking for scoothers to rent
//    //admin will have the option to change and update these locations
//    var location: String
//    //this variable determines if the scooter is ready for the user to come and get it
//    //checks against battery status, any support/service tickets have been submitted,
//    //and if its in the general vecinity
//    var isAvailable: String
//    //shows the user the battery status for the scooter
//    var battery: String
//    //unused
//    var nearestCharger: String
//    var currentUser: studentUser? = nil
//
//
//    init(id: String = UUID().uuidString, location: String, isAvailable: String, battery: String, nearestCharger: String, currentUser: studentUser? = nil) {
//        self.id = id
//        self.location = location
//        self.isAvailable = isAvailable
//        self.battery = battery
//        self.nearestCharger = nearestCharger
//        self.currentUser = currentUser
//    }
//
//
//    struct ScooterInfo: Identifiable {
//        var id = UUID()
//        var scooterNumber: Int
//
//        var model: String
//        var year: String
//
//    }
//}

//class NavigationStackViewModel: ObservableObject {
//    //Create an instance of the NavStack Path ViewModifier as
//    //  needed to have/ the views update upon login
//    @Published var NavPath = [AnyView]()
//
//    let dbStore = FirebaseManager.shared
//
//    //call the function to get the data the items to the NavStack
//    //if the user isStudent
//    //initialize all student Views
//    //initalize the views,
//    func addViewsOnStack(View){
//
//        enum viewNames {
//            case WalletView;
//            case UserHomeView;
//            case UserProfile_SettingsView;
//            case UserView;
//            case Scoot_ReserveView;
//            case Scoot_MapView;
//            case Scoot_MyScootsView;
//            case Scoot_LotViews;
//            case Scoot_ListView;
//            case Scoot_CheckoutView;
//            case Scoot_CheckoutConfirmMessageSheet;
//            case ScanQRView;
//            case RegistrationView;
//            case LandingPageView;
//            case ScooterManagerView;
//            case UserManagerView;
//            case AdminUserHomeView
//        }
//
//
//
//
////
////  NavStackViewModel.swift
////  MScoots
////
////  Created by Justin Trubela on 4/27/23.
////
////  Controls the
////
//
//
//import Foundation
//import SwiftUI
//import FirebaseAuth
//import FirebaseStorage
//
//
//class NavigationStackViewModel: ObservableObject {
//            //Create an instance of the NavStack Path ViewModifier as
//            //  needed to have/ the views update upon login
//            @Published var NavPath = [AnyView]()
//
//            let dbStore = FirebaseManager.shared
//
//            //call the function to get the data the items to the NavStack
//            //if the user isStudent
//            //initialize all student Views
//            //initalize the views,
//            func addViewsOnStack(View){
//                .init([])
//            }
//
//
//
//            //TODO: have the user get authorized and use this ViewModel
//            //      to get and set the req'd db navStacks
//            var DBStore: Bool = {
//                //computed property
//                return false
//            }()
//            var DBAuth: Bool = {
//                return false
//            }()
//
//            var getFirestoreVM = FirebaseManager.shared.firestore
//            var getDBAuthVM = FirebaseManager.shared.auth
//            //TEST:
//
//            //TODO: Add the users information taken from ScooterLocation?
//            //Maybe if "Local Storage" - have to redesign the studentUser
//            @Binding var UserAuththorization: Bool
//            @State var getAuthDatabaseVM = {
//                if let user = Auth.auth().currentUser {
//                    let email = user.email
//                }
//
//                @State var getdbAuorization = Firebase_Firestore.firestore
//
//
//
//
//                //----------------------------------------------------------------------------------------------------------
//
//                //  TODO: input logic function for adding the called NavLink item used in Admin/User Views to output
//                //      back the necessary ID Get information about studentStatus/adminStatus about the user
//                //
//                //if the (user?) -> NavPath    //*---REGISTER/LOGINSuccessful---*/  /*--RENT SCOOTER---*/
//                //----------------------------------------------------------------------------------------------------------| |
//                //MARK:                                                                                                    //  \
//                //*////////////////////////////// --LOGIC RELATED VARIABLES-- //////////////////////////////////\/*/    \
//                //                                 Test the users access                                           //       \
//                //      The user client contacts database LG/SU and if an auth is presented to the system          //         \
//                //-------------------------------------------------------------------------------------------------//           \
//                //---------------------------------------------------------------------------------------------------=============}
//                //                                                                                                                |
//                //                                                                                                                |
//                //                                                                                                                |
//                //                                                                                                                |
//                //                                                                                                                |
//                // Property Wrapper }-----------------------------------------------------------------------------------------//////////}
//
//                //TODO: Add logic to share to and from db and amongst the users
//                //update the view in the local state to the navigationstack path variable
//                //more than likely .onAsync{ some code }
//
//
//
//
//                //private var selectedViewIndex: Int?
//                //stil keeping available untilwe decide
//                //on how to iterate through
//                //var selectedView: AnyView? {
//                func addViewsOnStack(){
//                    //initialize screens for AppUseers: Students,Admins and
//
//
//
//
//
//
//
//                    //Navigation Struct based navigation
//                    struct AppUser : Identifiable {
//                        //not sure if this does it but I found it
//                        //var isAn_Student: Firebase.Firestore.Firebase_Authorization.isUser?;
//                        //value to ship off to other user-states that require it conform to
//                        //  Hashable and Identifiable
//                        var id: UUID
//                        var CWID: Int
//                        var email: String?
//                        var isAStudent : Bool?
//
//                    }
//                    extension accountInfo   {
//                        self .if = UUID()
//                            self.email: String?,
//                            self.displayName: String?
//
//                            init() {
//                                var email: String?
//                                var displayName: String
//                            }
//                            }
//
//
//                    init() {
//                        self.id = UUID()
//                        self.email = authData.email
//                        self.photoURL = photoURL
//                        self.displayName = authData.displayName
//                    }
//                }
//
//                init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
//                    self.id = id
//                    self.title = title
//                    self.attendees = attendees.map { Attendee(name: $0) }
//                    self.lengthInMinutes = lengthInMinutes
//                    self.theme = theme
//                }
//            }
//            //    extension DailyScrum {
//
//
//
//
//
//            //        struct Attendee: Identifiable {
//            //            let id: UUID
//            //            var name: String
//            //
//            //            init(id: UUID = UUID(), name: String) {
//            //                self.id = id
//            //                self.name = name
//            //            }
//            //        }
//            //    }
//
//
//
//            //    extension DailyScrum {
//            //        static let sampleData: [DailyScrum] =
//            //        [
//            //            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
//            //            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
//            //            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
//            //        ]
//            //    }
//            //
//
//
//            //func addViewsOnStack(View){
//            //    .init([])
//            //
//            //}
//
//
//            //private var selectedViewIndex: Int?
//
//            //var selectedView: AnyView? {
//            //create a scooter object so that the user can find them
//            //  rent/return, admin can add and delete items
//            struct Scooter: Identifiable {
//                //conform the object to Identifiable so that we can do a thorough search for
//                // and have complete control over the scooter objects
//                var id = NSUUID().uuidString
//                //location is shown to the user when looking for scoothers to rent
//                //admin will have the option to change and update these locations
//                var location: String
//                //this variable determines if the scooter is ready for the user to come and get it
//                //checks against battery status, any support/service tickets have been submitted,
//                //and if its in the general vecinity
//                var isAvailable: String
//                //shows the user the battery status for the scooter
//                var battery: String
//                //unused
//                var nearestCharger: String
//                var currentUser: studentUser? = nil
//
//
//                init(id: UUID = UUID(), location: String, isAvailable: String,
//                     battery: String, nearestCharger: String, currentUser: studentUser? = nil) {
//                    self.id = UUID().uuidString
//                    self.location = location
//                    self.isAvailable = isAvailable
//                    self.battery = battery
//                    self.nearestCharger = nearestCharger
//                    self.currentUser = currentUser
//
//                } extension scooterInfo: Scooter {
//                    var scooterQRIdentifier: String
//                    var availScooters: [Scooter?]
//                    var model: String?
//                    var Serial: String?
//                    var color: theme
//                    {
//
//                        //TODO:
//                        enum Theme: String {
//                            case green
//                            case blue
//                            case red
//                            case orange
//                            case black
//                            case purple
//                            case gray
//                            case yellow
//                        }
//                    }
//                    var mainColor: Color {
//                        Color(rawValue)
//                    }
//                    var name: String {
//                        rawValue.capitalized
//                    }
//
//
//
//
//
//                    init(id: UUID = UUID(), location: String, availableScooters: [String], lengthInMinutes: Int, theme: accentColor) {
//                        self.id = UUID().uuidString
//                        self.location = location
//                        self.availableScooters[availableScooters] = attendees.map { Attendee(name: $0) }
//                        self.lengthInMinutes = lengthInMinutes
//                        self.theme = theme
//                    }
//                }
//                var accentColor: Color {
//                    switch self {
//                        case .orange:
//                        case .red:
//                        case .green:
//                        case .yellow:
//                        case .black:
//                        case .gray:
//                        case .blue:
//                        case .purple:
//                        case .brown:
//                        default: .red:
//                    }
//                }
//                var mainColor: Color {
//                    Color(accentColr)
//                }
//                var name: String {
//                    rawValue.capitalized
//                }
//            }
//
//
//
//            struct DetailView: View {
//                let scrum: DailyScrum
//
//                var body: some View {
//                    List {
//                        Section(header: Text("Meeting Info")) {
//                            Label("Start Meeting", systemImage: "timer")
//                                .font(.headline)
//                                .foregroundColor(.accentColor)
//
//                            HStack {
//
//                                Label("Length", systemImage: "clock")
//
//                                Spacer()
//
//                                Text("\(scrum.lengthInMinutes) minutes")
//                            }
//                            .accessibilityElement(children: .combine)
//                        }
//                        Section(header: Text("Attendees")) {
//
//                            ForEach(scrum.attendees) { attendee in
//
//                                Label(attendee.name, systemImage: "person")
//
//                            }
//                        }
//                    }.navigationTitle(scrum.title)
//                }
//            }
//
//
//            ChatGPT
//            It seems that your code is incomplete and contains syntax errors. Before we can determine what is causing the error, can you please provide the complete and correct code?
//
//
//
//
//
//
//
//        .init([])
//
//    }
//
//
//
//    //TODO: have the user get authorized and use this ViewModel
//    //      to get and set the req'd db navStacks
//    var DBStore: Bool = {
//        //computed property
//        return false
//    }()
//    var DBAuth: Bool = {
//        return false
//    }()
//
//    var getFirestoreVM = FirebaseManager.shared.firestore
//    var getDBAuthVM = FirebaseManager.shared.auth
//    //TEST:
//
//    //TODO: Add the users information taken from ScooterLocation?
//    //Maybe if "Local Storage" - have to redesign the studentUser
//    @Binding var UserAuththorization: Bool
//    @State var getAuthDatabaseVM = {
//        if let user = Auth.auth().currentUser {
//        let email = user.email
//    }
//
//    @State var getdbAuorization = Firebase_Firestore.firestore
//
//
//
//
//    //----------------------------------------------------------------------------------------------------------
//
//    //  TODO: input logic function for adding the called NavLink item used in Admin/User Views to output
//    //      back the necessary ID Get information about studentStatus/adminStatus about the user
//    //
//    //if the (user?) -> NavPath    //*---REGISTER/LOGINSuccessful---*/  /*--RENT SCOOTER---*/
//    //----------------------------------------------------------------------------------------------------------| |
//    //MARK:                                                                                                    //  \
//            //*////////////////////////////// --LOGIC RELATED VARIABLES-- //////////////////////////////////\/*/    \
//         //                                 Test the users access                                           //       \
//        //      The user client contacts database LG/SU and if an auth is presented to the system          //         \
//       //-------------------------------------------------------------------------------------------------//           \
//      //---------------------------------------------------------------------------------------------------=============}
//      //                                                                                                                |
//      //                                                                                                                |
//      //                                                                                                                |
//      //                                                                                                                |
//      //                                                                                                                |
//      // Property Wrapper }-----------------------------------------------------------------------------------------//////////}
//
//    //TODO: Add logic to share to and from db and amongst the users
//    //update the view in the local state to the navigationstack path variable
//    //more than likely .onAsync{ some code }
//
//
//
//
//    //private var selectedViewIndex: Int?
//    //stil keeping available untilwe decide
//    //on how to iterate through
//    //var selectedView: AnyView? {
//        func addViewsOnStack(){
//        //initialize screens for AppUseers: Students,Admins and
//
//
//
//
//
//
//
//    //Navigation Struct based navigation
//            struct AppUser : Identifiable {
//                //not sure if this does it but I found it
//                //var isAn_Student: Firebase.Firestore.Firebase_Authorization.isUser?;
//                //value to ship off to other user-states that require it conform to
//                //  Hashable and Identifiable
//                var id: UUID
//                var CWID: Int
//                var email: String?
//                var isAStudent : Bool?
//
//            }
//            extension accountInfo: AppUser   {
//                self.id = UUID()
//                self.email: String?,
//                self.displayName: String?
//
//
//
//            init{
//                self.id = UUID()
//                self.email = authData.email
//                self.photoURL = photoURL
//                self.displayName = authData.displayName
//            }
//        }
//    }
//
//        init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
//            self.id = id
//            self.title = title
//            self.attendees = attendees.map { Attendee(name: $0) }
//            self.lengthInMinutes = lengthInMinutes
//            self.theme = theme
//        }
//    }
////    extension DailyScrum {
//
//
//
//
//
////        struct Attendee: Identifiable {
////            let id: UUID
////            var name: String
////
////            init(id: UUID = UUID(), name: String) {
////                self.id = id
////                self.name = name
////            }
////        }
////    }
//
//
//
////    extension DailyScrum {
////        static let sampleData: [DailyScrum] =
////        [
////            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
////            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
////            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
////        ]
////    }
////
//
//
////func addViewsOnStack(View){
////    .init([])
////
////}
//
//
//    //private var selectedViewIndex: Int?
//
//    //var selectedView: AnyView? {
//    //create a scooter object so that the user can find them
//    //  rent/return, admin can add and delete items
//    struct Scooter: Identifiable {
//        //conform the object to Identifiable so that we can do a thorough search for
//        // and have complete control over the scooter objects
//        var id = NSUUID().uuidString
//        //location is shown to the user when looking for scoothers to rent
//        //admin will have the option to change and update these locations
//        var location: String
//        //this variable determines if the scooter is ready for the user to come and get it
//        //checks against battery status, any support/service tickets have been submitted,
//        //and if its in the general vecinity
//        var isAvailable: String
//        //shows the user the battery status for the scooter
//        var battery: String
//        //unused
//        var nearestCharger: String
//        var currentUser: studentUser? = nil
//
//
//        init(id: UUID = UUID(), location: String, isAvailable: String,
//             battery: String, nearestCharger: String, currentUser: studentUser? = nil) {
//            self.id = UUID().uuidString
//            self.location = location
//            self.isAvailable = isAvailable
//            self.battery = battery
//            self.nearestCharger = nearestCharger
//            self.currentUser = currentUser
//
//        } extension scooterInfo: Scooter {
//            var scooterQRIdentifier: String
//            var availScooters: [Scooter?]
//            var model: String?
//            var Serial: String?
//            var color: theme
//            {
//
//            //TODO:
//            enum Theme: String {
//                case green
//                case blue
//                case red
//                case orange
//                case black
//                case purple
//                case gray
//                case yellow
//            }
//            }
//            var mainColor: Color {
//                Color(rawValue)
//            }
//            var name: String {
//                rawValue.capitalized
//            }
//
//
//
//
//
//                init(id: UUID = UUID(), location: String, availableScooters: [String], lengthInMinutes: Int, theme: accentColor) {
//                self.id = UUID().uuidString
//                self.location = location
//                self.availableScooters[availableScooters] = attendees.map { Attendee(name: $0) }
//                self.lengthInMinutes = lengthInMinutes
//                self.theme = theme
//            }
//        }
//
//
//        enum MyColor: String {
//            case orange
//            case red
//            case green
//            case yellow
//            case black
//            case gray
//            case blue
//            case purple
//            case brown
//
//            var accentColor: Color {
//                switch self {
//                    case .orange:
//                        return Color.orange
//                    case .red:
//                        return Color.red
//                    case .green:
//                        return Color.green
//                    case .yellow:
//                        return Color.yellow
//                    case .black:
//                        return Color.black
//                    case .gray:
//                        return Color.gray
//                    case .blue:
//                        return Color.blue
//                    case .purple:
//                        return Color.purple
//                    case .brown:
//                        return Color.brown
//                    default:
//                        return Color.red
//                }
//            }
//
//            var mainColor: Color {
//                Color(accentColor)
//            }
//
//            var name: String {
//                rawValue.capitalized
//            }
//        }
//    }
//
//
//
//struct DetailView: View {
//    let scrum: studentUsers
//
//    var body: some View {
//        List {
//            Section(header: Text("Meeting Info")) {
//                Label("Start Meeting", systemImage: "timer")
//                    .font(.headline)
//                    .foregroundColor(.accentColor)
//
//                HStack {
//
//                    Label("Length", systemImage: "clock")
//
//                    Spacer()
//
//                    Text("\(scrum.lengthInMinutes) minutes")
//                }
//                .accessibilityElement(children: .combine)
//            }
//            Section(header: Text("Attendees")) {
//
//                ForEach(scrum.attendees) { attendee in
//
//                    Label(attendee.name, systemImage: "person")
//
//                }
//            }
//        }.navigationTitle(scrum.title)
//    }
//}
//









//MARK: NAV STACK VIEW MODEL

//
//  NavStackViewModel.swift
//  MScoots
//
//  Created by Justin Trubela on 4/27/23.
//
//  Controls the
//



//class NavigationStackViewModel: ObservableObject {
//    //Create an instance of the NavStack Path ViewModifier as
//    //  needed to have/ the views update upon login
//    @Published var NavPath = [AnyView]()
//
////    let dbStore = FirebaseManager.shared
////
//    //call the function to get the data the items to the NavStack
//    //if the user isStudent
//    //initialize all student Views
//    //initalize the views,
////    func addViewsOnStack(){
////
////
////    }
////
////    enum viewNames {
////        case WalletView;
////        case UserHomeView;
////        case UserProfile_SettingsView;
////        case UserView;
////        case Scoot_ReserveView;
////        case Scoot_MapView;
////        case Scoot_MyScootsView;
////        case Scoot_LotViews;
////        case Scoot_ListView;
////        case Scoot_CheckoutView;
////        case Scoot_CheckoutConfirmMessageSheet;
////        case ScanQRView;
////        case RegistrationView;
////        case LandingPageView;
////        case ScooterManagerView;
////        case UserManagerView;
////        case AdminUserHomeView
//
//        //
//        //  NavStackViewModel.swift
//        //  MScoots
//        //
//        //  Created by Justin Trubela on 4/27/23.
//        //
//        //  Controls the
//        //
////
////        class NavigationStackViewModel: ObservableObject {
////            //Create an instance of the NavStack Path ViewModifier as
////            //  needed to have/ the views update upon login
////            @Published var NavPath = [AnyView]()
////
////            let dbStore = FirebaseManager.shared
//
//            //call the function to get the data the items to the NavStack
//            //if the user isStudent
//            //initialize all student Views
//            //initalize the views,
//            //TODO:
//            //            func addViewsOnStack(View){
//            //            }
//
//
//
//            //TODO: have the user get authorized and use this ViewModel
//            //      to get and set the req'd db navStacks
////            var DBStore: Bool = {
////                //computed property
////                return false
////            }()
////            var DBAuth: Bool = {
////                return false
////            }()
////
////            var getFirestoreVM = FirebaseManager.shared.firestore
////            var getDBAuthVM = FirebaseManager.shared.auth
////            //TEST:
////
////            //TODO: Add the users information taken from ScooterLocation?
////            //Maybe if "Local Storage" - have to redesign the studentUser
////            @Binding var UserAuththorization: Bool
////            @State var getAuthDatabaseVM = {
////                if let user = Auth.auth().currentUser {
////                    let email = user.email
////                }
////
//
//
//
//
//                //----------------------------------------------------------------------------------------------------------
//
//                //  TODO: input logic function for adding the called NavLink item used in Admin/User Views to output
//                //      back the necessary ID Get information about studentStatus/adminStatus about the user
//                //
//                //if the (user?) -> NavPath    //*---REGISTER/LOGINSuccessful---*/  /*--RENT SCOOTER---*/
//                //----------------------------------------------------------------------------------------------------------| |
//                //MARK:                                                                                                    //  \
//                //*////////////////////////////// --LOGIC RELATED VARIABLES-- //////////////////////////////////\/*/    \
//                //                                 Test the users access                                           //       \
//                //      The user client contacts database LG/SU and if an auth is presented to the system          //         \
//                //-------------------------------------------------------------------------------------------------//           \
//                //---------------------------------------------------------------------------------------------------=============}
//                //                                                                                                                |
//                //                                                                                                                |
//                //                                                                                                                |
//                //                                                                                                                |
//                //                                                                                                                |
//                // Property Wrapper }-----------------------------------------------------------------------------------------//////////}
//
//                //TODO: Add logic to share to and from db and amongst the users
//                //update the view in the local state to the navigationstack path variable
//                //more than likely .onAsync{ some code }
//
//
//
//
//                //private var selectedViewIndex: Int?
//                //stil keeping available untilwe decide
//                //on how to iterate through
//                //var selectedView: AnyView? {
////                func addViewsOnStack(){
//                    //initialize screens for AppUseers: Students,Admins and
//
//
//
//
//
//
//
//                    //Navigation Struct based navigation
////                    struct AppUser : Identifiable {
////                        //not sure if this does it but I found it
////                        //var isAn_Student: Firebase.Firestore.Firebase_Authorization.isUser?;
////                        //value to ship off to other user-states that require it conform to
////                        //  Hashable and Identifiable
////                        var id: UUID
////                        var CWID: Int
////                        var email: String?
////                        var isAStudent : Bool?}
////
////                    }
////                    extension accountInfo   {
////                        self .if = UUID()
////                            self.email: String?,
////                            self.displayName: String?
////
////                            init() {
////                                var email: String?
////                                var displayName: String
////                            }
////                    }
////
////
////                    init() {
////                        self.id = UUID()
////                        self.email = authData.email
////                        self.photoURL = photoURL
////                        self.displayName = authData.displayName
////                    }
////                }
////
////                init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
////                    self.id = id
////                    self.title = title
////                    self.attendees = attendees.map { Attendee(name: $0) }
////                    self.lengthInMinutes = lengthInMinutes
////                    self.theme = theme
////                }
////            }
//
//
//            //private var selectedViewIndex: Int?
//
//            //var selectedView: AnyView? {
//            //create a scooter object so that the user can find them
//            //  rent/return, admin can add and delete items
////            struct Scooter: Identifiable {
////                //conform the object to Identifiable so that we can do a thorough search for
////                // and have complete control over the scooter objects
////                var id = NSUUID().uuidString
////                //location is shown to the user when looking for scoothers to rent
////                //admin will have the option to change and update these locations
////                var location: String
////                //this variable determines if the scooter is ready for the user to come and get it
////                //checks against battery status, any support/service tickets have been submitted,
////                //and if its in the general vecinity
////                var isAvailable: String
////                //shows the user the battery status for the scooter
////                var battery: String
////                //unused
////                var nearestCharger: String
////                var currentUser: studentUser? = nil
////
////
////                init(id: UUID = UUID(), location: String, isAvailable: String,
////                     battery: String, nearestCharger: String, currentUser: studentUser? = nil) {
////                    self.id = UUID().uuidString
////                    self.location = location
////                    self.isAvailable = isAvailable
////                    self.battery = battery
////                    self.nearestCharger = nearestCharger
////                    self.currentUser = currentUser
////
////                }
//////                extension scooterInfo: Scooter {
//////                    var scooterQRIdentifier: String
//////                    var availScooters: [Scooter?]
//////                    var model: String?
//////                    var Serial: String?
//////                    var color: theme
//////                    {
//////
//////                        //TODO:
//////                        enum Theme: String {
//////                            case green
//////                            case blue
//////                            case red
//////                            case orange
//////                            case black
//////                            case purple
//////                            case gray
//////                            case yellow
//////                        }
//////                    }
//////                    var mainColor: Color {
//////                        Color(rawValue)
//////                    }
//////                    var name: String {
//////                        rawValue.capitalized
//////                    }
//////
////
//////
//////
//////
//////                    init(id: UUID = UUID(), location: String, availableScooters: [String], lengthInMinutes: Int, theme: accentColor) {
//////                        self.id = UUID().uuidString
//////                        self.location = location
//////                        self.availableScooters[availableScooters] = attendees.map { Attendee(name: $0) }
//////                        self.lengthInMinutes = lengthInMinutes
//////                        self.theme = theme
//////                    }
//////                }
//////                var accentColor: Color {
//////                    switch self {
//////                        case .orange:
//////                        case .red:
//////                        case .green:
//////                        case .yellow:
//////                        case .black:
//////                        case .gray:
//////                        case .blue:
//////                        case .purple:
//////                        case .brown:
//////                        default: .red:
//////                    }
//////                }
//////                var mainColor: Color {
//////                    Color(accentColr)
//////                }
//////                var name: String {
//////                    rawValue.capitalized
//////                }
//////            }
////
////
////
//////        var getFirestoreVM = FirebaseManager.shared.firestore
//////        var getDBAuthVM = FirebaseManager.shared.auth
//////        //TEST:
//////
//////        //TODO: Add the users information taken from ScooterLocation?
//////        //Maybe if "Local Storage" - have to redesign the studentUser
//////        @Binding var UserAuththorization: Bool
//////        @State private var getAuthDatabaseVM = {
//////            if let user = Auth.auth().currentUser {
//////                let email = user.email
//////            }
//////
//////            @State var getdbAuthorization = Firebase_Firestore.firestore
////
////
////
////
////            //----------------------------------------------------------------------------------------------------------
////
////            //  TODO: input logic function for adding the called NavLink item used in Admin/User Views to output
////            //      back the necessary ID Get information about studentStatus/adminStatus about the user
////            //
////            //if the (user?) -> NavPath    //*---REGISTER/LOGINSuccessful---*/  /*--RENT SCOOTER---*/
////            //----------------------------------------------------------------------------------------------------------| |
////            //MARK:                                                                                                    //  \
////            //*////////////////////////////// --LOGIC RELATED VARIABLES-- //////////////////////////////////\/*/    \
////            //                                 Test the users access                                           //       \
////            //      The user client contacts database LG/SU and if an auth is presented to the system          //         \
////            //-------------------------------------------------------------------------------------------------//           \
////            //---------------------------------------------------------------------------------------------------=============}
////            //                                                                                                                |
////            //                                                                                                                |
////            //                                                                                                                |
////            //                                                                                                                |
////            //                                                                                                                |
////            // Property Wrapper }-----------------------------------------------------------------------------------------//////////}
////
////            //TODO: Add logic to share to and from db and amongst the users
////            //update the view in the local state to the navigationstack path variable
////            //more than likely .onAsync{ some code }
////
////
////
////
////            //private var selectedViewIndex: Int?
////            //stil keeping available untilwe decide
////            //on how to iterate through
////            //var selectedView: AnyView? {
//////            func addViewsOnStack(){
////                //initialize screens for AppUseers: Students,Admins and
////
////
////
////
////
////
////
//////                //Navigation Struct based navigation
//////                struct AppUser : Identifiable {
//////                    //not sure if this does it but I found it
//////                    //var isAn_Student: Firebase.Firestore.Firebase_Authorization.isUser?;
//////                    //value to ship off to other user-states that require it conform to
//////                    //  Hashable and Identifiable
//////                    var id: UUID
//////                    var CWID: Int
//////                    var email: String?
//////                    var isAStudent : Bool?
//////
//////                }
//////                extension accountInfo: AppUser   {
//////                    self.id = UUID()
//////                    self.email: String?,
//////                    self.displayName: String?
//////
//////
//////
//////                    init{
//////                        self.id = UUID()
//////                        self.email = authData.email
//////                        self.photoURL = photoURL
//////                        self.displayName = authData.displayName
//////                    }
//////                }
//////            }
////
//////            init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
//////                self.id = id
//////                self.title = title
//////                self.attendees = attendees.map { Attendee(name: $0) }
//////                self.lengthInMinutes = lengthInMinutes
//////                self.theme = theme
//////            }
//////        }
////        //    extension DailyScrum {
////
////
////
////
////
////        //        struct Attendee: Identifiable {
////        //            let id: UUID
////        //            var name: String
////        //
////        //            init(id: UUID = UUID(), name: String) {
////        //                self.id = id
////        //                self.name = name
////        //            }
////        //        }
////        //    }
////
////
////
////        //    extension DailyScrum {
////        //        static let sampleData: [DailyScrum] =
////        //        [
////        //            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
////        //            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
////        //            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
////        //        ]
////        //    }
////        //
////
////
////        //func addViewsOnStack(View){
////        //    .init([])
////        //
////        //}
////
////
////        //private var selectedViewIndex: Int?
////
////        //var selectedView: AnyView? {
////        //create a scooter object so that the user can find them
////        //  rent/return, admin can add and delete items
//////        struct Scooter: Identifiable {
//////            //conform the object to Identifiable so that we can do a thorough search for
//////            // and have complete control over the scooter objects
//////            var id = NSUUID().uuidString
//////            //location is shown to the user when looking for scoothers to rent
//////            //admin will have the option to change and update these locations
//////            var location: String
//////            //this variable determines if the scooter is ready for the user to come and get it
//////            //checks against battery status, any support/service tickets have been submitted,
//////            //and if its in the general vecinity
//////            var isAvailable: String
//////            //shows the user the battery status for the scooter
//////            var battery: String
//////            //unused
//////            var nearestCharger: String
//////            var currentUser: studentUser? = nil
//////
//////
//////            init(id: UUID = UUID(), location: String, isAvailable: String,
//////                 battery: String, nearestCharger: String, currentUser: studentUser? = nil) {
//////                self.id = UUID().uuidString
//////                self.location = location
//////                self.isAvailable = isAvailable
//////                self.battery = battery
//////                self.nearestCharger = nearestCharger
//////                self.currentUser = currentUser
//////            }
//////
//////
//////            struct scooterDetails: Identifiable {
//////
//////                var scooterQRIdentifier: String
//////                var availScooters: [Scooter?]
//////                var model: String?
//////                var Serial: String?
//////                var color: MyColor
//////            }
//////                {
//////
//////                    //TODO:
//////
//////
//////                init(id: UUID = UUID(), location: String, availableScooters: [String], lengthInMinutes: Int, theme: accentColor) {
//////                    self.id = UUID().uuidString
//////                    self.location = location
//////                    self.availableScooters[availableScooters] = attendees.map { Attendee(name: $0) }
//////                    self.lengthInMinutes = lengthInMinutes
//////                    self.theme = theme
//////                }
//////            }
//////
//////            //MARK Color picker Enum
//////        //ADD it to the Map scooter charging station
//////            enum MyColor: String {
//////                case orange
//////                case red
//////                case green
//////                case yellow
//////                case black
//////                case gray
//////                case blue
//////                case purple
//////                case brown
//////
//////                var accentColor: Color {
//////                    switch self {
//////                        case .orange:
//////                            return Color.orange
//////                        case .red:
//////                            return Color.red
//////                        case .green:
//////                            return Color.green
//////                        case .yellow:
//////                            return Color.yellow
//////                        case .black:
//////                            return Color.black
//////                        case .gray:
//////                            return Color.gray
//////                        case .blue:
//////                            return Color.blue
//////                        case .purple:
//////                            return Color.purple
//////                        case .brown:
//////                            return Color.brown
//////                        default:
//////                            return Color.red
//////                    }
//////                }
//////
//////                var mainColor: Color {
//////                    Color(accentColor)
//////                }
//////
//////                var name: String {
//////                    rawValue.capitalized
//////                }
//////            }
//////        }
////
////    }
//
//}




//MARK: USER HOME TOOLBAR


//                .toolbar {
//                    ToolbarItem(placement: .bottomBar) {
//                        HStack{
//
//                            //QR Code toolbar button
//                            Section{
//                                NavigationLink(destination: ScanQRView(),
//                                               label: {
//                                    ZStack{
//                                        Image(systemName: "qrcode")
//                                            .resizable()
//                                            .frame(width: 30, height: 30, alignment: .center)
//                                            .scaledToFit()
//                                            .foregroundColor(.white)
//                                        Image(systemName: "circle")
//                                            .font(.system(size: 50))
//                                    }.frame(width: 100, height: 100, alignment: .center)
//                                }
//                                )
//                            }
//                            //MyScootView toolbar button
//                            Section{
//
//                                NavigationLink(destination: Scoot_MyScootsView(),
//                                               label: {
//                                    ZStack{
//                                        Image(systemName: "circle")
//                                            .font(.system(size: 70))
//                                            .foregroundColor(.blue)
//
//                                        Image("scooter")
//                                            .resizable()
//                                            .frame(width: 60, height: 60, alignment: .center)
//                                            .scaledToFit()
////                                            .colorMultiply(.white)
//
//
//                                    }
//                                }
//                                )
//                            }.frame(width: 100, height: 100, alignment: .center)
//                            //ScooterList toolbar Button
//                            Section{
//                                NavigationLink(destination: Scoot_ListView(),
//                                               label: {
//                                    ZStack {
//                                        Image(systemName: "list.triangle")
//                                            .resizable()
//                                            .frame(width: 30, height: 30, alignment: .center)
//
//                                            .scaledToFit()
//                                            .foregroundColor(.white)
//                                        Image(systemName: "circle")
//                                            .font(.system(size: 50))
//                                    }
//                                }
//                                )
//                            }
//                        }
//                        .frame(width: UIScreen.main.bounds.width , height: 160, alignment: .center)
//
//                        .padding(.bottom, 75)
//                        .background(Color.secondary)
//
//                    }
//                }




//Model:
//- Properties: Define the properties that represent the data of the model
//- Initialization: Define the initialization logic for the model, such as an initializer method or a convenience init
//- Methods: Define any methods that operate on the data of the model, such as CRUD operations or other custom logic
//- Conformance: Ensure that the model conforms to any relevant protocols or standards, such as Codable or Equatable









//View:
//   - Layout: Define the layout and appearance of the view, including any constraints or UI elements
//   - Initialization: Define the initialization logic for the view, such as an initializer method or a convenience  init
//   - Data Binding: Bind the view to the ViewModel to display the appropriate data and respond to user actions
//   - Lifecycle: Implement any necessary lifecycle methods for the view, such as viewDidLoad or viewWillDisappear











//ViewModel:
//- Properties: Define the properties that represent the state of the ViewModel, such as the data to be displayed or the user's input
//- Initialization: Define the initialization logic for the ViewModel, such as an initializer method or a convenience init
//- Methods: Define any methods that operate on the data of the ViewModel, such as fetching data from a server or updating the state based on user input
//- Data Binding: Bind the ViewModel to the View to update the UI based on changes in state
//- Conformance: Ensure that the ViewModel conforms to any relevant protocols or standards, such as ObservableObject or Combine



//MARK: Model

//Model:
//- User
//    - userID: Int
//    - firstName: String
//    - lastName: String
//    - email: String
//    - password: String
//    - profilePicture: Image
//    - isVerified: Bool
//



//*MARK: View:
//- AuthenticationViewModel
//    - signUp(firstName: String, lastName: String, email:    String, password: String) -> Bool
//    - signIn(email: String, password: String) -> Bool
//    - UserViewModel
//    - currentUser: User
//    - fetchCurrentUser() -> Void
//    - updateProfilePicture(image: Image) -> Bool
//    - updateIsVerified(isVerified: Bool) -> Bool


//import SwiftUI
//import CoreLocation

// The UserManagerView allows the user to see all the stored information in the studentUser and scooter Firestore databases.
// This view needs to be integrated into the main views for the admin to manage users/scooters and allow the user to store any information that should/could be updated by the user.





//!!!:
//import SwiftUI
// <M> Represents a Model for a decoder that is responsible for fetching and decoding JSON data.
//class JsonDecoder: ObservableObject {
//
//    // <VM> Observed in the ViewModel, contains the list of users retrieved from the API.
//    @Published var users: [studentUser] = []
//
//    // <VM> Modifies the given Model data and performs a network request to retrieve JSON data from the given URL.
//    func getUsers(from url: String) {
//
//        // <V> Check if the URL is valid and create a URLRequest from it.
//        guard let url = URL(string: url) else { fatalError("Invalid URL") }
//        let urlRequest = URLRequest(url: url)
//
//        // <V> Start a URLSessionDataTask to retrieve the JSON data from the API.
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//
//            // <V> Handle any errors that may occur during the network request.
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//
//            // <V> Ensure that the response received is of type HTTPURLResponse.
//            guard let response = response as? HTTPURLResponse else { return }
//
//            // <V> If the response status code indicates success, decode the JSON data and update the user list.
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUsers = try JSONDecoder().decode([studentUser].self, from: data)
//                        self.users = decodedUsers
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//
//        // <V> Start the data task.
//        dataTask.resume()
//    }
//}





//MARK: REGISTRATION




/*
 //
 //    @State var passwordLength = Firebase_Authorization().passwordLength
 //    var checkPasswordLength: Bool {
 //        if password.count >= 8{
 //            passwordLength.toggle()
 //            return true
 //        }
 //        else{
 //            return false
 //        }
 //
 //    }
 //
 //    @State var passwordContainsUCLet = Firebase_Authorization().passwordContainsUCLet
 //
 //    var containsUpperCase: Bool {
 //        if model.containsUppercaseLetter(input: password) {
 //            return true
 //
 //        }else{
 //            return false
 //        }
 //    }
 //
 //    @State var passwordContainsLCLet = Firebase_Authorization().passwordContainsUCLet
 //    var containsLowerCase: Bool {
 //        if model.containsLowercaseLetter(input: password) {
 //            return true
 //
 //        }else{
 //            return false
 //        }
 //    }
 //
 //    @State var passwordContainsDigit = Firebase_Authorization().passwordContainsDigit
 //    var containsDigit: Bool {
 //        if model.containsDigit(input: password) {
 //            return true
 //
 //        }else{
 //            return false
 //        }
 //    }
 //
 //    @State var passwordContainsSC = Firebase_Authorization().passwordContainsSC
 //    var containsSC: Bool {
 //        if model.containsSC (input: password) {
 //            return true
 //        }else{
 //            return false
 //        }
 //    }
 //
 //    @State var passwordsMatch = Firebase_Authorization().passwordsMatch
 //
 //
 //    @State var isRegisterd = Firebase_Authorization().isRegisterd
 //    var getRegistrationStatus: Bool {
 //        if model.isRegistered {
 //            isShowingAlert.toggle()
 //            isRegisterd = true
 //            return true
 //        }
 //        else {
 //            return false
 //        }
 //    }
 //    @State var isShowingErrorAlert = Firebase_Authorization().isShowingAlert
 //
 //    @State var isShowingAlert = Firebase_Authorization().isShowingAlert
 //    var isNotRegistered: Bool {
 //        if model.unsuccessfulRegistration{
 //            model.unsuccessfulRegistration = !model.unsuccessfulRegistration
 //            isShowingAlert.toggle()
 //            return true
 //        }
 //        else {
 //            isRegisterd.toggle()
 //            return false
 //        }
 //    }
 //
 //
 //
 
 */




//
//  utilityStyling.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//
//
//  The purpose for this file is to create a standardized way to add custom modifiers to achieve a uniform
//      output for items used throughout the projects
//
//
//  For modifying elements for view content items you need to establish the following:
//      an extension of View that returns some view
//      a struct that uses that returned view
//

//import Foundation






/*-->Start
 
 
 
 /*-----------------------------------------------------------------------------------------------------/
  //View Items                View Items                 View Items                     View Items
  //                     View Items                                             View Items
  //     View Items        View Items      View Items         View Items                 View Items
  //             View Items               View Items                        View Items
  //    View Items         View Items         View Items         View Items         Views/Scenes
  /------------------------------------------------------------------------------------------------------*/
 
 
 
 
 
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
 
 
 
 /*------------------------------------------------------------------------------------------------------/
  //Objects                              Objects                 Objects                     Objects
  //                     Objects                                             Objects
  //     Objects            Objects              Objects         Objects                 Objects
  //             Objects               Objects                                Objects
  //    Objects         Objects         Objects         Objects         Objects                  Objects
  /------------------------------------------------------------------------------------------------------*/
 
 
 //Used
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
 
 
 -->End*/


















/*-->Start
 
 
 /*------------------------------------------------------------------------------------------------------/
  //Buttons                              Buttons                 Buttons                     Buttons
  //                     Buttons                                             Buttons
  //     Buttons            Buttons              Buttons         Buttons                 Buttons
  //             Buttons               Buttons                                Buttons
  //    Buttons         Buttons         Buttons         Buttons         Buttons                  Buttons
  /------------------------------------------------------------------------------------------------------*/
 
 
 
 
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
 
 
 
 struct ScooterMGRButton: View{
 
 var body: some View {
 VStack {
 Image(systemName: "scooter")
 .font(.system(size: 90))
 Text("Scooter Manager!")
 .foregroundColor(.black)
 }
 .frame(width: 180, height: 200)
 }
 }
 
 struct UserMGRButton: View{
 
 var body: some View {
 ZStack{
 VStack{
 Image(systemName: "person.crop.circle.fill.badge.checkmark")
 .font(.system(size: 90))
 Text("UserManager")
 .foregroundColor(.black)
 }.frame(width: 180, height: 200)
 }
 }
 }
 
 
 
 
 
 
 //HamburgerMenu
 struct HamburgerMenu: View {
 var body: some View {
 Image(systemName: "line.3.horizontal")
 .MyHambugerMenuStyler()
 }
 }
 //HamburgerStyler
 struct HamburgerMenuStyler: ViewModifier {
 func body(content: Content) -> some View {
 content
 .scaleEffect(x: 2, y: 3)
 .shadow(color: .black, radius: 8, x: 9, y: 7)
 .foregroundColor(.white)
 .font(.system(size: 25))
 .padding(.trailing,25)
 }
 }
 extension View {
 func MyHambugerMenuStyler() -> some View {
 modifier (HamburgerMenuStyler())
 }
 }
 
 
 //Home
 struct HomeButton: View {
 var body: some View {
 HStack{
 Image(systemName: "house.fill")
 Text("Home")
 }
 .font(.system(size: 30))
 .buttonStyle(.bordered)
 }
 }
 
 //Scooter
 struct ScooterButton: View {
 var body: some View {
 HStack{
 Image(systemName: "scooter")
 Text("My Scooter").underline()
 }
 .font(.system(size: 30))
 .buttonStyle(.bordered)
 }
 }
 //
 
 //Wallet
 struct WalletButton: View {
 var body: some View {
 HStack{
 Image(systemName: "creditcard.fill")
 Text("My Wallet").underline()
 }
 .font(.system(size: 30))
 }
 }
 
 
 -->End*/





/*-->Start
 /*-----------------------------------------------------------------------------------------------------/
  //Backgrounds                Backgrounds                 Backgrounds                     Backgrounds
  //                     Backgrounds                                             Backgrounds
  //     Backgrounds        Backgrounds      Backgrounds         Backgrounds                 Backgrounds
  //             Backgrounds               Backgrounds                        Backgrounds
  //    Backgrounds         Backgrounds         Backgrounds         Backgrounds         Backgrounds
  /------------------------------------------------------------------------------------------------------*/
 
 
 //used
 struct scootCheckoutBackground: ViewModifier {
 func body(content: Content) -> some View {
 content
 .frame(width: 350, height: 500)
 .background(.thickMaterial)
 .background(Color.secondary)
 .clipShape(RoundedRectangle(cornerRadius: 10))
 .padding(5)
 }
 }
 extension View {
 func makeScootCheckoutBackground() -> some View {
 modifier(scootCheckoutBackground())
 }
 }
 
 struct scootHistoryBackground: ViewModifier {
 func body(content: Content) -> some View {
 content
 .frame(maxWidth: UIScreen.main.bounds.width-50, maxHeight: 200)
 .background(.thinMaterial)
 .clipShape(RoundedRectangle(cornerRadius: 20))
 .padding(5)
 }
 }
 
 extension View {
 func MakeScootHistoryBackground() -> some View {
 modifier(scootHistoryBackground())
 }
 }
 
 
 // Define a new view called `MyLinearGradientView`
 struct MyLinearGradientView: View {
 
 // The body of the view - this is where we define the content of the view
 var body: some View {
 
 // Create a linear gradient with a gradient from black to white
 // The gradient starts at the top left corner of the view and ends at the bottom right corner
 LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
 
 // Ignore the safe area insets of the device
 .ignoresSafeArea()
 }
 }
 
 -->End*/









/*------------------------------------------------------------------------------------------------------/
 //Images                              Images                 Images                     Images
 //                     Images                                             Images
 //     Images            Images              Images         Images                 Images
 //             Images               Images                                Images
 //    Images         Images         Images         Images         Images                  Images
 /------------------------------------------------------------------------------------------------------*/






/*-->Start
 
 
 /*-----------------------------------------------------------------------------------------------------/
  //TextObjects                TextObjects                 TextObjects                     TextObjects
  //                     TextObjects                                             TextObjects
  //     TextObjects        TextObjects      TextObjects         TextObjects                 TextObjects
  //             TextObjects               TextObjects                        TextObjects
  //    TextObjects         TextObjects         TextObjects         TextObjects         TextObjects
  /------------------------------------------------------------------------------------------------------*/
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
 
 
 struct VerticalTextboxEntryField: ViewModifier {
 func body(content: Content) -> some View {
 content
 
 .lineLimit(5...10)
 .frame(minWidth: 100, maxWidth: 350, minHeight: 100, maxHeight: .infinity, alignment: .topLeading).padding(20)
 
 .background(Color.white)
 .clipShape(RoundedRectangle(cornerRadius: 20))
 .font(.title2)
 .textFieldStyle(.plain)
 .padding(10)
 }
 }
 extension View {
 func AddVerticalTextboxFieldEntry() -> some View {
 modifier(VerticalTextboxEntryField())
 }
 }
 
 -->End*/




















/*-----------------------------------------------------------------------------------------------------/
 //Views/Scenes                Views/Scenes                 Views/Scenes                     Views/Scenes
 //                     Views/Scenes                                             Views/Scenes
 //     Views/Scenes        Views/Scenes      Views/Scenes         Views/Scenes                 Views/Scenes
 //             Views/Scenes               Views/Scenes                        Views/Scenes
 //    Views/Scenes         Views/Scenes         Views/Scenes         Views/Scenes         Views/Scenes
 /------------------------------------------------------------------------------------------------------*/
//UserView - NavigationStack

//
//  UserViews.swift
//  MScoots
//
//  Created by Justin Trubela on 4/24/23.
//

//    import SwiftUI
//import Foundation
//import UIKit

//    struct UserViews: View{
//        //ViewItem is shown to the NavStack for to navigate to view
//        struct ViewItem: Identifiable, Hashable {
//            let name: String
//            let id = NSUUID().uuidString
//        }
//
//            //update the view to the navigationstack path variable
//            func ShowViewForItem(view: ViewItem) -> AnyView {
//                switch view.name {
//                    case "WalletView":
//                        return AnyView(WalletView())
//                    case "UserHomeView":
//                        return AnyView(UserHomeView())
//                    case "UserProfile_SettingsView":
//                        return AnyView(UserProfile_SettingsView())
//                    case "UserView":
//                        return AnyView(UserView())
//
//
//                    case "Scoot_ReserveView":
//                        return AnyView(Scoot_ReserveView())
//                    case "Scoot_MapView":
//                        return AnyView(Scoot_MapView())
//                    case "Scoot_MyScootsView":
//                        return AnyView(Scoot_MyScootsView())
//                    case "Scoot_LotViews":
//                        return AnyView(Scoot_LotViews())
//                    case "Scoot_ListView":
//                        return AnyView(Scoot_ListView())
//                    case "Scoot_CheckoutView":
//                        return AnyView(Scoot_CheckoutView())
//                    case "Scoot_CheckoutConfirmMessageSheet":
//                        return AnyView(Scoot_CheckoutConfirmMessageSheet())
//
//                    case "ScanQRView":
//                        return AnyView(ScanQRView())
//                    case "RegistrationView":
//                        return AnyView(RegistrationView())
//                    case "LandingPageView":
//                        return AnyView(LandingPageView())
//                    case "AdminUserHomeView":
//                        return AnyView(AdminUserHomeView())
//                    case "ScooterManagerView":
//                        return AnyView(ScooterManagerView())
//                    case "UserManagerView":
//                        return AnyView(UserManagerView())
//
//                    default:
//                        return AnyView(UserView())
//                }
//            }
//        //DropDown View List items
//            //value to case-switch for value user choses
//            @State private var UserViews_value = ""
//            //value to show on UI Element to show user what to do
//            private var UserViews_placeholder = "Select View"
//            //drop down list array items for user to choose from
//            private var UserViews_dropDownList =
//        [
//                 "WalletView",
//                 "UserProfile_SettingsView",
//                 "UserHomeView",
//                 "UserView",
//
//                 "Scoot_ReserveView",
//                 "Scoot_MapView",
//                 "Scoot_MyScootsView",
//                 "Scoot_LotViews",
//                 "Scoot_ListView",
//                 "Scoot_CheckoutView",
//                 "Scoot_CheckoutFinalView",
//                 "Scoot_CheckoutConfirmMessageSheet",
//
//                 "ScanQRView",
//                 "RegistrationView",
//                 "LoadingPageView",
//                 "LandingPageView",
//
//                 "ScooterManagerView",
//                 "UserManagerView",
//                 "AdminUserHomeView",
//        ]
//
//        //Array to hold the viewItems
//        let views: [ViewItem] =
//        [
//            .init(name: "WalletView"),
//            .init(name: "UserHomeView"),
//            .init(name: "UserProfile_SettingsView"),
//            .init(name: "UserView"),
//
//            .init(name: "Scoot_ReserveView"),
//            .init(name: "Scoot_MapView"),
//            .init(name: "Scoot_MyScootsView"),
//            .init(name: "Scoot_LotViews"),
//            .init(name: "Scoot_ListView"),
//            .init(name: "Scoot_CheckoutView"),
//            .init(name: "Scoot_CheckoutFinalView"),
//            .init(name: "Scoot_CheckoutConfirmMessageSheet"),
//
//            .init(name: "ScanQRView"),
//            .init(name: "RegistrationView"),
//            .init(name: "LoadingPageView"),
//            .init(name: "LandingPageView"),
//
//            .init(name: "ScooterManagerView"),
//            .init(name: "UserManagerView"),
//            .init(name: "AdminUserHomeView"),
//
//        ]

//        //ScenePhase monitors application state
//        /*The scenePhase is an instance of the ScenePhase enum, which represents the current phase of the app's lifecycle for a particular scene, such as active, inactive, or background. This property wrapper enables the view to automatically update and recompute whenever the value of scenePhase changes.
//
//        By using @Environment(\.scenePhase), you can observe changes to the app's scene phase and respond accordingly in your view. For example, you can use it to perform actions when the app transitions between active, inactive, and background states, such as saving data or updating the user interface.
//         */
//        @Environment(\.scenePhase) private var scenePhase
//
//        //NavigationStack Array
//        @State private var NavigationPath = [ViewItem]()
//
//        //List of Stack Array View Struct
//        @State private var NavigationPathText = ""
//
//        //Navigation View Title
//        @State private var NavBarTitle = "UserView"
//
//
//        var body: some View{
//            //NavStack uses an array of views to navigate to
//            NavigationStack(path: $NavigationPath){
//                ZStack{
//                    //NavStack modifier
//                    Section{
//                        //View Elements
//                        VStack{
//                                //Drop Down
//                            HStack{
//                                Menu {
//                                        // dropDownList
//                                    ForEach(UserViews_dropDownList, id: \.self){ view in
//                                        Button(view) {
//                                            self.UserViews_value = view
//                                            NavigationPathText = view
//                                        }
//                                    }
//                                } label: {
//                                    VStack{
//                                            //Drop Down View Stack
//                                            //Text and Chevron button
//                                        HStack{
//                                                //DropDown Text
//                                            Section{
//                                                VStack{
//                                                    Text(UserViews_value.isEmpty ? UserViews_placeholder : UserViews_value)
//                                                        .foregroundColor(.black)
//                                                    Rectangle()
//                                                        .fill(Color.gray)
//                                                        .frame(height: 2)
//                                                }
//                                            }
//                                                //Drop Down List button chevron
//                                            Section{
//                                                Image(systemName: "chevron.down")
//                                                    .foregroundColor(Color.blue)
//                                                    .font(Font.system(size: 20, weight: .bold))
//                                            }
//                                        }
//                                    }
//                                    .padding()
//                                    .padding(.horizontal)
//
//                                    .frame(width: 410, height: 50, alignment: .center)
//                                    .background(Color.gray)
//                                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                                    .opacity(0.8)
//
//                                }
//                            }
//                        }
//                        //NavItems
//                        .navigationTitle(NavBarTitle)
//                        .navigationBarTitleDisplayMode(.inline)
//                    }
//                }
//                //NavDestination - For ViewItem
//                .navigationDestination(for: ViewItem.self) {      view in
//                    ShowViewForItem(view: view)
//                }
//                //toolbar
//                .toolbar {
//                    ToolbarItem(placement: .bottomBar) {
//                        HStack{
//                            // dropDownList
//                            Section{
//                                Menu {
//                                    ForEach(UserViews_dropDownList, id: \.self){ view in
//                                        Button(view) {
//                                            self.UserViews_value = view
//                                            NavigationPathText = view
//                                        }
//                                    }
//                                } label: {
//                                    VStack{
//                                        HStack{
//                                            Text(UserViews_value.isEmpty ? UserViews_placeholder : UserViews_value)
//                                                .foregroundColor(UserViews_value.isEmpty ? .gray : .black)
//                                            Spacer()
//                                                //dropDownList button
//                                            Image(systemName: "chevron.down")
//                                                .foregroundColor(Color.blue)
//                                                .font(Font.system(size: 20, weight: .bold))
//                                        }
//                                        .padding(.horizontal)
//                                        Rectangle()
//                                            .fill(Color.gray)
//                                            .frame(height: 2)
//                                    }
//                                }
//                                Button{}label:{
//                                    NavigationLink("Go", value: ViewItem(name:  NavigationPathText)).padding(.trailing, 20).buttonStyle(.bordered)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }

//    struct UserViews_Previews: PreviewProvider {
//        static var previews: some View {
//            UserViews()
//        }
//    }








/*------------------------------------------------------------------------------------------------------/
 //                 NAVIGATIONSTACK VIEW MODEL            NAVIGATIONSTACK VIEW MODEL
 //
 //      NAVIGATIONSTACK VIEW MODEL     NAVIGATIONSTACK VIEW MODEL     NAVIGATIONSTACK VIEW MODEL
 //
 //    NAVIGATIONSTACK VIEW MODEL         NAVIGATIONSTACK VIEW MODEL         NAVIGATIONSTACK VIEW MODEL                                    Ob
 /------------------------------------------------------------------------------------------------------*/






//
//    //ViewItem is shown to the NavStack for to navigate to view
//    struct ViewItem: Identifiable, Hashable {
//        let name: String
//        let id = NSUUID().uuidString
//    }
//        //update the view to the navigationstack path variable
//    func ShowViewForItem(view: ViewItem) -> AnyView {
//        switch view.name {
//            case "WalletView":
//                return AnyView(WalletView())
//            case "UserHomeView":
//                return AnyView(UserHomeView())
//            case "UserProfile_SettingsView":
//                return AnyView(UserProfile_SettingsView())
//            case "UserView":
//                print("USERVIEW initiated")
//                return AnyView(UserView())
//            case "Scoot_ReserveView":
//                return AnyView(Scoot_ReserveView())
//            case "Scoot_MapView":
//                return AnyView(Scoot_MapView())
//            case "Scoot_MyScootsView":
//                return AnyView(Scoot_MyScootsView())
//            case "Scoot_LotViews":
//                return AnyView(Scoot_LotViews())
//            case "Scoot_ListView":
//                return AnyView(Scoot_ListView())
//            case "Scoot_CheckoutView":
//                return AnyView(Scoot_CheckoutView())
////            case "Scoot_CheckoutFinalView":
////                return AnyView(Scoot_CheckoutFinalView())
//            case "Scoot_CheckoutConfirmMessageSheet":
//                return AnyView(Scoot_CheckoutConfirmMessageSheet())
//            case "ScanQRView":
//                return AnyView(ScanQRView())
//            case "RegistrationView":
//                return AnyView(RegistrationView())
//            case "LandingPageView":
//                return AnyView(LandingPageView())
//
//            default:
//                return AnyView(UserView())
//        }
//    }
//        //DropDown View List items
//            //value to case-switch for value user choses
//            @State private var HamburgerItem_value = ""
//        //Array to hold the viewItems
//        //Alphabatized
//        let views: [ViewItem] =
//        [
//            .init(name: "WalletView"),
//            .init(name: "UserHomeView"),
//            .init(name: "UserProfile_SettingsView"),
//            .init(name: "UserView"),
//            .init(name: "Scoot_ReserveView"),
//            .init(name: "Scoot_MapView"),
//            .init(name: "Scoot_MyScootsView"),
//            .init(name: "Scoot_LotViews"),
//            .init(name: "Scoot_ListView"),
//            .init(name: "Scoot_CheckoutView"),
//            .init(name: "Scoot_CheckoutFinalView"),
//            .init(name: "Scoot_CheckoutConfirmMessageSheet"),
//            .init(name: "ScanQRView"),
//            .init(name: "RegistrationView"),
//            .init(name: "LoadingPageView"),
//            .init(name: "LandingPageView"),
//        ]
//        //ScenePhase monitors application state
//        /*The scenePhase is an instance of the ScenePhase enum, which represents thecurrent phase of the app's lifecycle for a particular scene, such asactive, inactive, or background. This property wrapper enables the view toautomatically update and recompute whenever the value of scenePhase changes.
//        By using @Environment(\.scenePhase), you can observe changes to the app's scenephase and respond accordingly in your view. For example, you can use it toperform actions when the app transitions between active, inactive, andbackground states, such as saving data or updating the user interface.
//            */








/*----------------------------->---NavigationStack---<-------------------------*/


//struct NavigationStack<Content: View>: View {
//
//    let content: Content
//    @Binding var path: [any Identifiable]
//
//    init(path: Binding<[any Identifiable]>, @ViewBuilder content: () -> Content) {
//        self.content = content()
//        self._path = path
//    }
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                content
//                    .environmentObject(NavigationStackEnvironment(path: $path))
//            }
//        }
//    }
//
//    struct NavigationStackEnvironment: EnvironmentKey {
//        static var defaultValue: NavigationStackEnvironment { NavigationStackEnvironment() }
//        var path: Binding<[Identifiable]> = .constant([])
//    }
//
//    extension EnvironmentValues {
//        var navigationStackEnvironment: NavigationStack.NavigationStackEnvironment {
//            get { self[NavigationStack.NavigationStackEnvironment.self] }
//            set { self[NavigationStack.NavigationStackEnvironment.self] = newValue }
//        }
//    }
//
//}
//
//extension View {
//    func navigationDestination<Content: View>(for type: any Identifiable.Type, @ViewBuilder content: () -> Content) -> some View {
//        return self.background(NavigationDestinationLink: (Content:View)(for: type, content: content))
//    }
//}
//
//fileprivate struct NavigationDestinationLink<Content: View>: View {
//    let content: () -> Content
//    let type: any Identifiable.Type
//
//    @EnvironmentObject private var navigationStackEnvironment: NavigationStack.NavigationStackEnvironment
//
//    var body: some View {
//        let id = UUID()
//        let isActive = Binding(
//            get: { navigationStackEnvironment.path.wrappedValue.last?.id == id },
//            set: {
//                if $0 {
//                    navigationStackEnvironment.path.wrappedValue.append(type.init())
//                } else {
//                    navigationStackEnvironment.path.wrappedValue.removeLast()
//                }
//            }
//        )
//
//        return NavigationLink(destination: content(), isActive: isActive) {
//            EmptyView()
//        }.id(id)
//    }
//}



//struct MyCustomImageModifier: ViewModifier {
//    // Define a property to hold the image name
//    var imageName: String
//
//    // Define a function to apply the view modifier
//    func body(content: Content) -> some View {
//        content
//            .overlay(
//                Image(imageName)
//                    .resizable()
//                    .scaledToFit()
//            )
//    }
//}

// Define a custom view modifier to encapsulate scale and position effects
//struct MyImageEffectsModifier: ViewModifier {
//    // Define properties to hold the scale and position effects
//    var scaleEffectX: CGFloat
//    var scaleEffectY: CGFloat
//    var positionX: CGFloat
//    var positionY: CGFloat
//
//    // Define a function to apply the view modifier
//    func body(content: Content) -> some View {
//        content
//            .scaleEffect(x: scaleEffectX, y: scaleEffectY, anchor: .center)
//            .position(x: positionX, y: positionY)
//    }
//}
//
//// Define an extension on Image to apply the custom view modifier
//extension Image {
//    func applyImageEffects(scaleEffectX: CGFloat, scaleEffectY: CGFloat, positionX: CGFloat, positionY: CGFloat) -> some View {
//        self.modifier(MyImageEffectsModifier(scaleEffectX: scaleEffectX, scaleEffectY: scaleEffectY, positionX: positionX, positionY: positionY))
//    }
//}



//    @StateObject var navigationStack = NavigationStackViewModel().$NavPath

//ViewItem is shown to the NavStack for to navigate to view
//        struct ViewItem: Identifiable, Hashable {
//            let name: String
//            let id = NSUUID().uuidString
//        }
//            //update the view to the navigationstack path variable
//        func ShowViewForItem(view: ViewItem) -> AnyView {
//            switch view.name {
//                case "UserHomeView":
//                    return AnyView(UserHomeView())
//                case "LandingPageView":
//                    return AnyView(LandingPageView())
//                case "RegistrationView":
//                    return AnyView(RegistrationView())
//                default:
//                    return AnyView(RegistrationView())
//            }
//        }
//DropDown View List items
//value to case-switch for value user choses
//            @State private var HamburgerItem_value = ""
//Array to hold the viewItems
//            let views: [ViewItem] =
//            [
//                .init(name: "UserHomeView"),
//                .init(name: "RegistrationView"),
//                .init(name: "LandingPageView"),
//            ]
//ScenePhase monitors application state



//NavigationStack Array
//            @State private var NavigationPath = [ViewItem]()
//List of Stack Array View Struct
//            @State private var NavigationPathText = ""
//            @State private var ViewChange = false



//Navigation Stack Destination
//            .navigationDestination(for: ViewItem.self) {      view in
//                ViewForItem(view)
//            }
//            .environmentObject(navigationStack)

//        .toolbar {
//            //toolbar
//            ToolbarItem(placement: .bottomBar) {
//                HStack{
//                    Menu {
//                        // dropDownList
//                        Picker("Select a view", selection: $path_AdminText) {
//                            ForEach(0..<viewNames.count) { index in
//                                Text(viewNames[index]).tag(index)
//                            }
//                        }
//                    } label: {
//                        VStack{
//                            HStack{
//                                Text(value.isEmpty ? placeholder : value)
//                                    .foregroundColor(value.isEmpty ? .gray : .black)
//                                Spacer()
//                                //dropDownList button
//                                Image(systemName: "chevron.down")
//                                    .foregroundColor(Color.blue)
//                                    .font(Font.system(size: 20, weight: .bold))
//                            }
//                            .padding(.horizontal)
//                            Rectangle()
//                                .fill(Color.gray)
//                                .frame(height: 2)
//                        }
//                    }
//                }
//            }
//        }
//                            Picker("Select a view", selection: $value) {
//                                ForEach(0..<viewNames.count) { index in
//                                    Text(viewNames[index]).tag(index)
//                                }
//                            }

//                              Button{
//                                if let view = viewNames {
//                                    self.navigationStack.NavPath.append(view)}
//                              } label:{
//                                Text("Push view to NavPath")
//                              }
//

//                        Button{
//                            if let value.isEmpty {
//                                NavigationStack.ViewForItem(NavigationStack)
//
//                         } label:{
//                                NavigationLink("Go", value:   $path_AdminText).padding(.trailing, 20)
//                                    .buttonStyle(.bordered)
//                         }
//
//
//                .navigationBarBackButtonHidden(true)

//                                                Image(systemName: "scooter")
//                                                    .font(.system(size: 90))
//                                                Text("Scooter Manager!")
//                                                    .foregroundColor(.black)

//                                                Image(systemName: "person.crop.circle.fill.badge.checkmark")
//                                                    .font(.system(size: 90))
//                                                Text("User Manager!")
//                                                    .foregroundColor(.gray)






//*/


//TODO: items for the drop down list
//    private var dropDownList =
//    [
//        "WalletView",
//        "UserProfile_SettingsView",
//        "UserHomeView",
//        "UserView",
//
//        "Scoot_ReserveView",
//        "Scoot_MapView",
//        "Scoot_MyScootsView",
//        "Scoot_LotViews",
//        "Scoot_ListView",
//        "Scoot_CheckoutView",
//        "Scoot_CheckoutFinalView",
//        "Scoot_CheckoutConfirmMessageSheet",
//
//        "ScanQRView",
//        "RegistrationView",
//        "LoadingPageView",
//        "LandingPageView",
//
//        "ScooterManagerView",
//        "UserManagerView",
//        "AdminUserHomeView",
//    ]




//Might need an instance to just modify that specific view
//    @State private var path_Admin = [AnyView]()
//@State of selection before user selects
//Changes the property of the @State of user when new selection changes

//    @State private var path_AdminText = ""
//DropDown View List starting value
//    @State private var value = ""
//    private var placeholder = "Select View"
//    @State var selection: Int? = nil






//                            .alert(isPresented: $isRegisterd) {
//                                Alert(title: Text("Registration Status"), message: Text(model.statusErrorMessage), dismissButton: .default(Text("OK")))
//                            }

//                            .alert(isPresented: $isShowingAlert) {
//                                        Alert(
//                                            title: Text("Registration Status"),
//                                            message: Text(model.statusErrorMessage),
//
//                                            primaryButton: .destructive(Text("OK"), action: {
//                                                // Code to be executed when Cancel button is pressed
//                                                isRegisterd.toggle()
////                                                NavigationPathText = "UserHomeView"
//                                                dismiss()
//                                            }),
//
//                                            secondaryButton: .destructive(Text("Login"), action: {
//                                                // Code to be executed when Custom Button is pressed
//                                                isRegisterd.toggle()
//                                                dismiss()
//                                            })
//                                        )
//                                    }

//                            .navigationDestination(isPresented: $ViewChange, destination: {
//                                ShowViewForItem(view: ViewItem(name: NavigationPathText))
//                            })
//                            .onAppear{
//                                NavigationLink("UserHomeView", destination: UserHomeView())
//                                isRegisterd.toggle()
//                                NavigationPathText = "UserHomeView"
//                            }
//                            .alert(isPresented: $isShowingAlert) {
//                                Alert(title: Text("Registration Status"), message: Text(model.statusErrorMessage), dismissButton: .default(Text("OK")))
//                            }
//








//         Map(coordinateRegion: $region, annotationItems: chargingStations) {
//             MapAnnotation(coordinate: $0.coordinate){
//                 Button{}label:{
//                     ZStack{
//                         NavigationLink(destination: Scoot_ListView(), label: {
//                             Image(systemName: "mappin.circle.fill").foregroundColor(.green)
//                                 .font(.system(size: 30))
//                         })
//
//
//                     }
//                 }
//             }
//                 }










//MARK: unused

//struct RegisterAccountButton: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .frame(width: 300,height: 50)
//            .background(Color.white)
//            .cornerRadius(10)
//            .clipShape(Capsule())
//            .padding(15)
//
//    }
//}
//extension View {
//    func AddRegisterAccountButton() -> some View {
//        modifier (RegisterAccountButton())
//    }
//}




//struct MyButtonStyle: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//
//            .frame(width: 150, height: 30)
//            .background(
//                RoundedRectangle(cornerRadius: 10,style:.continuous)
//                    .fill(.white)
//            )
//            .clipShape(Capsule())
//
//            .fontWeight(.bold)
//            .foregroundColor(.red)
//    }
//}
//extension View {
//    func AddMyButtonStyle() -> some View {
//        modifier(MyButtonStyle())
//    }
//}

//struct addMyForEach_HomeViewButtonStyler2: ViewModifier{
//    func body(content: Content) -> some View {
//        content
//            .frame(width: 100, height: 100)
//            .background(Color.red)
//            .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
//            .shadow(color: .black, radius: 7, x: 8, y: 9)
//    }
//}
//extension View {
//    func myForEach_HomeViewButtonStyler2() -> some View {
//        modifier (addMyForEach_HomeViewButtonStyler2())
//    }
//}


//struct addMyUIButtonStyler: ViewModifier{
//    func body(content: Content) -> some View {
//        content
//            .frame(width: 100, height: 100)
//            .background(Color.red)
//            .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
//            .shadow(color: .black, radius: 7, x: 8, y: 9)
//    }
//}
//extension View {
//    func myUIButtonStyler() -> some View {
//        modifier (addMyUIButtonStyler())
//    }
//}



//struct ButtonStyle: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//
//            .frame(width: 150, height: 50)
//            .background(Color.white)
//            .background(RoundedRectangle(cornerRadius: 10,style:.continuous))
//            .clipShape(Capsule())
//
//            .font(.title2).fontWeight(.bold)
//            .foregroundColor(.red)
//            .padding(20)
//    }
//}
//extension View {
//    func Add_ButtonSytle() -> some View {
//        modifier(ButtonStyle())
//    }
//}







//
//struct LandingViewLoginButton1: View {
//
//    var body: some View {
//
//        Text("Login")
//        .frame(width: 130, height: 30)
//        .background(
//            RoundedRectangle(cornerRadius: 10,style:.continuous)
//                .fill(.white)
//        )
//        .clipShape(Capsule())
//        .fontWeight(.bold)
//        .foregroundColor(.green)
//
//    }
//}
//struct LandingViewLoginButton2: View {
//
//    var body: some View {
//
//        Text("Login")
//            .frame(width: 130, height: 30)
//            .background(
//                RoundedRectangle(cornerRadius: 10,style:.continuous)
//                    .fill(.white)
//            )
//            .clipShape(Capsule())
//
//            .fontWeight(.bold)
//            .foregroundColor(.gray)
//
//    }
//}

//struct HamburgerMenu: View {
//    var body: some View {
//
//        Image(systemName: "line.3.horizontal")
//            .addMyHambugerMenuStyler()
//            .font(.system(size: 30))
//            .frame(width: 50, height :50)
//            .padding(.trailing,25)
//    }
//}


//struct FlagImage: View {
//    var ImageText: String
//
//    var body: some View {
//        Image(ImageText)
//            .renderingMode(.original)
//            .clipShape(Capsule())
//            .shadow(radius: 50)
//    }
//}
//
//






//struct ScooterListItemView: View {
//    var Scooter: Scooter?
//
//    var ImageText = "scooterList"
//    var imageNum: Int {
//        checkScooterAvail(scooterAvail: Scooter?.isAvailable ?? "\(randomScooterAvailability)!")
//    }
//
//
//    var body: some View {
//        HStack{
//TODO:
//            Text(Scooter?.location ?? "\(randomLocation)!")
//                .font(Font.system(size: 16))
//
//
//
//            Spacer()
//
//
//            let LEDcheck = imageNum
//            if LEDcheck == 1{
//                Image("LED ON")
//            }
//            else if LEDcheck == 0{
//                Image("LED OFF")
//            }
//            Spacer()
//            Image(ImageText)
//
//            Spacer()
//            //TODO: Add logic for availability
//if scooter is available turn green light on, otherwise turn grey light on
//        }
//    }
//}




//struct LogoutButtonV: View {
//    var ImageText: String
//
//    var body: some View {
//
//            VStack{
//                Image(systemName: ImageText)
//                Text("Log Out")
//            }
//            .font(.system(size: 22))
//            .buttonStyle(.bordered)
//    }
//}
//struct LogoutButtonH: View {
//    var ImageText: String
//
//    var body: some View {
//
//            HStack{
//                Image(systemName: ImageText)
//                Text("Log Out")
//            }
//            .font(.system(size: 30))
//            .buttonStyle(.bordered)
//    }
//}




//struct ProfilePhotoButton: View {
//    var image_: Image?
//    var inputImage: UIImage?
//
//    var body: some View {
//        VStack{
//            if let image_ = self.inputImage {
//                Image(uiImage: image_)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 128, height: 128)
//                    .cornerRadius(64)
//            } else {
//                Image(systemName: "person.fill")
//                    .font(.system(size: 64))
//                    .padding()
//                    .foregroundColor(Color(.label))
//                    .overlay(RoundedRectangle(cornerRadius: 64)
//                        .stroke(Color.black, lineWidth: 3)
//                    )
//            }
//        }
//
//    }
//}





////Profile
//struct ProfileButton: View {
//    var body: some View {
//        HStack{
//            Image(systemName: "person.crop.circle.fill")
//            Text("My Account").underline()
//        }
//        .font(.system(size: 30))
//        .buttonStyle(.bordered)
//    }
//}
//
////Account
//struct AccountButton: View {
//    var body: some View {
//        HStack{
//            Image(systemName: "person.crop.circle.fill")
//            Text("My Account").underline()
//        }
//        .font(.system(size: 30))
//        .buttonStyle(.bordered)
//    }
//}
//struct QRCodeScanButton: View {
//    var body: some View {
//        HStack{
//            Image(systemName: "qrcode.viewfinder")
//            Text("QR Scanner").underline()
//        }
//        .font(.system(size: 30))
//        .buttonStyle(.bordered)
//    }
//}
//Log Out
//struct LogoutButton: View {
//    var body: some View {
//        HStack{
//            Image(systemName: "figure.wave")
//            Text("Log Out").underline()
//        }
//        .font(.system(size: 30))
//        .buttonStyle(.bordered)
//    }
//}

//struct ViewItem: Identifiable, Hashable {
//    let name: String
//    let id = NSUUID().uuidString
//}






//
//struct LEDMaker: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .frame(width:20,height:20,alignment: .center).scaleEffect(x: 0.7, y: 0.7, anchor: .center)
//    }
//}
//extension View {
//    func MakeLED() -> some View {
//        modifier(LEDMaker())
//    }
//}
//
//

