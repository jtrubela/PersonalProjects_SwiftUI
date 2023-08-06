import UIKit


// Round function takes a double and rounds it to the nearest 2 decimal places
class Calculations {
    func RoundSecondDecimal(_ number: Double) -> Double{
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        
        return round(number*multiplier)/multiplier
    }
}
