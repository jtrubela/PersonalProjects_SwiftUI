//
//  Checkout.swift
//  CheckOUTS
//
//  Created by Justin Trubela on 4/16/22.
//

import Foundation

struct Checkout: Codable {
    var checkoutOptions: [[String : Out]]
}

struct Out: Codable {
    var out: String
}

struct Checkouts {
    // JSON files
    let Checkout1: Checkout = Bundle().decode("CheckoutOption1.json")
    let Checkout2: Checkout = Bundle().decode("CheckoutOption2.json")
    let Checkout3: Checkout = Bundle().decode("CheckoutOption3.json")
    
    //Constant Data
    let validOuts = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,
                     26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,
                     51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,
                     76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,
                     101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
                     120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,
                     141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,160,161,164,167,170]
    
    let invalidOuts = [169,168,166,165,163,162,159]
    
    let practiceNumbers =
    [
        "T1", "D1", "S1","T2", "D2", "S2","T3", "D3", "S3","T4", "D4", "S4","T5", "D5", "S5","T6", "D6", "S6","T7", "D7", "S7","T8", "D8", "S8","T9", "D9", "S9","T10", "D10", "S10","T11", "D11", "S11","T12", "D12", "S12","T13", "D13", "S13","T14","D14", "S14","T15", "D15", "S15","T16", "D16", "S16","T17", "D17","S17","T18", "D18", "S18","T19", "D19", "S19","T20", "D20", "S20", "DB", "SB"
    ]
    
}
