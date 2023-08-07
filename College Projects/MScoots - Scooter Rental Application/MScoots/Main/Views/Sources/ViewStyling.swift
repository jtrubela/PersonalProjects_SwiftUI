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

import Foundation
import SwiftUI

 
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
class JsonDecoder: ObservableObject {
    
    // <VM> Observed in the ViewModel, contains the list of users retrieved from the API.
    @Published var users: [studentUser] = []
    
    // <VM> Modifies the given Model data and performs a network request to retrieve JSON data from the given URL.
    func getUsers(from url: String) {
        
        // <V> Check if the URL is valid and create a URLRequest from it.
        guard let url = URL(string: url) else { fatalError("Invalid URL") }
        let urlRequest = URLRequest(url: url)
        
        // <V> Start a URLSessionDataTask to retrieve the JSON data from the API.
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            // <V> Handle any errors that may occur during the network request.
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            // <V> Ensure that the response received is of type HTTPURLResponse.
            guard let response = response as? HTTPURLResponse else { return }
            
            // <V> If the response status code indicates success, decode the JSON data and update the user list.
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([studentUser].self, from: data)
                        self.users = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        // <V> Start the data task.
        dataTask.resume()
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

//Profile
struct ProfileButton: View {
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle.fill")
            Text("My Account").underline()
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

//Account
struct AccountButton: View {
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle.fill")
            Text("My Account").underline()
        }
        .font(.system(size: 30))
        .buttonStyle(.bordered)
    }
}
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
struct QRCodeScanButton: View {
    var body: some View {
        HStack{
            Image(systemName: "qrcode.viewfinder")
            Text("QR Scanner").underline()
        }
        .font(.system(size: 30))
        .buttonStyle(.bordered)
    }
}
//Log Out
struct LogoutButton: View {
    var body: some View {
        HStack{
            Image(systemName: "figure.wave")
            Text("Log Out").underline()
        }
        .font(.system(size: 30))
        .buttonStyle(.bordered)
    }
}

//struct ViewItem: Identifiable, Hashable {
//    let name: String
//    let id = NSUUID().uuidString
//}

/*-----------------------------------------------------------------------------------------------------/
 //View Items                View Items                 View Items                     View Items
 //                     View Items                                             View Items
 //     View Items        View Items      View Items         View Items                 View Items
 //             View Items               View Items                        View Items
 //    View Items         View Items         View Items         View Items         Views/Scenes
 /------------------------------------------------------------------------------------------------------*/

struct ProfilePhotoButton: View {
    var image_: Image?
    var inputImage: UIImage?
    
    var body: some View {
        VStack{
            if let image_ = self.inputImage {
                Image(uiImage: image_)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .cornerRadius(64)
            } else {
                Image(systemName: "person.fill")
                    .font(.system(size: 64))
                    .padding()
                    .foregroundColor(Color(.label))
                    .overlay(RoundedRectangle(cornerRadius: 64)
                        .stroke(Color.black, lineWidth: 3)
                    )
            }
        }

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


struct LogoutButtonV: View {
    var ImageText: String
    
    var body: some View {

            VStack{
                Image(systemName: ImageText)
                Text("Log Out")
            }
            .font(.system(size: 22))
            .buttonStyle(.bordered)
    }
}
struct LogoutButtonH: View {
    var ImageText: String
    
    var body: some View {

            HStack{
                Image(systemName: ImageText)
                Text("Log Out")
            }
            .font(.system(size: 30))
            .buttonStyle(.bordered)
    }
}

struct LandingViewLoginButton1: View {

    var body: some View {

        Text("Login")
        .frame(width: 130, height: 30)
        .background(
            RoundedRectangle(cornerRadius: 10,style:.continuous)
                .fill(.white)
        )
        .clipShape(Capsule())
        .fontWeight(.bold)
        .foregroundColor(.green)

    }
}
struct LandingViewLoginButton2: View {

    var body: some View {

        Text("Login")
            .frame(width: 130, height: 30)
            .background(
                RoundedRectangle(cornerRadius: 10,style:.continuous)
                    .fill(.white)
            )
            .clipShape(Capsule())
        
            .fontWeight(.bold)
            .foregroundColor(.gray)

    }
}

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


struct FlagImage: View {
    var ImageText: String
    
    var body: some View {
        Image(ImageText)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 50)
    }
}



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

    import SwiftUI
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




/*-----------------------------------------------------------------------------------------------------/
 //Backgrounds                Backgrounds                 Backgrounds                     Backgrounds
 //                     Backgrounds                                             Backgrounds
 //     Backgrounds        Backgrounds      Backgrounds         Backgrounds                 Backgrounds
 //             Backgrounds               Backgrounds                        Backgrounds
 //    Backgrounds         Backgrounds         Backgrounds         Backgrounds         Backgrounds
 /------------------------------------------------------------------------------------------------------*/



struct mySquareBackground: ViewModifier {
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
    func MakeMyBackground() -> some View {
        modifier(mySquareBackground())
    }
}

struct SquareBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width-50, maxHeight: 200)
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


/*------------------------------------------------------------------------------------------------------/
 //Images                              Images                 Images                     Images
 //                     Images                                             Images
 //     Images            Images              Images         Images                 Images
 //             Images               Images                                Images
 //    Images         Images         Images         Images         Images                  Images
 /------------------------------------------------------------------------------------------------------*/

 
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



/*------------------------------------------------------------------------------------------------------/
 //Buttons                              Buttons                 Buttons                     Buttons
 //                     Buttons                                             Buttons
 //     Buttons            Buttons              Buttons         Buttons                 Buttons
 //             Buttons               Buttons                                Buttons
 //    Buttons         Buttons         Buttons         Buttons         Buttons                  Buttons
 /------------------------------------------------------------------------------------------------------*/
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

struct addMyForEach_HomeViewButtonStyler2: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
            .shadow(color: .black, radius: 7, x: 8, y: 9)
    }
}
extension View {
    func myForEach_HomeViewButtonStyler2() -> some View {
        modifier (addMyForEach_HomeViewButtonStyler2())
    }
}


struct addMyUIButtonStyler: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
            .shadow(color: .black, radius: 7, x: 8, y: 9)
    }
}
extension View {
    func myUIButtonStyler() -> some View {
        modifier (addMyUIButtonStyler())
    }
}

struct RegisterAccountButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300,height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .clipShape(Capsule())
            .padding(15)
        
    }
}
extension View {
    func AddRegisterAccountButton() -> some View {
        modifier (RegisterAccountButton())
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

//
//
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
//
//struct MyEmailEntryField: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .keyboardType(.emailAddress)
//            .autocorrectionDisabled().padding(5)
//            .textInputAutocapitalization(.never)
//            .submitLabel(.next)
//    }
//}
//extension View {
//    func AddMyEmailFieldEntry() -> some View {
//        modifier(MyEmailEntryField())
//    }
//}
//
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



//struct TextEntryField: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding(20)
//            .frame(width: 350, height: 50, alignment: .center)
//            .background(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .font(.title2)
//            .textFieldStyle(.plain)
//            .padding(10)
//    }
//}
//extension View {
//    func MakeTextFieldEntry() -> some View {
//        modifier(TextEntryField())
//    }
//}
//  
//  
//  
  
  /*------------------------------------------------------------------------------------------------------/
 //Objects                              Objects                 Objects                     Objects
 //                     Objects                                             Objects
 //     Objects            Objects              Objects         Objects                 Objects
 //             Objects               Objects                                Objects
 //    Objects         Objects         Objects         Objects         Objects                  Objects
 /------------------------------------------------------------------------------------------------------*/



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
