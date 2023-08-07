//
//  ContentView.swift
//  Stash House
//
//  Created by Justin Trubela on 6/30/23.
//
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Hello World")
            }
            .navigationTitle("ListKeeper")
            
            .toolbar {
                HStack(spacing: 150){
                    Button{
                        //Add New List Functionality
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
