//
//  checkout.swift
//  MScoots
//
//  Created by Vincent Cavallaro on 4/19/23.
//

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
                    .MakeMyBackground()
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
