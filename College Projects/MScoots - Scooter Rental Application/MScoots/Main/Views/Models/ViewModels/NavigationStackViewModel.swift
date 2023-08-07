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
