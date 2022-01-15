//
//  ContentView.swift
//  CheckOUTS
//
//
/*Dictionary of values have been established but not verified completely
 Checked: 170  ->  150 -- Best possible outcome
 
 39   ->    0 -- My personal choices
 
 Progress: As of right now my goal is to setup the view layout for this screen
 Goals:
 1. Verify that all outs have the correct out
 2. Figure out what to do with inputting the current out and updating everything
 3.
 */

//
//  Created by Justin Trubela on 12/18/21.
//

import SwiftUI

struct OptionText: View {
    var text: String        //takes in some text

    var body: some View {
        Text(text)          //uses that text in some Text and applies modifiers to it
            .font(.subheadline.bold()).italic()
            .frame(minWidth: 50, idealWidth: .infinity, maxWidth: .infinity, minHeight: 30, idealHeight: 30, maxHeight: 30, alignment: .leading)
    }
}

struct OutText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 250, height: 30, alignment: .center)
            .foregroundColor(.black)
            .font(.system(size: 40.0))
    }
}

struct SquareBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(maxWidth: .infinity, maxHeight: 300)
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

struct CapsuleBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(50)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 160))
    }
}
extension View {
    func MakeCapsuledBackground() -> some View {
        modifier(CapsuleBackground())
    }
}




struct ContentView: View {
    // Keyboard Modifier
    @FocusState private var amountIsFocused: Bool
    // View states
    @State private var currentOutView = true
    @State private var newOutView = false
    @State private var changeOutView = false
    // Alerts
    @State private var outSuccessAlert = false
    @State private var noOutFailureAlert = false
    // Variables
    @State private var out = 106
    @State private var currentTurnPoints = 106
    
    @State private var errorMessage = "No Out for this number"
    @State private var outTitle = ""
    @State private var noOutTitle = ""
    

    var body: some View {
        
        ZStack {
//            Color.secondary.ignoresSafeArea()
            
            LinearGradient(
                gradient: Gradient(colors: [.black,.gray]),
                startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            if !newOutView && !changeOutView {
                VStack{
                    VStack{
                        Spacer()
                        //******************TESTING MODULE***********************//
                        //                                                       //
                           TextField("Enter Score", value: $out, format: .number)//
                        /**/  .MakeRoundedSquareBackground()                     //
                        /**/  .frame(width: 80, height: 10, alignment: .center)  //
                        /**/  .padding()                                         //
                        /**/  //Text("\(out)").MakeRoundedSquareBackground()     //
                        //                                                       //
                        //                                                       //
                        //                                                       //
                        //*******************************************************//
                            .foregroundColor(.black)
                            .font(.largeTitle.weight(.heavy))
                            //.keyboardType(.numberPad)
                            //.focused($amountIsFocused)
                            //.frame(width: 150, height: 30, alignment: .center).padding()
                        Text("Remaining")
                            .foregroundColor(.white)
                            .font(.title2)
                            .frame(width: 250, height: 5, alignment: .center)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            //SHOW ALERT
                            outSuccessAlert = true
                        } label: {
                            Image("Hit")
                        }.shadow(radius: 20)
                        Spacer()
                        Button{
                            mainToChangeOutScreen()
                        } label: {
                            Image("Miss")
                        }.shadow(radius: 20)
                        Spacer()
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        Section{
                            //Out choice number 1
                                OutText(text: checkOuts1[out] ?? "No out")
                        } header: {
                            OptionText(text: "     Option 1:")
                        }
                        Spacer()
                        Section{
                                OutText(text: checkOuts2[out] ?? "")
                        } header: {
                            OptionText(text: "     Option 2:")
                        }
                        Spacer()
                        Section{
                            OutText(text: checkOuts3[out] ?? "")
                        } header: {
                            OptionText(text: "     Option 3:")
                        }
                        Spacer()
                    }.MakeRoundedSquareBackground().padding(5)

                    Spacer()
                    Spacer()
                    HStack {
                        Button("New Out      "){
                            mainToNewOutScreen()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .shadow(radius: 10)
                        
                        Button("Chart"){
                            //Go to Out Chart
                            //Navigate to out chart within range of current out
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .shadow(radius: 10)
                    }.foregroundColor(.black).font(.title2)
                    Spacer()
                    Spacer()

    
                }.alert(outTitle, isPresented: $outSuccessAlert) {
                    Button("Continue", action: mainToNewOutScreen)
                    
                } message: {
                    Text("Nice Shot\n Added to your stats")
                }.keyboardType(.numberPad)
                
            }else if !currentOutView && !changeOutView{
                
                ZStack {
                    
                    RadialGradient(stops: [
                        .init(color: Color(red: 0.0 , green: 0.5, blue: 0.0) , location: 0.3),
                        .init(color: .black, location: 0.7),
                    ],   center: .center, startRadius: 0, endRadius: 350).ignoresSafeArea()
                    
                    VStack {
                        VStack{
                            Spacer()
                            Section{
                                TextField("Enter", value: $out, format: .number)
                                    .padding()
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .background(.thinMaterial)
                                    .frame(width: 100, height: 50, alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                            } header: {
                                Text("Enter the out").font(.largeTitle)
                            }
                            Spacer()
                            Button("Get New Out"){
                                
                                if out > 170
                                || out <= 1
                                || out == invalidOuts[0]
                                || out == invalidOuts[1]
                                || out == invalidOuts[2]
                                || out == invalidOuts[3]
                                || out == invalidOuts[4]
                                || out == invalidOuts[5]
                                || out == invalidOuts[6]
                                {
                                    noOutFailureAlert = true
                                    noOutTitle = "No out for this number. Try again"
                                }
                                else{
                                    mainToNewOutScreen()
                                }
                            }.buttonStyle(.borderedProminent)
                                .font(.title)
                                .cornerRadius(20).font(.title3).tint(.black).frame(width: 200, height: 60, alignment: .center)
                            Spacer()
                        }.MakeRoundedSquareBackground()
                    }
                }.alert(noOutTitle, isPresented: $noOutFailureAlert) {
                    Button("Continue", action: changeOutToChangeOut)
                }
            }
            else{
                ZStack {
                    RadialGradient(stops: [
                        .init(color: Color(red: 0.5 , green: 0.0, blue: 0.0) , location: 0.3),
                        .init(color: .black, location: 0.7),
                    ],   center: .center, startRadius: 0, endRadius: 350).ignoresSafeArea()
                    VStack(spacing: 50){
                        //VStack of VStacks
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Checkout missed")
                            .textCase(.uppercase)
                            .foregroundColor(.white)
                            .padding()
                            .fixedSize()
                            .font(.largeTitle)
                        Spacer()
                        Spacer()
                        VStack {
                            Section{
                                TextField("Enter points scored on this turn", value: $currentTurnPoints, format: .number)
                                    .padding()
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .background(.thinMaterial)
                                    .frame(width: 100, height: 50, alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } header: {
                                Text("Enter points scored on this turn").foregroundColor(.white)
                            }
                            
                        }.MakeCapsuledBackground()
                        
                        VStack {
                            Text("Before: \(out)\n")
                            Text("Now Remaining: \n\t\t \(out-currentTurnPoints)")
                            Button("Get New Out", role: .destructive){
                                out = out-currentTurnPoints
                                mainToChangeOutScreen()
                            }
                            .buttonStyle(.borderedProminent)
                            .font(.title)
                            .padding(40)
                        }.foregroundColor(.white).font(.title2).fixedSize()
                        
                        Spacer()
                        Spacer()
                        
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                
                Spacer()
                
                Button("Done"){
                    amountIsFocused = false
                }
            }
        }
        
    }
    
    func changeOutToChangeOut (){
        newOutView = true
    }
    
    func mainToNewOutScreen (){
        currentOutView.toggle()
        newOutView.toggle()
    }
    
    func mainToChangeOutScreen (){
        currentOutView.toggle()
        changeOutView.toggle()
    }
    
    func checkoutSuccess (){
        outSuccessAlert.toggle()
    }
    
    
    let validOuts = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,
                     26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,
                     51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,
                     76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,
                     101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
                     120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,
                     141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,160,161,164,167,170]
    
    let invalidOuts = [169,168,166,165,163,162,159]
    // /**/ = Modified
    let checkOuts1 = [
/**/170:"T20 T20 DB" ,
            
/**/167:"T20 T19 DB" , /**/164:"T20 T18 DB" , /**/161:"T20 T17 DB" , /**/160:"T20 T20 D20",
            
/**/158:"T20 T20 D19", /**/157:"T20 T19 D20", /**/156:"T20 T20 D18", /**/155:"T20 T19 D19",
            
/**/154:"T20 T18 D20", /**/153:"T20 T19 D18", /**/152:"T20 T20 D16", /**/151:"T20 T17 D20", /**/150:"T20 T18 D18",
            
/**/149:"T20 T19 D16", /**/148:"T20 T20 D14", /**/147:"T20 T19 D18", /**/146:"T20 T18 D16", /**/145:"T20 T19 D14",
            144:"T18 T18 D18",  143:"T20 T17 D16",  142:"T20 T14 D20",  141:"T20 T19 D12",  140:"T20 T20 D10",
            
            139:"T20 T13 D20",  138:"T19 T19 D12",  137:"T19 T19 D12",  136:"T20 T20 D8" ,  135:"T20 T17 D12",
            134:"T20 T16 D13",  133:"T20 T19 D8" ,  132:"T20 T16 D12",  131:"T19 T14 D16",  130:"T20 T20 D5",
            
            129:"T20 T19 D6" ,  128:"T18 T14 D16",  127:"T20 T17 D8" ,  126:"T19 T19 D6" ,  125:"T20 T15 D10",
            124:"T20 T14 D11",  123:"T19 T16 D9" ,  122:"T18 T18 D7" ,  121:"T20 T11 D14",  120:"T20 S20 D20",
            
            119:"T19 T12 D13",  118:"T20 S18 D20",  117:"T20 S17 D20",  116:"T19 S19 D20",  115:"T20 S15 D20",
            114:"T19 S17 D20",  113:"T19 S16 D20",  112:"T20 S15 D20",  111:"T20 S11 D20",  110:"T20 T10 D10",
            
            109:"T20 S9 D20" ,  108:"T20 S16 D16",  107:"T20 S16 D16",  /**/106:"T20 T10 D8" ,  105:"T20 S13 D16",
            104:"T19 S15 D16",  103:"T19 S10 D18",  102:"T20 S10 D16",  101:"T20 S9 D16" ,  100:"T20 D20",
            
            99:"T19 S10 D16",   98:"T20 D19",       97:"T19 D20",       96:"T20 D18",       95:"SB, T20 D5",
            94:"SB T19 D6",     93:"T19 D18",       92:"T20 D16",       91:"T17 D20",       90:"T18 D18",
            
            89:"T19 D16",       88:"T16 D20",       87:"T17 D18",       86:"T18 D16",       85:"T15 D20",
            84:"T20 D12",       83:"T17 D16",       82:"T14 D20",       81:"T19 D12",       80:"T20 D10",
            
            79:"T19 D11",       78:"T18 D12",       77:"T19 D10",       76:"T20 D8",        75:"T17 D12",
            74:"T18 D10",       73:"T19 D8",        72:"T16 D12",       71:"T13 D16",       70:"T18 D8",
            
            69:"T19 D6",        68:"T20 D4",        67:"T17 D8",        66:"T10 D18",       65:"T11 D16",
            64:"T16 D8",        63:"T17 D6",        62:"T10 D16",       61:"T15 D8",        60:"S20 D20",
            
            59:"S19 D20",       58:"S18 D20",       57:"S17 D20",       /**/56:"S16 D20",   55:"S15 D20",
            54:"S14 D20",       53:"S17 D18",       52:"T12 D8",        51:"S15 D18",       50:"S18 D16",
            
            49:"S17 D16",       48:"S16 D16",       47:"S7 D20",        46:"S10 D18",       45:"S19 D13",
            44:"S12 D16",       43:"S11 D16",       42:"S10 D16",       41:"S9 D16",        40:"D20",
            
            39:"S7 D16",        38:"D19",           37:"S1 D18",        36:"D18",           35:"S3 D16",
            34:"D17",           33:"S1 D16",        32:"D16",           31:"S15 D8",        30:"D15",
            
            /**/29:"S13 D8",    /**/28:"D14",       /**/27:"S3 D12",    /**/26:"D13",       /**/25:"S17 D4",
            
            /**/24:"D12",       /**/23:"S7 D8",     /**/22:"D11",       /**/21:"S17 D2",    /**/20:"D10",
            
            /**/19:"S3 D8",     /**/18:"D9",        /**/17:"S1 D8",     /**/16:"D8",        /**/15:"S7 D4",
            
            /**/14:"D7",        /**/13:"S3 D5",     /**/12:"D6",        /**/11:"S1 D5",     /**/10:"D5",
            
            /**/9:"S5 D2",      /**/8:"D4",         /**/7:"S5 D1",      /**/6:"D3",         /**/5:"S1 D2",
            
            /**/4:"D2",         /**/3:"S1 D1" ,     /**/2:"D1"
    ]
    let checkOuts2 = [
/**/170:"" ,
            
/**/167:"" , /**/164:"T19 T19 DB" , /**/161:"T19 T18 DB" ,  /**/160:"T20 DB DB",
            
/**/158:"T18 T18 DB" , /**/157:"T19 DB DB", /**/156:"", /**/155:"T20 T15 DB",
            
/**/154:"T19 T19 D20", /**/153:"T19 T20 D18", /**/152:"T19 T19 D19", /**/151:"T19 T18 D20", /**/150:"T19 T19 D18",
            
/**/149:"",  /**/148:"T20 T16 D20",  /**/147:"T20 T17 D18",  /**/146:"T19 T19 D16",  /**/145:"T20 T15 D20",
            144:"T18 T18 D18",  143:"T20 T17 D16",  142:"T20 T14 D20",  141:"T20 T19 D12",  140:"T20 T20 D10",
            
            139:"T20 T13 D20",  138:"T19 T19 D12",  137:"T19 T19 D12",  136:"T20 T20 D8" ,  135:"T20 T17 D12",
            134:"T20 T16 D13",  133:"T20 T19 D8" ,  132:"T20 T16 D12",  131:"T19 T14 D16",  130:"T20 T20 D5",
            
            129:"T20 T19 D6" ,  128:"T18 T14 D16",  127:"T20 T17 D8" ,  126:"T19 T19 D6" ,  125:"T20 T15 D10",
            124:"T20 T14 D11",  123:"T19 T16 D9" ,  122:"T18 T18 D7" ,  121:"T20 T11 D14",  120:"T20 S20 D20",
            
            119:"T19 T12 D13",  118:"T20 S18 D20",  117:"T20 S17 D20",  116:"T19 S19 D20",  115:"T20 S15 D20",
            114:"T19 S17 D20",  113:"T19 S16 D20",  112:"T20 S15 D20",  111:"T20 S11 D20",  110:"T20 T10 D10",
            
            109:"T20 S9 D20" ,  108:"T20 S16 D16",  107:"T20 S16 D16",  /**/106:"T18 S20 D16" ,  105:"T20 S13 D16",
            104:"T19 S15 D16",  103:"T19 S10 D18",  102:"T20 S10 D16",  101:"T20 S9 D16" ,  100:"T20 D20",
            
            99:"T19 S10 D16",   98:"T20 D19",       97:"T19 D20",       96:"T20 D18",       95:"SB, T20 D5",
            94:"SB T19 D6",     93:"T19 D18",       92:"T20 D16",       91:"T17 D20",       90:"T18 D18",
            
            89:"T19 D16",       88:"T16 D20",       87:"T17 D18",       86:"T18 D16",       85:"T15 D20",
            84:"T20 D12",       83:"T17 D16",       82:"T14 D20",       81:"T19 D12",       80:"T20 D10",
            
            79:"T19 D11",       78:"T18 D12",       77:"T19 D10",       76:"T20 D8",        75:"T17 D12",
            74:"T18 D10",       73:"T19 D8",        72:"T16 D12",       71:"T13 D16",       70:"T18 D8",
            
            69:"T19 D6",        68:"T20 D4",        67:"T17 D8",        66:"T10 D18",       65:"T11 D16",
            64:"T16 D8",        63:"T17 D6",        62:"T10 D16",       61:"T15 D8",        60:"S20 D20",
            
            59:"S19 D20",       58:"S18 D20",       57:"S17 D20",       /**/56:"T16 D4",        55:"S15 D20",
            54:"S14 D20",       53:"S17 D18",       52:"T12 D8",        51:"S15 D18",       50:"S18 D16",
            
            49:"S17 D16",       48:"S16 D16",       47:"S7 D20",        46:"S10 D18",       45:"S19 D13",
            44:"S12 D16",       43:"S11 D16",       42:"S10 D16",       41:"S9 D16",        40:"D20",
            
            39:"S7 D16",        38:"D19",           37:"S1 D18",        36:"D18",           35:"S3 D16",
            34:"D17",           33:"S1 D16",        32:"D16",           31:"S15 D8",        30:"D15",
            
            /**/29:"S3 D13",    /**/28:"S8 D10",    /**/27:"S7 D10",    /**/26:"S10 D8",    /**/25:"S9 D8",
            
            /**/24:"S8 D8",     /**/23:"S3 D10",    /**/22:"S6 D8",     /**/21:"S19 D1",    /**/20:"",
            
            /**/19:"S17 D1",    /**/18:"S10 D4",    /**/17:"S7 D5",     /**/16:"",          /**/15:"S5 D5",
            
            /**/14:"",          /**/13:"S5 D4",     /**/12:"",          /**/11:"S3 D4",     /**/10:"",
            
            /**/9:"S1 D4",      /**/8:"",           /**/7:"S3 D2",      /**/6:"",           /**/5:"S3 D1",
            
            /**/4:"",           /**/3:"" ,          /**/2:""
    ]
    let checkOuts3 = [
/**/170:"" ,
    
/**/167:"" ,  /**/164:"" ,  /**/161:"T17 T20 DB" ,  /**/160:"",
    
/**/158:"" ,  /**/157:"",   /**/156:"",  /**/155:"T18 T17 DB" ,
    
/**/154:"T18 DB DB",  /**/153:"",  /**/152:"T20 T14 DB",  /**/151:"T17 DB DB",  /**/150:"T20 T20 D15",
    
/**/149:"",  /**/148:"T18 T18 D20",  /**/147:"",  /**/146:"T20 T20 D13",  /**/145:"T19 T16 D20",
            144:"T18 T18 D18",  143:"T20 T17 D16",  142:"T20 T14 D20",  141:"T20 T19 D12",  140:"T20 T20 D10",
            
            139:"T20 T13 D20",  138:"T19 T19 D12",  137:"T19 T19 D12",  136:"T20 T20 D8" ,  135:"T20 T17 D12",
            134:"T20 T16 D13",  133:"T20 T19 D8" ,  132:"T20 T16 D12",  131:"T19 T14 D16",  130:"T20 T20 D5",
            
            129:"T20 T19 D6" ,  128:"T18 T14 D16",  127:"T20 T17 D8" ,  126:"T19 T19 D6" ,  125:"T20 T15 D10",
            124:"T20 T14 D11",  123:"T19 T16 D9" ,  122:"T18 T18 D7" ,  121:"T20 T11 D14",  120:"T20 S20 D20",
            
            119:"T19 T12 D13",  118:"T20 S18 D20",  117:"T20 S17 D20",  116:"T19 S19 D20",  115:"T20 S15 D20",
            114:"T19 S17 D20",  113:"T19 S16 D20",  112:"T20 S15 D20",  111:"T20 S11 D20",  110:"T20 T10 D10",
            
            109:"T20 S9 D20" ,  108:"T20 S16 D16",  107:"T20 S16 D16",  /**/106:"S20 SB D16" ,  105:"T20 S13 D16",
            104:"T19 S15 D16",  103:"T19 S10 D18",  102:"T20 S10 D16",  101:"T20 S9 D16" ,  100:"T20 D20",
            
            99:"T19 S10 D16",   98:"T20 D19",       97:"T19 D20",       96:"T20 D18",       95:"SB, T20 D5",
            94:"SB T19 D6",     93:"T19 D18",       92:"T20 D16",       91:"T17 D20",       90:"T18 D18",
            
            89:"T19 D16",       88:"T16 D20",       87:"T17 D18",       86:"T18 D16",       85:"T15 D20",
            84:"T20 D12",       83:"T17 D16",       82:"T14 D20",       81:"T19 D12",       80:"T20 D10",
            
            79:"T19 D11",       78:"T18 D12",       77:"T19 D10",       76:"T20 D8",        75:"T17 D12",
            74:"T18 D10",       73:"T19 D8",        72:"T16 D12",       71:"T13 D16",       70:"T18 D8",
            
            69:"T19 D6",        68:"T20 D4",        67:"T17 D8",        66:"T10 D18",       65:"T11 D16",
            64:"T16 D8",        63:"T17 D6",        62:"T10 D16",       61:"T15 D8",        60:"S20 D20",
            
            59:"S19 D20",       58:"S18 D20",       57:"S17 D20",       /**/56:"T8 D16",    55:"S15 D20",
            54:"S14 D20",       53:"S17 D18",       52:"T12 D8",        51:"S15 D18",       50:"S18 D16",
            
            49:"S17 D16",       48:"S16 D16",       47:"S7 D20",        46:"S10 D18",       45:"S19 D13",
            44:"S12 D16",       43:"S11 D16",       42:"S10 D16",       41:"S9 D16",        40:"D20",
            
            39:"S7 D16",        38:"D19",           37:"S1 D18",        36:"D18",           35:"S3 D16",
            34:"D17",           33:"S1 D16",        32:"D16",           31:"S15 D8",        30:"D15",
            
            /**/29:"S7 D11",    /**/28:"S16 D6",    /**/27:"S19 D4",    /**/26:"S6 D10",    /**/25:"S5 D10",
            
            /**/24:"S16 D4",    /**/23:"S19 D2",    /**/22:"S10 D6",    /**/21:"S1 D10",    /**/20:"",
            
            /**/19:"S9 D5",     /**/18:"S6 D6",     /**/17:"S13 D2",    /**/16:"",          /**/15:"S3 D6",
            
            /**/14:"",          /**/13:"S1 D6",     /**/12:"",          /**/11:"S7 D2",     /**/10:"",
            
            /**/9:"S3 D3",      /**/8:"",           /**/7:"",           /**/6:"",           /**/5:"",
            
            /**/4:"",           /**/3:"" ,          /**/2:""
    ]
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
