import Foundation

class Calculator {
    // MARK: - Constants
    enum Operation {
        case allclear
        case equals
        case unary(function: (Double) -> Double)
        case binary(function: (Double, Double) -> Double)
    }
    
    var map: [String : Operation] = [
        "+" : .binary { $0 + $1 },
        "×" : .binary { $0 * $1 },
        "−" : .binary { $0 - $1 },
        "÷" : .binary { $0 / $1 },
        "=" : .equals,
        "AC" : .allclear,
        "%" : .unary { $0 / 100 },
        "xʸ" : .binary { pow( $0 , $1 ) },
        //"√" : .unary { sqrt($0) },
        //"x!" : .unary {$0},
    ]
        
    // MARK: - Variables
    var result: Double = 0
    var lastBinaryOperation: ((Double, Double) -> Double)?
    var reminder: Double = 0
    // MARK: - Methods
    func setOperand(number: Double) {
        result = number
    }
    func isInt(string:String) -> Bool {
        return Int(string) != nil
    }
    func factorial(a : Int) -> Int {
        if a==0 {
            return 1
        }
        else{
            return a*factorial(a: a-1);
        }
    }
    func executeOperation(symbol: String) {
        guard let operation = map[symbol] else {
            print("ERROR: no such symbol in map")
            return
        }
        
        switch operation {
        case .unary(let function):
            if symbol=="x!"{
                if isInt(string: String(result)){
                    result = Double(factorial(a: Int(result)))
                }else{
                    result=0
                }
            }else if symbol == "%"{
                if reminder == 0{
                    result = function(result)
                }else {
                    result = reminder * function(result)
                }
            }else{
                result = function(result)
            }
        case .binary(let function):
            if symbol == "xʸ"{
                result=function(reminder,result)
            }else{
                if lastBinaryOperation != nil{
                    executeOperation(symbol: "=")
                    reminder=result
                }
                else{
                    reminder=result
                }
                lastBinaryOperation = function
            }
        case .equals:
            if let lastOperation = lastBinaryOperation {
                result = lastOperation(reminder, result)
                lastBinaryOperation = nil
                reminder = 0
            }
        case .allclear:
            result = 0
            lastBinaryOperation = nil
            reminder = 0
        }
    }
}
