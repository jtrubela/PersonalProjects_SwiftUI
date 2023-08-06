//
//  UserProfile_SettingsView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

import SwiftUI
import FirebaseAuth

struct UserProfile_SettingsView: View {
    
    @ObservedObject var model = Firebase_Authorization()
    @ObservedObject var Firestore = Firebase_Firestore()
    

    // create image picture verification
    @State private var shouldShowImagePicker = false
    //TODO: remove this element of the image and replace with the new one
    @State private var image: UIImage?
    
    //Get the users name from the database studentUser
    private var userNameFS: String {
        for userName in Firestore.list {
            if userName.email == Auth.auth().currentUser?.email{
                return "\(userName.first_name) \(userName.last_name)"
            }
        }
        return "!No user"

    }

    private var userCWIDFS: String {
        for thisCWID in Firestore.list {
            if thisCWID.email == Auth.auth().currentUser?.email{
                return "\(thisCWID.CWID)"
            }
        }
        return "!!No user"
        
    }

    
    var body: some View {
        NavigationView{
            VStack{
                
                HStack{
                    Text("Profile")
                        .font(.largeTitle).padding(.leading, 20).padding(.top, 20)
                    Spacer()
                    NavigationLink(destination: HamburgerMenuView()) {
                        HamburgerMenu()
                    }
                }
                .padding(30)
                
                
                VStack{
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        VStack {
                            //TODO: Create a reference to an actual image and save it to the On Device Storage for presentation purpose
                            if let image = self.image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(64)
                            } else {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 120))
                                    .padding()
                                    .foregroundColor(Color(.label))
                            }
                        }
                        .overlay(Circle()
                            .stroke(Color.black, lineWidth: 3)
                        )
                        
                        .fullScreenCover(
                            isPresented: $shouldShowImagePicker, onDismiss: nil) {
                                ImagePicker(image: $image)
                            }
                        
                    }
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        Text("Edit Image").font(.caption)
                            .padding(.bottom, 20)
                    }
                }
                
                HStack{
                    VStack{
                        HStack{
                            Text("Name:")
                                .font(.system(size:20))
                                .italic()
                                .padding(.leading, 30)
                            Spacer()
                            Text(userNameFS)                                .font(.system(size: 20))

                        }
                        Divider()
                        HStack{
                            Text("CWID:")
                                .font(.system(size:20))
                                .italic()
                                .padding(.leading, 30)
                            Spacer()
                            Text(userCWIDFS)                                .font(.system(size: 20))

                        }
                        Divider()
                        HStack{
                            Text("Email:")
                                .font(.system(size:20))
                                .italic()
                                .padding(.leading, 30)
                            Spacer()
                            Text(Auth.auth().currentUser?.email ?? "!!!No user")
                                .font(.system(size: 20))
                        }.padding(10)
                    }
                    Spacer()
                    Spacer()
                }
                .font(.title2)
                .padding()
                Spacer()
                Spacer()
                HStack{
                    Text("Settings")
                        .font(
                            .system(size: 20, weight: .bold, design: .rounded)
                        )
                        .textCase(.uppercase)
                        .foregroundColor(.gray)
                        .padding(.leading, 30)
                    Spacer()
                }
                Divider()
                VStack{
                    HStack{
                        Spacer()
                        Text(" Wallet")
                        Spacer()
                        Spacer()
                        Spacer()
                        NavigationLink(destination: WalletView()) {
                            Image(systemName: "arrow.right")
                                .font(.system(size:40))
                        }
                        Spacer()
                    }
                    Divider()
                    HStack{
                        Spacer()
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            Text("Verified")
                        }.padding(.trailing, 57)
                    }.padding(.leading,50)
                    Divider()
                    Spacer()
                }.font(
                    .system(size: 25, weight: .none, design: .rounded)
                )
            }
            .onAppear(
                perform: Firestore.getStudentData
            )
        }.navigationBarBackButtonHidden(true)
    }
}

struct UserProfile_SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile_SettingsView()
    }
}


/*--------------------------------------------------------*/
//
//User profile information
//  Add Profile Image
//
//  Store the users selected image
//
/*--------------------------------------------------------*/
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
