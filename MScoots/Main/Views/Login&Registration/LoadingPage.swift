//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI
import Firebase


struct LoadingPage: View {
    @ObservedObject var model = Firebase_Authorization()
    
    var Title: String = "WELCOME TO MScoots"
    var BodyText: String = "MSU Logo"
    var ImageItem: String = "MSU Logo"
    
    var body: some View {
        ZStack{
            MyLinearGradientView()
            
            VStack{
                Text(Title)
                    .padding(.bottom, 50)
                
                Image(BodyText)
            }
            
            .padding(.bottom, 60)
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundColor(.white)
        }.navigationBarBackButtonHidden(true)
    }
}

struct LoadingView: View {
    @ObservedObject var model = Firebase_Authorization()
    
    @State var showLoading = Firebase_Authorization().showLoading
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.75)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ProgressView()
                Text("Loading...")
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: 200, height: 200)
            }
            .offset(y: -70)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct MyLinearGradientView: View {

    // The body of the view - this is where we define the content of the view
    var body: some View {

        // Create a linear gradient with a gradient from black to white
        // The gradient starts at the top left corner of the view and ends at the bottom right corner
        LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)

        // Ignore the safe area insets of the device
            .ignoresSafeArea()
    }
}


