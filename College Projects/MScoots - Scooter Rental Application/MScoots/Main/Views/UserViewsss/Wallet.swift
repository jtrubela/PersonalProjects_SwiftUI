//
//  Home.swift
//  MScoots
//
//  Created by Lennyn Stephano Prado on 4/16/23.
//

import SwiftUI

struct WalletView: View {
    // MARK: - CARD ANIAMTION PROPERTIES
    // TODO: 562 × 444
    @State var expandCards: Bool = false
    @State var isShowingNewCard = false
    @State var Name: String = ""
    @State var Card_num: String = ""
    @State var Ex_Year: String = ""
    @State var CVV: String = ""
    @State var Zip_Code: String = ""
    @State var Billing: String = ""
    @State var showAlert = false
    
    // MARK: TRANSACTION LIST PROPERTIES
    @State var currentCard: Card?
    @State var showDetailTransaction: Bool = false
    @Namespace var animation
    
    var body: some View {
        ZStack{
            VStack(spacing: 50) {
                HStack{
                    
                    
                    
                    Text("Wallet").padding(.leading, 75)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: expandCards ? .leading : .center)
                        .padding(.horizontal)
                        .overlay(alignment: .trailing) {
                            // MARK: CLOSE BUTTON
                            Button {
                                // MARK: CLOSE ON TOUCH
                                withAnimation(
                                    .interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                                        expandCards = false
                                    }
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(.pink, in: Circle())
                            }
                            .offset(x: expandCards ? 10 : 15)
                            .opacity(expandCards ? 1 : 0)
                        }
                        .padding(.horizontal, 35)
                        .padding(.bottom, 10)
                    
                    NavigationLink(destination: HamburgerMenuView()) {
                        HamburgerMenu()
                    }.padding(.trailing, 10)
                }
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        // MARK: - CARD LIST
                        ForEach(cards) {card in
                            Group {
                                if currentCard?.id == card.id {
                                    CardView(card: card)
                                } else {
                                    CardView(card: card)
                                        .matchedGeometryEffect(id: card.id, in: animation)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.35)) {
                                    currentCard = card
                                    showDetailTransaction = true
                                }
                            }
                        }
                    }
                    .overlay {
                        Rectangle()
                            .fill(.black.opacity(expandCards ? 0 : 0.01))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.35)) {
                                    expandCards = true
                                }
                            }
                    }
                    .padding(.top, expandCards ? 30 : 0)
                    
                }
                .coordinateSpace(name: "SCROLL")
                .offset(y: expandCards ? 0 : 30)
                
                // MARK: ADD BUTTON
                Button {
                    //TODO: sheet presenter cxhange to true
                    isShowingNewCard.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(.green, in: Circle())
                }
                .scaleEffect(expandCards ? 0.01 : 1)
                .opacity(!expandCards ? 1 : 0)
                .frame(height: expandCards ? 0 : nil)
                .padding(.bottom, expandCards ? 0 : 30)
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding([.horizontal, .top])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $isShowingNewCard) {
            ZStack {
                Color.black.ignoresSafeArea()
                
                Rectangle().foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 350)
                    .rotationEffect(.degrees(135))
                    .offset(y: -440)
                VStack{
                    HStack{
                        Text("Add New Card")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold, design: .rounded)).padding(.leading, 30)
                        
                        Spacer()
                        Button{}label:{
                            VStack{
                                Rectangle().frame(width: 20,height: 3,alignment: .center).clipShape(RoundedRectangle(cornerRadius: 10))
                                Rectangle().frame(width: 20,height: 3,alignment: .center).clipShape(RoundedRectangle(cornerRadius: 10))
                                Rectangle().frame(width: 20,height: 3,alignment: .center).clipShape(RoundedRectangle(cornerRadius: 10))
                            }.foregroundColor(.white)
                        }.padding(.trailing, 30)
                        
                    }
                    ZStack {
                        
                        
                        VStack{
                            HStack{
                                Text("Add New Card")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold, design: .rounded)).padding(.leading, -100)
                                
                            }
                            Image("Wallet")
                            TextField("Name", text: $Name)
                                .padding(20).frame(width: 350, height: 50, alignment: .center)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .font(.title2)
                                .textFieldStyle(.plain)
                                .padding(10)
                            
                            
                            TextField("Card Number", text: $Card_num) .padding(20).frame(width: 350, height: 50, alignment: .center)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .font(.title2)
                                .textFieldStyle(.plain)
                                .padding(10)
                            TextField("Ex. Year", text: $Ex_Year) .padding(20).frame(width: 350, height: 50, alignment: .center)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .font(.title2)
                                .textFieldStyle(.plain)
                                .padding(10)
                            TextField("CVV", text: $CVV) .padding(20).frame(width: 350, height: 50, alignment: .center)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .font(.title2)
                                .textFieldStyle(.plain)
                                .padding(10)
                            
                            HStack{
                                Text("* Number on back of the card*")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .bold, design: .rounded)).padding(.leading, -90)
                            }
                            TextField("Zip Code", text: $Zip_Code).padding(20).frame(width: 350, height: 50, alignment: .center)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .font(.title2)
                                .textFieldStyle(.plain)
                                .padding(10)
                            
                            
                            
                            
                            
                            Button{
                                cards.append(Card(name: Name, cardNumber: Card_num, cardImage: "card4"))
                            }label:{
                                Text("Add to Wallet")
                            }.buttonStyle(.borderedProminent)
                        }
                        .padding(50)
                        
                    }
                }
                
            }
        }
        
        
    }
    
    // MARK: CARD VIEW
    @ViewBuilder
    func CardView(card: Card)->some View {
        GeometryReader {proxy in
            
            let rect = proxy.frame(in: .named("SCROLL"))
            let offset = CGFloat(getIndex(Card: card) * (expandCards ? 10 : 70))
            
            ZStack(alignment: .bottomLeading) {
                
                // MARKK - CARD BACKGROUND
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                // MARK: - CARD DETAILS
                VStack(alignment: .leading, spacing: 10) {
                    
                    
                    Text(card.name)
                        .fontWeight(.bold)
                    
                    Text(hideCardNumber(number:card.cardNumber))
                        .font(.callout)
                        .fontWeight(.bold)
                }
                .padding()
                .padding(.bottom, 10)
                .foregroundColor(.white)
            }
            .offset(y: expandCards ? offset: -rect.minY + offset)
        }
        .frame(height: 200)
        .padding(.horizontal)
    }
    
    // MARK: - GET CARD INDEX NUMBER
    func getIndex(Card: Card)-> Int {
        return cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
}

// MARK: - HIDE FIRST FEW DIGIT
func hideCardNumber(number: String)->String {
    var newValue: String = ""
    let maxCount = number.count - 4
    
    number.enumerated().forEach {value in
        if value.offset >= maxCount {
            let string = String(value.element)
            newValue.append(contentsOf: string)
            
        } else {
            // MARK: - SHOW START
            let string = String(value.element)
            if string == " " {
                newValue.append(contentsOf: " ")
            } else {
                newValue.append(contentsOf: "*")
            }
        }
    }
    return newValue
}

// MARK: DETAIL TRANSACITON VIEW

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
