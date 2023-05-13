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
                    DoubleRedRectangleBG()
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
                            }.MakeScootHistoryBackground()
                            
                            

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
