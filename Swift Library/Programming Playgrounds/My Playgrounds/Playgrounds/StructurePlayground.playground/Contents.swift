import UIKit

struct DatabaseManager{
    
    func saveData(data:String) -> Bool {
        
        // This code saves the data and returns a boolean value
        return true
    }
}



struct ChatView {
    
    var message = "Hello"
    
    //Methods
    func sendChat () {
        // Code to send the chat message
        // anything written in here cannot be used outside of this method
        var db = DatabaseManager()
        let successful = db.saveData(data: message)
    }
    
}



