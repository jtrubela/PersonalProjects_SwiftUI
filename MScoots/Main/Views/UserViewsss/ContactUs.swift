import SwiftUI
import Firebase
import FirebaseAuth
struct ContactUsView: View {
    let db = FirebaseManager.shared.auth
    
    //: @ObservedObject: This property wrapper is used to observe changes to an external object, typically a model object. When the observed object changes, the view is automatically re-rendered.
    @ObservedObject private var Firestore = Firebase_Firestore()
    //Database variables
    //allows the login function for firebase to be used
    
    @State var Name: String = ""
    
    @State var PhoneNumber: String = ""
    @State var Message: String = ""
    
    @State var isShowingAlert = false
    @State var alertMessage = "Your message has been successfully sent to the Administrator"
    
    private var userNameFS: String {
        for userName in Firestore.list {
            if userName.email == Auth.auth().currentUser?.email{
                return "\(userName.first_name) \(userName.last_name)"
            }
        }
        return "Enter your name"
        
    }
    
    var body: some View {
        
            NavigationView{
                ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)
            
                VStack{
                    
                    HStack{
                        Text("Contact Us!")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold, design: .rounded)).padding(.leading, 60)
                        Spacer()
                        NavigationLink(destination: HamburgerMenuView()) {
                            HamburgerMenu()
                        }.padding(.trailing, 50)

                    }.padding(.top, 50)
                    ZStack {
                        ContactUsBackground()

                        
                        VStack{
                            VStack{
                                Spacer()
                                Text("Let us know what you think!")
                                Spacer()
                                Text("Message us and we will get back to you ASAP!")
                                Spacer()
                            }
                            .frame(width: 350, height: 100, alignment: .center)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .rounded)).padding(.leading, 10)
                            .padding(.bottom, 30)
                            .padding(.trailing)
                            
                            
                            
                            //Name and Phonenumber
                            Section{
                                //Name
                                Section{
                                    TextField("\(userNameFS)", text: $Name)
                                        .MakeTextFieldEntry()
                                    
                                } header: {
                                    Text("\(userNameFS)").foregroundColor(.white)
                                        .font(.system(size: 25, weight: .bold, design: .rounded)).padding(.leading, -160)
                                }
                                
                                //Phone Number
                                Section{
                                    TextField("Enter your Phone Number", text: $PhoneNumber).MakeTextFieldEntry()
                                    
                                } header: {
                                    Text("Phone Number")
                                        .foregroundColor(.white)
                                        .font(.system(size: 25, weight: .bold, design: .rounded)).padding(.leading, -160)
                                }
                            }.font(.system(
                                size: 30,
                                weight: .bold,
                                design: .rounded
                            ))
                            //Message
                            Section{
                                TextField("Enter your message here!", text: $Message,  axis: .vertical)
                                    .AddVerticalTextboxFieldEntry()
                            } header: {
                                Text("Message").foregroundColor(.white)
                                    .font(.system(size: 25, weight: .bold, design: .rounded)).padding(.leading, -160)
                            }
                            
                            // SubmitButton
                            Section{
                                Button{
                                    isShowingAlert.toggle()
                                }label:{
                                    Text("Submit")
                                }.buttonStyle(.borderedProminent)
                            }
                        }
                        .padding(50)
                    }
                }
                }.alert(isPresented: $isShowingAlert) {
                    Alert(
                        title: Text("Message Status"),
                        message: Text(alertMessage)
                    )
                }
            }.navigationBarBackButtonHidden(true)
    }
}


struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}


struct ContactUsBackground: View {
    var body: some View {
        Rectangle()
            .stroke(Color.black, lineWidth: 10)
            .frame(width: 390, height: 700)
        
        
            .background(LinearGradient(gradient:Gradient(colors: [.black, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all))
            .cornerRadius(5)
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
