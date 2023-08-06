import UIKit

/* Add this into the code below and incorporate either dictionaries or arrays and/or both
 
var payRate = 17.5
var otRate = 26.25
var sumPay = 0.00
var paycheck1 = [67.6,13.8]
var taxes = 0.7901

sumPay += paycheck1[0] * payRate
sumPay += paycheck1[1] * otRate
sumPay += 175.00

print(sumPay * taxes)

//var payChecksSoFar = [Int,Int]()
//payChecksSoFar[81.4] = 13.8
 
 */


class Paycheck {
    
    let payRate = 17.5
    let afterTaxes = 0.7901
    let hourly_Pay_Rate = 1.0
    let overtime_Pay_Rate = 1.5
    
    var bonusPay = 0.0
    var bonusPayDescription = ""
    var regHoursWorked = 0.0
    var otHoursWorked = 0.0
    
    var day1Hours = 0.0
    var day2Hours = 0.0
    var day3Hours = 0.0
    var day4Hours = 0.0
    var day5Hours = 0.0

    
    init(_ regHoursWorked: Double,_ otHoursWorked: Double,_ bonusPay: Double,_ bonusPayDescription: String) {
        self.regHoursWorked = regHoursWorked
        self.otHoursWorked = otHoursWorked
        self.bonusPay = bonusPay
        self.bonusPayDescription = bonusPayDescription
    }
    
   init(_ regHoursWorked: Double,_ otHoursWorked: Double) {
        self.regHoursWorked = regHoursWorked
        self.otHoursWorked = otHoursWorked
    }
    
    
    func RoundSecondDecimal(_ number: Double) -> Double{
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        
        return round(number*multiplier)/multiplier
    }
    
    func DailyHours (_ day1Hours: Double,_ day2Hours: Double,_ day3Hours: Double,_ day4Hours: Double,_ day5Hours: Double) -> Double {
        let totalHours = day1Hours + day2Hours + day3Hours + day4Hours + day5Hours
        
        return totalHours/60.0
    }
    
    
    
    
    func showPaycheckStub (){
        print("********************************************************")
        print("This pay period you worked a total of \(regHoursWorked+otHoursWorked) hours ")
        print("Rates: @ $\(payRate)0/hour AND/OR $\(overtime_Pay_Rate*payRate)/OT hour.\n")
            //***********Regular*************//
        print("Regular hours worked:\(RoundSecondDecimal(regHoursWorked))      Regular pay: $\(RoundSecondDecimal(payRate*hourly_Pay_Rate*regHoursWorked)) "
            //***********OVERTIME*************//
                + " \nOvertime hours worked:\(otHoursWorked)    Overtime pay: $\(RoundSecondDecimal(payRate*overtime_Pay_Rate*otHoursWorked))\n")
        
        print("Total hours worked: \(regHoursWorked+otHoursWorked)     Total Gross Pay: \((RoundSecondDecimal(payRate*hourly_Pay_Rate*regHoursWorked))+(RoundSecondDecimal(payRate*overtime_Pay_Rate*otHoursWorked)))\n")
        
        if bonusPayDescription != "" && bonusPay != 0{
            print("Miscellaneous Bonuses(flat rate) - \(bonusPayDescription): $\(bonusPay)")
        }
 
        print("Tax Rate @ \(RoundSecondDecimal(100-afterTaxes*100))% - Net Pay: $\(((RoundSecondDecimal(payRate*hourly_Pay_Rate*regHoursWorked))+(RoundSecondDecimal(payRate*overtime_Pay_Rate*otHoursWorked)))*afterTaxes+bonusPay)")
        
        print("********************************************************")

    }

}

//Paycheck.init((81.40-13.8), 13.8, 175, "10 Training hours").showPaycheckStub()

//Paycheck.init(39.65, 9.35, 0, "").showPaycheckStub()


//Paycheck.init(80.0,7.92 + 0, 0.0, "").showPaycheckStub()
//Paycheck.init(80, 18.39, 0, "").showPaycheckStub()


//Paycheck.init(40.0, (8.53 + 8.48 + 6.97 + 8.03 + 8.83)-40, 0.0, "").showPaycheckStub()
Paycheck.init((40.0 + 40.0), (22.01 + 23.44), 0.0, "").showPaycheckStub()










/*/*/*/*/*/*/*/*


class PaycheckCalculator: Paycheck {
    
    //**************************************************
    //  Calculate Quickpay Function
    //**************************************************

    func calculatePay(_ regular_Hours: Double,_ overtime_Hours: Double,_ bonus: Double) -> Double {
        
        let payRate = super.payRate
        let afterTaxes = super.afterTaxes
        
        
        let hourly_Pay_Rate = super.hourly_Pay_Rate*payRate
        let overtime_Pay_Rate = super.overtime_Pay_Rate*payRate

        
        let regPay = hourly_Pay_Rate*regular_Hours
        let otPay = overtime_Pay_Rate*overtime_Hours
        
       return ((regPay+otPay)+bonus)*afterTaxes
    }
    
}






//Function will round to the nearest second decimal
func RoundSecondDecimal(_ number: Double) -> Double{
    let numberOfPlaces = 2.0
    let multiplier = pow(10.0, numberOfPlaces)
    
    return round(number*multiplier)/multiplier
}

//******************************************************************
//  This shows the rates given for regular and overtime pay rate
//******************************************************************

var rate: Double = RoundSecondDecimal(17.50)
let otRate: Double = rate*1.5
    print("\n\n\nRegular rate: $\(rate)")
    print("Overtime rate: $\(otRate)")

//**************************************************
//  Get user input for the number of hours worked
//**************************************************
var totalHours: Double = RoundSecondDecimal(81.40)    // <--------Input here-------->
var overtimeHours: Double = RoundSecondDecimal(13.80) // <--------Input here-------->
var regularHours: Double = RoundSecondDecimal(totalHours-overtimeHours)

//**************************************************
//  Round regularPay to nearest second decimal
//**************************************************
var regularPay = RoundSecondDecimal(regularHours*rate)
var otPay = RoundSecondDecimal(overtimeHours*otRate)
var bonus = 175.00

    print("\nRegular pay: $\(regularPay)")
    print("Overtime pay: $\(otPay)")

var grossPaycheckAmount: Double = regularPay+otPay
    print("\nGross Pay for this paycheck is: $\(grossPaycheckAmount+bonus)")

//**************************************************
//  Deduct taxes from grossPaycheck Amount
//**************************************************



let taxes = 0.76633
let taxDeductions = 1-taxes
var netPaycheckAmount = RoundSecondDecimal(grossPaycheckAmount * taxes)

netPaycheckAmount+bonus

print("Your net pay is aprroximately: $\(RoundSecondDecimal(netPaycheckAmount+bonus))")






//**************************************************
//  Calculate Quickpay Function
//**************************************************

func calculatePay(_ regular_Hours: Double,_ overtime_Hours: Double,_ bonus: Double) -> Double {
    
    let payRate = 17.5
    let afterTaxes = 0.7901
    let hourly_Pay_Rate = 1.00*payRate
    let overtime_Pay_Rate = 1.5*payRate

    
    let regPay = hourly_Pay_Rate*regular_Hours
    let otPay = overtime_Pay_Rate*overtime_Hours
    
   return ((regPay+otPay)+bonus)*afterTaxes
}

calculatePay(67.60, 13.8, 175.00)

RoundSecondDecimal(calculatePay(67.60, 13.8, 175.00))

 */*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/
