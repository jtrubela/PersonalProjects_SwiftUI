//
//  QRCode.swift
//  MScoots
//
//  Created by Justin Trubela on 4/27/23.
//

import Foundation



struct QRCode: Identifiable{
        let id: String
        let type: String // could be "rental" or "return"
        let scooterId: String
        let rentalTime: Date?
        let returnTime: Date?
}
    
    

/*This struct has the following attributes:
    
id: a unique identifier for the QR code.
    type: specifies the purpose of the QR code, whether it is for renting or returning a scooter.
        scooterId: the unique identifier of the scooter associated with this QR code.
        rentalTime: the time at which the scooter was rented (if applicable).
        returnTime: the time at which the scooter was returned (if applicable).
        You can customize the attributes of this struct as per your requirements.
        
        
        
        
        jtrubela@icloud.com
        should it conform to any protocols?
        It depends on your specific needs, but there are a few protocols that might be relevant for a QRCode struct, such as:
            
            Equatable: If you need to compare QRCode instances for equality.
                Codable: If you need to encode and decode QRCode instances to and from a data format such as JSON or plist.
                Hashable: If you need to use QRCode instances as keys in a dictionary or as elements in a set.
                You can choose to conform to any or all of these protocols depending on your requirements.
                
                
*/
                
                


