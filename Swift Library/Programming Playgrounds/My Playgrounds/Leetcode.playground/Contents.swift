import UIKit
//
//
//var romanNumerals = ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"]
//var romanNumbers  = [ 1,    4,   5,    9,  10,   40,   50,  90,  100, 400,  500,  900, 1000]
//
//
//func RomanNumeralToNumber(RomanNumeral :String) -> Int {
//
//    let stringy = "\(RomanNumeral) "
//    let letters = stringy.map { String($0) }
//
//    var sum = 0
//    var letter = 0
//
//
//    while(letters[letter] != " ") {
//
//        if letters[letter] == "I" && letters[letter+1] == "V"{
//            sum += 4
//            letter += 2
//        }
//        else if letters[letter] == "I" && letters[letter+1] == "X"{
//            sum += 9
//            letter += 2
//        }
//
//        else if letters[letter] == "X" && letters[letter+1] == "L"{
//            sum += 40
//            letter += 2
//        }
//        else if letters[letter] == "X" && letters[letter+1] == "C"{
//            sum += 90
//            letter += 2
//        }
//
//        else if letters[letter] == "C" && letters[letter+1] == "D"{
//            sum += 400
//            letter += 2
//        }
//        else if letters[letter] == "C" && letters[letter+1] == "M"{
//            sum += 900
//            letter += 2
//        }
//
//        else{
//            if letters[letter] == "I"{
//                sum += 1
//                letter+=1
//            }
//            else if letters[letter] == "V"{
//                sum += 5
//                letter+=1
//            }
//            else if letters[letter] == "X"{
//                sum += 10
//                letter+=1
//            }
//            else if letters[letter] == "L"{
//                sum += 50
//                letter+=1
//            }
//            else if letters[letter] == "C"{
//                sum += 100
//                letter+=1
//            }
//            else if letters[letter] == "D"{
//                sum += 500
//                letter+=1
//            }
//            else if letters[letter] == "M"{
//                sum += 1000
//                letter+=1
//            }
//            else {
//                //print("Invalid Numeral added. Check your entry")
//                letter += 1
//            }
//        }
//    }
//    print("Roman Numeral:\(RomanNumeral) = \(sum)")
//    return sum
//}
//
//RomanNumeralToNumber(RomanNumeral: "MCMXC")
//

