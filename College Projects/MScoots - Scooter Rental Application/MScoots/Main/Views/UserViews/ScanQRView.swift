//
//  ScanQRView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/15/23.
//

import SwiftUI
import CodeScanner

struct ScanQRView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Click to Scan a QR code to get started"
    
    //Demo Scooter QR
    private var demoScooter = "Scooter 009"
    
    var scannerSheet : some View {
        ZStack{
            VStack{
                CodeScannerView(
                    codeTypes: [.qr],
                    completion: { result in
                        if case .success(_) = result {
                            if case let .success(code) = result {
                                //QR code scanned(scannedCode) is demo scooter
                                self.scannedCode = code.string
                                self.isPresentingScanner = false
                            }
                        }
                    }
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    var body: some View {
        if scannedCode == "Scooter 009"{
            Scoot_CheckoutView().navigationBarBackButtonHidden(true)
        }
        else{
            NavigationView{
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
                    
                    VStack(spacing: 10){
                        HStack{
                            Spacer()
                            Text("Scanner")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            
                            Spacer()
                            Spacer()
                            HamburgerMenu().foregroundColor(.white)
                        }
                        .padding(.leading, 80)
                        HStack{
                            NavigationLink(destination: HamburgerMenuView()) {
                                HamburgerMenu()
                                    .padding(.leading, 350)
                            }
                            
                        }
                        
                        Spacer()
                        Image(systemName: "qrcode.viewfinder")
                            .font(.system(size: 110))
                        Text(scannedCode).foregroundColor(.white).font(.title2)
                        Button{
                            self.isPresentingScanner = true
                        } label:{
                            VStack{
                                Image(systemName: "qrcode.viewfinder")                            .font(.system(size: 130))
                                
                                Text("Scan QR Code")
                                    .font(.system(size: 30))
                                
                                
                            }.foregroundColor(.blue)
                        }.sheet(isPresented: $isPresentingScanner) {
                            self.scannerSheet
                        }
                        Spacer()
                    }
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
struct ScanQRView_Previews: PreviewProvider {
    static var previews: some View {
        ScanQRView()
    }
}
