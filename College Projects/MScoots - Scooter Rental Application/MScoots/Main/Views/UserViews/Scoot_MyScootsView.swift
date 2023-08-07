import SwiftUI
struct Scoot_MyScootsView: View {
    @ObservedObject var Firestore = Firebase_Firestore()
    var body: some View{
        NavigationView {
            ZStack{
                //Background
                Color.black.ignoresSafeArea()
                //Red Background items
                Section{
                    Rectangle()
                        .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 1000, height: 350)
                        .rotationEffect(.degrees(135))
                        .offset(y: -540)
                    
                    Rectangle()
                        .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 1000, height: 250)
                        .rotationEffect(.degrees(135))
                        .offset(y: 540)
                }
                
                VStack{
                    //Title
                    Section{
                        HStack{
                            Text("MyScoots")
                                .foregroundColor(.white)
                                .padding(.trailing, 130)
                                .font(.system(.largeTitle)).bold()
                                .padding(.top, 40)
                            
                            
                            NavigationLink(destination: HamburgerMenuView()) {
                                HamburgerMenu()
                            }
                            
                        }
                    }
                    Spacer()
                                        
                    //Ride History
                    Section{
                        VStack{
                            
                            
                            ForEach(Firestore.history_list){ item in
                                VStack{
                                    HStack{
                                        Text("ScooterID:")
                                            .italic()
                                            .underline()
                                        Spacer()
                                        Text(item.ScooterID)
                                    }
                                    HStack{
                                        Text("Charger:")
                                            .italic()
                                            .underline()
                                        Spacer()
                                        Text(item.Charger)
                                    }
                                    HStack{
                                        Text("Location:")
                                            .italic()
                                            .underline()
                                        Spacer()
                                        Text(item.location)
                                    }
                                    HStack{
                                        Text("Date Start:")
                                            .italic()
                                            .underline()
                                        Spacer()
                                        Text(item.DateStart)
                                    }
                                    HStack{
                                        Text("Date End:")
                                            .italic()
                                            .underline()
                                        Spacer()
                                        Text(item.DateEnd)
                                    }
                                    
                                    
                                    
                                }
                                .padding(.horizontal)
                                .foregroundColor(.black)
                                .font(.title3)
                            }.MakeRoundedSquareBackground()
                            
                            

                        }
                    } header: {
                        Text("Past History")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .font(.headline).bold()
                    }
                    
                    Spacer()
                }.navigationBarBackButtonHidden(true)
            }.navigationBarBackButtonHidden(true)
            .onAppear(
                perform: Firestore.getHistoryData
            )
        }.navigationBarBackButtonHidden(true)
    }
}

struct Scoot_MyScootsView_Previews: PreviewProvider {
    static var previews: some View {
        Scoot_MyScootsView()
        
    }
}
