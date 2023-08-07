import SwiftUI
struct ContactUsView: View {
    @State var Name: String = ""
    @State var PhoneNumber: String = ""
    @State var Message: String = ""
    
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
                        Rectangle()
                            .stroke(Color.black, lineWidth: 10)
                            .frame(width: 390, height: 700)
                        
                        
                            .background(LinearGradient(gradient:Gradient(colors: [.black, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .edgesIgnoringSafeArea(.all))
                            .cornerRadius(5)
                        
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
                                HStack{
                                    
                                    Text("Name")
                                        .foregroundColor(.white)
                                        .font(.system(
                                            size: 30,
                                            weight: .bold,
                                            design: .rounded
                                        ))
                                    Spacer()
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold, design: .rounded)).padding(.leading, 30)
                                
                                TextField("Name", text: $Name)
                                    .padding(20).frame(width: 350, height: 50, alignment: .center)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .font(.title2)
                                    .textFieldStyle(.plain)
                                    .padding(10)
                                
                                
                                Text("Phone Number")  .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .bold, design: .rounded)).padding(.leading, -160)
                                TextField("Phone", text: $PhoneNumber)
                                    .padding(20).frame(width: 350, height: 50, alignment: .center)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .font(.title2)
                                    .textFieldStyle(.plain)
                                    .padding(10)
                            }
                            //Message
                            
                            Text("Message")  .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold, design: .rounded)).padding(.leading, -160)

                            
                            TextField("Enter your message here!", text: $Message,  axis: .vertical)
                                .lineLimit(5...10)
                                .frame(minWidth: 100, maxWidth: 350, minHeight: 100, maxHeight: .infinity, alignment: .topLeading).padding(20)
                            
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .font(.title2)
                                .textFieldStyle(.plain)
                                .padding(10)
                            
                            
                            Button{
                            }label:{
                                Text("Submit")
                            }.buttonStyle(.borderedProminent)
                        }
                        .padding(50)
                        
                        
                        
                        
                    }
                }
            }
            
            }.navigationBarBackButtonHidden(true)
        
    }
    
}


struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
    }
