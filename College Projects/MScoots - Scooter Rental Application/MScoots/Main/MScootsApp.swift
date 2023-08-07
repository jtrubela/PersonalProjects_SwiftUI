//
//  MScootsApp.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI

@main
struct MScootsApp: App {

    var body: some Scene {
        
        WindowGroup {
                UserHomeView()
        }
    }
}
/*                          MSCOOTS


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
