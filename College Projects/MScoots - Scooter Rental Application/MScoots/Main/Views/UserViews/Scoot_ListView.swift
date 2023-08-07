//
//  Scoot_ListView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/3/23.
//
import SwiftUI
import Firebase


struct Scoot_ListView: View {
    @ObservedObject var Firestore = Firebase_Firestore()
    
    let scooterChargers =
    [
        "Green",    //
        "Yellow",   //
        "Red",      //
        "Blue",     //
        "Black",    //
        "Pink",     //
        "Orange",   //
        "Purple",   //
        "Brown",    //
    ]
    
    @State var selectedCharger = "Blue"

    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        NavigationLink(destination: HamburgerMenuView()) {
                            HamburgerMenu()
                        }
                        .padding(.bottom, 50)
                            .padding(.trailing, 20)
                    }
                    List{
                        ForEach(Firestore.Scoot_list.filter{ $0.nearestCharger
                            == selectedCharger }){ scooter in
                            HStack{
                                //List Item
                                Section{
//                                    VStack{
//                                        //Divider
//                                        Rectangle().size(width: 400, height: 3).padding(.horizontal)
//                                        HStack{
//                                            //Scooter Location
//                                            Text(scooter.location)
//                                                .frame(width: 80, height: 60, alignment: .leading)
//                                                .font(Font.system(size: 16)).multilineTextAlignment(.leading).padding(.horizontal)
//                                            //Scooter Image & #
//                                            VStack{
//                                                
//                                                Image("scooterList").font(.system(size: 20))
//                                                Text(scooter.ScooterID.suffix(3))
//                                            }
//
//
//
//                                            //Availability items
//                                            Section{
//                                                VStack{
//                                                    Text("Availability").font(.caption)
//                                                    if scooter.isAvailable == "1" {
//                                                        Image(systemName: "arrowtriangle.up.fill").foregroundColor(.green)
//                                                    }
//                                                    else if scooter.isAvailable == "0" {
//                                                        Image(systemName: "arrowtriangle.up.fill").foregroundColor(.yellow)
//                                                        
//                                                    }
//                                                    else if scooter.isAvailable == "-1" {
//                                                        Image(systemName: "arrowtriangle.up.fill").foregroundColor(.red)
//                                                        
//                                                    }
//                                                    else {
//                                                        Image(systemName: "arrowtriangle.down.fill").foregroundColor(.black)
//                                                        
//                                                    }
//                                                    
//                                                    Text("Battery").font(.caption)
//                                                    Image(sysyemName: " \(scooter.battery)").font(.caption)
//                                                }
//                                                .frame(width: 70, height: 30, alignment: .center)
//                                                .padding(.horizontal)
//                                                
//                                            }
//                                            
//                                            
//                                            //Charger items
//                                            VStack{
//                                                Text("Charger").font(.caption)
//                                                if scooter.nearestCharger == "Green" {
//                                                    Image(systemName: "circle.fill").foregroundColor(.green)
//                                                }
//                                                else if scooter.nearestCharger == "Yellow" {
//                                                    Image(systemName: "circle.fill").foregroundColor(.yellow)
//                                                }
//                                                else if scooter.nearestCharger == "Red" {
//                                                    Image(systemName: "circle.fill").foregroundColor(.red)
//                                                }
//                                                else if scooter.nearestCharger == "Blue" {
//                                                    Image(systemName: "circle.fill").foregroundColor(.blue)
//                                                }
//                                                else if scooter.nearestCharger == "Black" {
//                                                    Image(systemName: "circle.fill").foregroundColor(.black)
//                                                }
//                                                else if scooter.nearestCharger == "Pink" {
//                                                    Image(systemName: "circle.fill").foregroundColor(.pink)
//                                                }
//                                                else if scooter.nearestCharger == "Purple" {
//                                                    Image(systemName: "circle.fill").foregroundColor(.purple)
//                                                }
//                                                else {
//                                                    Image(systemName: "circle.fill").foregroundColor(.brown)
//                                                }
//                                            }
//                                            .frame(width: 70, height: 30, alignment: .center)
//                                            .padding(.horizontal)
//
//                                           
//                                                                                    
//
//                                        }
//                                    }
                                }

                            }
                            .background(
                                Color.white
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            )
                        }

                    }
                    //Charger Selection
                        VStack{
                            Text("Filter by charger Location:")
                            Picker("Select an availability", selection: $selectedCharger) {
                                ForEach(scooterChargers, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.wheel)
                        }.padding(.horizontal)
                }
                .listStyle(InsetListStyle())

            }
            .navigationTitle("Scoots")
        }.navigationBarBackButtonHidden(true)
        .onAppear(
            perform: Firestore.getScootData
        )
    }

}

struct ScooterListView_Previews: PreviewProvider {
    static var previews: some View {
        Scoot_ListView()
    }
}
