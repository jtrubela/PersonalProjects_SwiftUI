//
//  checkout.swift
//  MScoots
//
//  Created by Vincent Cavallaro on 4/19/23.
//

//There are a few views underneath that were going to b used for a
//reserve process but we made a decision to make it first come first serve
//saving views for use in future possibly

import SwiftUI

struct Scoot_CheckoutView: View {
    
    @State var time: Int = 30
    @State var price: Double = 10.00
    @State private var selection: String? = nil
    //    @State private var selectedDuration: Int = 0
    //        let durations = [0, 5, 10, 15, 20, 30, 45, 60]
    //        let pricePerMinute = 3.50
    //
    @State private var isShowingConfirmation = false
    
    //    func calculatePrice() -> Double {
    //            return Double(selectedDuration) * pricePerMinute
    //        }
    
    var body: some View {
        ZStack{
            
            NavigationView{
                
                VStack{
                    Image("scooter")
                    VStack(alignment: .leading) {
                        
                        //                        HStack{
                        //                            Text("Time to rent").font(.title).padding(.leading,15)
                        //                            Picker("Duration", selection: $selectedDuration) {
                        //                                ForEach(0 ..< durations.count) { index in
                        //                                    Text("\(durations[index]) minutes")
                        //                                }
                        //                            }
                        //                            .pickerStyle(.wheel)
                        //                            .font(.title).padding(.leading,15)
                        //                            Spacer()
                        //
                        //                        }
                        //                        .padding(.top, 30)
                        //
                        //Price
                        Section{
                            HStack{
                                
                                Spacer()
                                
                                Text("Price: $\(price, specifier: "%.2f")").font(.title)
                                Spacer()
                                
                            }
                            .padding(.top, 30)
                        }
                        
                        
                        Divider()
                        
                        HStack{
                            VStack{
                                Text("Return to charger\nor account would \nbe charged for \nprice of scooter")
                                    .foregroundColor(.green)
                                    .font(.system(.title))
                                    .bold()

                                Divider()
                                Section{
                                    Button{
                                        isShowingConfirmation.toggle()
                                    } label: {
                                        //                                NavigationLink("Rent", destination: Scoot_CheckoutFinalView(), tag: "Final Checkout", selection: $selection).
                                        //                                font(.system(size: 25)
                                        //                                    .bold())
                                        //                                .colorInvert()
                                        NavigationLink(destination: Scoot_CheckoutConfirmMessageSheet()) {
                                            Text("Confirm")
                                        }
                                        
                                    }
                                    
                                    .frame(width: 420, height: 60, alignment: .center)
                                    .background(Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    
                                }

                            }
                            
                        }
                        //                    .navigationBarBackButtonHidden(true)
                    }
//                    .frame(width: 350, height: 650)
                        .background(.thickMaterial)
                    //            .background(Color.secondary)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(5)
                        
                        .navigationTitle("Checkout")
                        .padding()
                        .foregroundColor(.primary)
                        .background(Color.primary
                            .colorInvert()
                            .opacity(0.75))
                }                                        .navigationBarBackButtonHidden(true)

            }
        }
        
        
    }
    
    struct Scoot_CheckoutView_Previews: PreviewProvider {
        static var previews: some View {
            Scoot_CheckoutView()
        }
    }
    
    
    
    
    
    
    
    
    
    
    //
    //  checkoutConfirmation.swift
    //  MScoots
    //
    //  Created by Vincent Cavallaro on 4/19/23.
    //
    
    
    struct Scoot_CheckoutConfirmMessageSheet: View {
        
        // @State var time: Int = 30
        @State var price: Double = 10.00
        @State private var selection: String? = nil
        var body: some View {
            ZStack{
                
                NavigationView{
                    
                    
                    
                    VStack{
                        HStack{
                            Text("Thanks for your Purchace MScoots electric scooter ride at the price of $10.00")
                            Text("")
                        }.font(.system(size:20))
                                            Divider()
                        
                        VStack(alignment: .leading){
                            
                        }
                        Image("scooter")
//                            .padding(.top, 100)
                        //                    .resizable()
                        //                    .aspectRatio(contentMode: .fit).padding(50)
                            .scaleEffect(x: 0.8, y: 0.8, anchor: .center)
                        VStack(alignment: .leading) {
                            
                            Divider()
                            HStack{
                                
                                Text("Enjoy your Ride!!")
                                    .font(.title).padding(.leading,75)
                            
                            
                                
                            }
//                            .padding(.top, 30)
                            Divider()
//                                .padding(.top,50)
                            HStack{
                                Spacer()
                                Button{
                                    
                                } label: {
                                    NavigationLink("Enjoy", destination: UserHomeView(), tag: "confirm", selection: $selection)
                                        .font(.system(size: 25).bold())
                                        .colorInvert()
                                }
                                .frame(width: 220, height: 60, alignment: .center)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 30)).padding(.top,20)
                                
                                //                                .buttonStyle(.borderedProminent).font(.system(size: 30))
                                //                                .buttonStyle(.borderedProminent).padding(.top, 50)
                                
                                Spacer()
                            }
                            
                        }
                    }
                    .makeScootCheckoutBackground()
                    .navigationTitle("Checkout")
                    .padding()
                    .foregroundColor(.primary)
                    .background(Color.primary
                        .colorInvert()
                        .opacity(0.75))
                    
                }
                            .navigationBarBackButtonHidden(true)
                
            }
            
        }
        
        
    }
    
    struct Scoot_CheckoutConfirmMessageSheet_Previews: PreviewProvider {
        static var previews: some View {
            Scoot_CheckoutConfirmMessageSheet()
        }
    }
}

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






//MARK: NOT USED

//
//  ReserveView.swift
//  MScoots
//
//  Created by Shade'Dorch on 4/18/23.
//

/*--------------------------------------------------------------------------------------*/
//
//
//              Reserve view is transition number 1 in the checkout tree
//
//
//
/*--------------------------------------------------------------------------------------*/

import SwiftUI

struct Scoot_ReserveView: View {
    
    @State var location: String = ""
    @State var time: String = ""
    @State var how_long: String = ""
    @State private var selection: String? = nil
    @State private var selectedDuration: Int = 1000
    @State private var selectedLocation: String = ""
    
    let locations = ["CCIS", "Yogi Berra", "Blanton Hall", "Life Hall", "Car Parc Diem", "The Overview","University Hall"]
    
    let times = (0...1439).map { minutes in
        let hour = minutes / 60
        let minute = minutes % 60
        let isAM = hour < 12
        let hour12 = hour % 12 == 0 ? 12 : hour % 12
        let amPm = isAM ? "AM" : "PM"
        return String(format: "%02d:%02d %@", hour12, minute, amPm)
    }
    let distance = ["test1", "test2"]
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.black.ignoresSafeArea()
                Rectangle()
                VStack{
                    //UI Elements inside Box
                    Section{
                        ZStack{
                            
                            //Middle Box Stack of elements
                            Section{
                                //Background
                                Section{
                                    Rectangle()
                                        .frame(width: 390, height: 600)
                                        .background(.thickMaterial)
                                        .opacity(0.6)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                                //UI elements
                                Section{
                                    VStack{
                                        Spacer()
                                        //Scooter Image
                                        Section{
                                            Image("scooterFlipped")
                                        }
                                        Spacer()
                                        
                                        VStack{
                                            //Location Picker - Drop down
                                            //TODO: Add a drop down of location array elements
                                            Section{
                                                TextField("Location", text: $location)
                                                    .padding(20)
                                                    .frame(width: 320, height: 40, alignment: .center)
                                                    .background(Color.white)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                    .foregroundColor(.black)
                                            }
                                            .padding(10)
                                            
                                            
                                            //Location Picker - Drop down
                                            Section{
                                                Picker("Time", selection: $selectedDuration) {
                                                    ForEach(0..<times.count) { index in
                                                        Text(times[index])
                                                    }
                                                }.pickerStyle(.wheel)
                                                
                                                    .background(Color.white)
                                                    .frame(width: 320, height: 120, alignment: .center)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                            }
                                            
                                            //Time Picker - not done
                                            Section{
                                                TextField("How Long", text: $how_long)
                                                    .foregroundColor(.white)
                                                    .padding(20)
                                                    .frame(width: 320, height: 40, alignment: .center)
                                                    .background(Color.white)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                    .foregroundColor(.black)
                                            }
                                            .padding(10)
                                        }
                                        Spacer()
                                        
                                    }
                                    .font(.title2)
                                }
                            }
                        }
                    }
                    //Reserve Button
                    Section{
                        Button{
                            
                        }label: {
                            NavigationLink("Reserve", destination: reserve(), tag: "Reserve", selection: $selection)
                            
                                .font(.system(size: 25)
                                )
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 220, height: 60, alignment: .center)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 30)).padding(.bottom,50).foregroundColor(.black)
                        }
                    }
                    .padding(10)
                }
            }
            .navigationTitle("Reserve Scoot")
        }
    }
}
//                   .background(LinearGradient(gradient:Gradient(colors: [.black, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)



struct Scoot_ReserveView_Previews: PreviewProvider {
    static var previews: some View {
        Scoot_ReserveView()
    }
}

/*--------------------------------------------------------------------------------------*/
//
//
//              reserve view is transition number 2 in the checkout tree
//                  rest of transitions need to be figured out
//                      UI NEEDS some organization or something
//
//
//
/*--------------------------------------------------------------------------------------*/

//
//  reserve.swift
//  MScoots
//
//  Created by Vincent Cavallaro on 4/19/23.
//


struct reserve: View {
    
    @State var time: Int = 30
    @State var price: Double = 10.00
    @State private var selection: String? = nil
    @State private var selectedDuration: Int = 0
    let durations = [0, 5, 10, 15, 20, 30, 45, 60]
    let pricePerMinute = 3.50
    func calculatePrice() -> Double {
        return Double(selectedDuration) * pricePerMinute
    }
    var body: some View {
        ZStack{
            
            NavigationView{
                
                VStack{
                    
                    VStack(alignment: .leading) {
                        Section{
                            Image("scooter").padding(.top, 100)
                        }
                        //Time wheel
                        Section{
                            VStack{
                                HStack{
                                    //Text - time to rent
                                    Section{
                                        Text("Time to rent:")
                                    }
                                    //Wheel - increments
                                    Section{
                                        Picker("Duration", selection: $selectedDuration) {
                                            ForEach(0 ..< durations.count) { index in
                                                Text("\(durations[index]) minutes")
                                            }
                                        }
                                        .pickerStyle(.wheel)
                                    }
                                }
                                HStack{
                                    //Price Info
                                    Section{
                                        HStack{
                                            Spacer()
                                            Text("Price: $\(calculatePrice(), specifier: "%.2f")").font(.title).padding(.leading,15)
                                            Spacer()
                                        }
                                        .padding(.top, 30)
                                    }
                                }
                                //Reserve Button
                                Section{
                                    Button{
                                        
                                    } label: {
                                        Text("Reserve")
                                    }
                                    .frame(width: 220, height: 60, alignment: .center)
                                    .background(Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 30)).padding(.bottom,10)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct reserve_Previews: PreviewProvider {
    static var previews: some View {
        reserve()
    }
}



