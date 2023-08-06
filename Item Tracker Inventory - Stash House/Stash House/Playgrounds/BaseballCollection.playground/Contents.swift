import UIKit
//*************************************************
//  Create a class that will create an object
//  of a baseball card object which creates
//  an inventory of baseball cards I own
//*************************************************
class Card {
    
    //*********************************************
    //  Declare variables for card attributes
    //*********************************************
    var type = ""
    var company = ""
    var manufactured = 0

    var name = ""
    var playerTeam = ""
    
    var cardNumber = 0
    var numberOfCards = 0
    
    //*********************************************
    //  Design init function to collect the data
    //*********************************************
    init(_ company: String,_ manufactured: Int,_ cardNumber: Int,
         _ type: String, _ name: String,_ playerTeam: String){
        
        self.type = type
        self.company = company
        self.manufactured = manufactured
        
        self.name = name
        self.playerTeam = playerTeam

        self.cardNumber = cardNumber
        
        //**********************************************
        //  Anytime a card is made increase num of cards
        //**********************************************
    }
    

    func printCard(){
        print("Company: \(company), Year Made: \(manufactured), Name:\(name), Card Number:\(numberOfCards),     Number Of Baseball Cards: \(numberOfCards)")
        
    }
    
    func add_To_Card_Count () {
        numberOfCards += 1
    }
    
}


class BaseballCard : Card{
    
   var baseball_Card_Count = 0
        
    override func printCard() {
        
        var seriesSize: Int?
        
        print("This is a Baseball card")
        if manufactured == 1989 && company == "topps"{
            seriesSize = 724
        }
        print("Company:\(company),     Year Made: \(manufactured),     Player Name: \(name),     Card Number: \(cardNumber)/\(seriesSize ?? 0),     Number Of Baseball Cards: \(baseball_Card_Count)")
    }

    override func add_To_Card_Count() {
        baseball_Card_Count += 1
    }

}

let card1 = BaseballCard("topps", 1989, 663, "player", "David Cone", "Mets")
card1.add_To_Card_Count()
card1.printCard()

let card2 = BaseballCard("topps", 1989, 663, "player", "David Cone", "Mets")
card2.add_To_Card_Count()
card2.printCard()

BaseballCard("topps", 1989, 700, "turn back the clock", "Don Mattingly", "Yankees").printCard()

BaseballCard("topps", 1989, 663, "player", "David Cone", "Mets").printCard()

BaseballCard("topps", 1989, 700, "turn back the clock", "Don Mattingly", "Yankees").printCard()

BaseballCard("topps", 1989, 405, "all star", "Roger Clemens", "Red Sox").printCard()

BaseballCard("topps", 1989, 157, "team leaders", "", "Yankees").printCard()

BaseballCard("topps", 1989, 490, "all star rookie", "Chris Sabo", "Reds").printCard()

BaseballCard("topps", 1989, 764, "#1 draft pick", "Robin Ventura", "White Sox").printCard()

BaseballCard("upper deck", 1989, 639, "player", "Bill Buckner", "Royals").printCard()

BaseballCard("topps", 1989, 6, "record breaker", "Doug Jones", "Indians").printCard()

BaseballCard("topps", 1989, 659, "player" , "Al Leiter", "Yankees").printCard()

BaseballCard("topps", 1989, 647, "player", "Randy Johnson", "Expos").printCard()

BaseballCard("topps", 1989, 604, "player", "Paul O'Neill", "Reds").printCard()

BaseballCard("topps", 1989, 620, "player", "Barry Bonds", "Pirates").printCard()

BaseballCard("topps", 1989, 600, "player", "Wade Boggs", "Red Sox").printCard()

BaseballCard("topps", 1989, 540, "player", "Bo Jackson", "Royals").printCard()

BaseballCard("topps", 1989, 620, "player", "Barry Bonds", "Pirates").printCard()

BaseballCard("topps", 1989, 380, "player", "Rickey Henderson", "Yankees").printCard()

BaseballCard("topps", 1989, 450, "player", "Roger Clemens", "Pirates").printCard()

BaseballCard("topps", 1989, 500, "player", "Jose Canseco", "A's").printCard()

BaseballCard("topps", 1989, 401, "all star", "Jose Canseco", "A's").printCard()

BaseballCard("topps", 1989, 399, "all star", "Wade Boggs", "Red Sox").printCard()

BaseballCard("topps", 1989, 397, "all star", "Don Mattingly", "Yankees").printCard()

BaseballCard("topps", 1989, 390, "all star", "Darryl Strawberry", "Mets").printCard()

BaseballCard("topps", 1989, 157, "player", "Tom Glavine", "Braves").printCard()

BaseballCard("topps", 1989, 157, "player", "Tom Glavine", "Braves").printCard()

BaseballCard("topps", 1989, 410, "player", "Jack Clark", "Yankees").printCard()

BaseballCard("topps", 1989, 536, "player", "Joel Skinner", "Yankees").printCard()

BaseballCard("topps", 1989, 505, "coach", "Pete Rose", "Reds").printCard()

BaseballCard("topps", 1989, 240, "player", "Greg Maddux", "Cubs").printCard()

BaseballCard("topps", 1989, 250, "player", "Cal Ripken", "Orioles").printCard()

BaseballCard("topps", 1989, 39, "player", "Mike Maddux", "Phillies").printCard()

BaseballCard("topps", 1989, 21, "team leaders", "none", "White Sox").printCard()

BaseballCard("topps", 1989, 388, "all star", "Bobby Bonilla", "Pirates").printCard()

BaseballCard("topps", 1989, 661, "turn back the clock", "Dwight Gooden", "Mets").printCard()
