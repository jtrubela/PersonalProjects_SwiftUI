//
//  ContentView.swift
//  Pay Calculator
//
//  Created by Justin Trubela on 7/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var payRate = 17.5
    @State var overtimePay = 26.25
    @State var taxRate = 0.7901
    
    @State var grossPay = 0.00
    @State var netPay = 0.00
    
    @State var overtimeHours = 0.0
    @State var regularHours = 40.0
    @State var maxRegularHours = 80.0
    

    //Week 1 Hours
    @State var sunday1Hours = 0.0
    @State var monday1Hours = 9.0
    @State var tuesday1Hours = 9.0
    @State var wednesday1Hours = 9.0
    @State var thursday1Hours = 9.0
    @State var friday1Hours = 9.0
    @State var saturday1Hours = 0.0
        
        @State var week1Hours = 0.0
        @State var week1OvertimeHours = 0.0
    
    //Week 2 Hours
    @State var sunday2Hours = 0.0
    @State var monday2Hours = 8.0
    @State var tuesday2Hours = 8.0
    @State var wednesday2Hours = 8.0
    @State var thursday2Hours = 8.0
    @State var friday2Hours = 8.0
    @State var saturday2Hours = 0.0
    
        @State var week2Hours = 0.0
        @State var week2OvertimeHours = 0.0

    
    var body: some View {
        
        //Calculate all of week 1 hours
        let week1Hours = (sunday1Hours + monday1Hours + tuesday1Hours + wednesday1Hours + thursday1Hours + friday1Hours + saturday1Hours)
        //Calculate all of overtime hours worked in week 1
        let week1OvertimeHours = week1Hours - regularHours
        //Calculate all of week 2 hours
        let week2Hours = (sunday2Hours + monday2Hours + tuesday2Hours + wednesday2Hours + thursday2Hours + friday2Hours + saturday2Hours)
        //Calculate all of overtime hours worked in week 2
        let week2OvertimeHours = week2Hours - regularHours
        
        //Calculate all hours worked
        let totalHours = week1Hours + week2Hours
        //Calculate all overtime hours worked
        let totalOvertimeHours = week1OvertimeHours + week2OvertimeHours
        
        //Calculate gross Pay
        let grossPay = ((totalHours) * payRate) + (overtimeHours * overtimePay)
        //Calculate net pay
        let netPay = ((totalHours) * payRate) + (overtimeHours * overtimePay) * taxRate




        


// BACKGROUND
        
        ZStack {
            Image("background")
                .ignoresSafeArea()

            VStack {
                Text("   Welcome to your \npaycheck calculator!")
                    .foregroundColor(.black)
                    .padding().padding()
                    .font(.title)
             
// PAY/TAX INFORMATION
                VStack {
                    
                    VStack {
                        Text("\nEnter your Pay rate").underline().foregroundColor(.blue)
                        //Insert input box for rate
                        Text(String(format: "%.2f", payRate))
                            .foregroundColor(Color.black)
                    }
     
                    VStack {
                        Text("Enter your Tax rate").underline()
                        //Insert input box for rate
                        Text(String(format: "%.2f", taxRate))
                            .foregroundColor(Color.black)


                    }.padding()

                }
                .foregroundColor(.blue)
                .background(Color.white)
                //.border(Color.black)
                .cornerRadius(15.0)
                
                                
// WEEKLY DATA
                VStack{
                    Text("Insert daily hours in the designated day").foregroundColor(Color.black).underline().padding()
                    

                
                //Insert daily hours input text box
    // WEEK 1 DATA
                    VStack{
                        Text("Week 1").bold().underline()
                        HStack{
                            VStack {
                                Text("Sun")
                                //
                                Text(String(format: "%.2f", sunday1Hours))
                            }
                            VStack {
                                Text("Mon")
                                //
                                Text(String(format: "%.2f", monday1Hours))

                            }
                            VStack {
                                Text("Tue")
                                //
                                Text(String(format: "%.2f", tuesday1Hours))

                            }
                            VStack {
                                Text("Wed")
                                //
                                Text(String(format: "%.2f", wednesday1Hours))

                            }
                            VStack {
                                Text("Thu")
                                //
                                Text(String(format: "%.2f", thursday1Hours))

                            }
                            VStack {
                                Text("Fri")
                                //
                                Text(String(format: "%.2f", friday1Hours))

                            }
                            VStack {
                                Text("Sat")
                                //
                                Text(String(format: "%.2f", saturday1Hours))

                            }
                            VStack{
                                Text("Totals")
                                //
                                Text(String(format: "%.2f", week1Hours))
                            }.foregroundColor(.green)
                            
                            
                        }.padding()
                    }.background(Color.gray).cornerRadius(10.0)//VSTACK WEEK 1 INPUT

    // WEEK 2 DATA
                    VStack{
                        Text("Week 2").bold().underline()
                        HStack{
                            VStack {
                                Text("Sun")
                                //
                                Text(String(format: "%.2f", sunday2Hours))
                            }
                            VStack {
                                Text("Mon")
                                //
                                Text(String(format: "%.2f", monday2Hours))

                            }
                            VStack {
                                Text("Tue")
                                //
                                Text(String(format: "%.2f", tuesday2Hours))

                            }
                            VStack {
                                Text("Wed")
                                //
                                Text(String(format: "%.2f", wednesday2Hours))

                            }
                            VStack {
                                Text("Thu")
                                //
                                Text(String(format: "%.2f", thursday2Hours))

                            }
                            VStack {
                                Text("Fri")
                                //
                                Text(String(format: "%.2f", friday2Hours))

                            }
                            VStack {
                                Text("Sat")
                                //
                                Text(String(format: "%.2f", saturday2Hours))

                            }
                            VStack{
                                Text("Totals")
                                //
                                Text(String(format: "%.2f", week2Hours))
                            }.foregroundColor(.green)
                            
                            
                        }.padding()//HSTACK WEEKDAY TITLES
                    }.background(Color.gray).cornerRadius(10.0)//VSTACK WEEK 2 INPUT
                }
                //VSTACK WEEKLY INPUT
                

                
                .padding().padding().padding()
                
// CALCULATION and RESET BUTTONS
                
                
                HStack {
                    Button(action: {
                        
                        //Calculate and show the user the overage of overtime hours
                        if totalHours >= maxRegularHours {
                            print("Regular Hours: \(maxRegularHours)")
                            print("Overtime Hours: \(totalOvertimeHours)")
                            print("Gross Pay:$\(grossPay)")
                            print("Net Pay:$\(netPay)")
                        }
                        else {
                            print("Regular Hours: \(totalHours)")
                        }
                        
                        
                        
                        print("Your paycheck has been calculated")
                    }, label: {
                        
                        HStack {
                            Image(systemName: "play")
                            Text("Calculate")
                        }
                        .frame(width: 150, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(20.0)
                        
                    })
                    
                    
                    Button {
                        sunday1Hours = 0.00
                        monday1Hours = 0.00
                        tuesday1Hours = 0.00
                        wednesday1Hours = 0.00
                        thursday1Hours = 0.00
                        friday1Hours = 0.00
                        saturday1Hours = 0.00
                        
                        sunday2Hours = 0.00
                        monday2Hours = 0.00
                        tuesday2Hours = 0.00
                        wednesday2Hours = 0.00
                        thursday2Hours = 0.00
                        friday2Hours = 0.00
                        saturday2Hours = 0.00
                        
                        print("Values have been reset")
                    } label: {
                        
                        HStack {
                            Image(systemName: "trash")
                            Text("Reset")
                        }
                        .frame(width: 90, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(20.0)
                    }

            }//VSTACK OF ALL ELEMENTS
                //1. Title
                //2. Pay and Tax information
                //3. Weekly input
                //4. Calculateion/Reset Button Button
                
        }//Entire ZSTACK -
                //everything on top of background
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}


struct PayCalc: View {
    @State var payRate = 17.5
    @State var overtimePay = 26.25
    @State var taxRate = 0.7901
    
    @State var grossPay = 0.00
    @State var netPay = 0.00
    
    @State var overtimeHours = 0.0
    @State var regularHours = 40.0
    @State var maxRegularHours = 80.0
    
    
    //Week 1 Hours
    @State var sunday1Hours = 0.0
    @State var monday1Hours = 9.0
    @State var tuesday1Hours = 9.0
    @State var wednesday1Hours = 9.0
    @State var thursday1Hours = 9.0
    @State var friday1Hours = 9.0
    @State var saturday1Hours = 0.0
    
    @State var week1Hours = 0.0
    @State var week1OvertimeHours = 0.0
    
    //Week 2 Hours
    @State var sunday2Hours = 0.0
    @State var monday2Hours = 8.0
    @State var tuesday2Hours = 8.0
    @State var wednesday2Hours = 8.0
    @State var thursday2Hours = 8.0
    @State var friday2Hours = 8.0
    @State var saturday2Hours = 0.0
    
    @State var week2Hours = 0.0
    @State var week2OvertimeHours = 0.0

    
    var body: some View {
        ZStack{
            
        }
    }
}
