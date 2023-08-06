// User.swift

import Foundation


class studentUser: Identifiable, Decodable {
    var id = UUID().uuidString
    var CWID: String
    var email: String
    var first_name: String
    var last_name: String
    
    struct Address: Decodable {
        var street: String
        var city: String
        var zipcode: String
        //Would be fantastic to get maps working so we can use this and store to Firestore
        //        var geo: Geo
        //
        //        struct Geo: Decodable {
        //            var lat: String
        //            var lng: String
        //        }
    }
    
    init(CWID: String, email: String, first_name: String, last_name: String) {
        self.CWID = CWID
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
    }
}


