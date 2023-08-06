import UIKit


struct MyPaycheck {
    
    //Pay information
    var hourlyRate = 17.5
    let overtimeMultiplier = 1.5
    var overtimeRate = 26.25
    let taxes = 0.7901

    // Work information
    let maxHoursPerWeek = 40.0
    let maxHoursPerTwoWeeks = 80.0
    var hoursWorked_1stWeek = 0
    var hoursWorked_2ndWeek = 0
    var overtimeHoursWorked_1stWeek = 0
    var overtimeHoursWorked_2ndWeek = 0
    
    // Car information
    var toll = 1.90
    var tollsPerDay = 3.80
    var tollsPerWeek = 19.00
    
    let gasTankSize = 17.1 //gallons of gas
    var gasPrice = 3.15 //$ per gallon
    let milesPerGallon = 24.0 //miles per gallon
    let milesDrivenToWork = 31.0 //miles to work/home
    

    

    
    func hoursWorked(_ hoursWorked:Double,_ overtimeHoursWorked: Double) -> Double {
        
        return hoursWorked + overtimeHoursWorked
    }
    
    func getHours(_ hoursWorked_1stWeek: Double, _ hoursWorked_2ndWeek:Double) -> Double {
        var hours = hoursWorked_1stWeek + hoursWorked_2ndWeek
        var otHours = abs(  (maxHoursPerTwoWeeks - (hours))
        

    }
    
    func overtimeHoursPay(_ hoursWorked_1stWeek:Double, _ hoursWorked_2ndWeek:Double) -> Double {
        // Overtime rate is multipled by the overage of 1st and 2nd week hours
        let overtimePay = (overtimeRate) *
                (  (hoursWorked_1stWeek-maxHoursPerWeek)   +   (hoursWorked_2ndWeek-maxHoursPerWeek)   )
        
        return overtimePay
    }
    
    
}


