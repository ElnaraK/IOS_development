import UIKit

class ViewController: UIViewController {

    let model = Calculator()
    
    // MARK: - Label
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Buttons
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var rand: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var allClear: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var equals: UIButton!
    @IBOutlet weak var piConstant: UIButton!
    @IBOutlet weak var sqrt: UIButton!
    @IBOutlet weak var factorial: UIButton!
    @IBOutlet weak var power: UIButton!
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        //circle
        zero.layer.cornerRadius = 55
        one.layer.cornerRadius = 43
        two.layer.cornerRadius = 43
        three.layer.cornerRadius = 43
        four.layer.cornerRadius = 43
        five.layer.cornerRadius = 43
        six.layer.cornerRadius = 43
        seven.layer.cornerRadius = 43
        eight.layer.cornerRadius = 43
        nine.layer.cornerRadius = 43
        rand.layer.cornerRadius = 43
        dot.layer.cornerRadius = 43
        allClear.layer.cornerRadius = 43
        clear.layer.cornerRadius = 43
        percent.layer.cornerRadius = 43
        division.layer.cornerRadius = 43
        multiplication.layer.cornerRadius = 43
        minus.layer.cornerRadius = 43
        plus.layer.cornerRadius = 43
        equals.layer.cornerRadius = 43
        piConstant.layer.cornerRadius = 43
        sqrt.layer.cornerRadius = 43
        factorial.layer.cornerRadius = 43
        power.layer.cornerRadius = 43
    }

   // MARK: - Number
    
    @IBAction func numberPressed(_ sender: UIButton) {
        var numberText = ""
        //check if it is the number or dot(".")
        func setNumber(a: Int) -> Void{
            if sender.tag <= 9 {
                numberText = String(sender.tag)
            }else if sender.tag == 11 {
                //must be only one (".")
                if resultLabel.text!.contains(".") {
                    return
                }else{
                    if resultLabel.text == "0" || resultLabel.text == "0.0"{
                        numberText = "0."
                    }else{
                        numberText = "."
                    }
                }
            }
        }
        // change font size according to the length of the (Double) number
        if resultLabel.text!.contains("."){
            if resultLabel.text!.count < 7{
                resultLabel.font = UIFont.systemFont(ofSize: 95)
                setNumber(a: Int(sender.tag))
            }else if resultLabel.text!.count < 8{
                resultLabel.font = UIFont.systemFont(ofSize: 85)
                setNumber(a: Int(sender.tag))
            }else if resultLabel.text!.count < 9{
                resultLabel.font = UIFont.systemFont(ofSize: 75)
                setNumber(a: Int(sender.tag))
            }else if resultLabel.text!.count < 10{
                resultLabel.font = UIFont.systemFont(ofSize: 65)
                setNumber(a: Int(sender.tag))
            }else{
                return
            }
        }else {
            if resultLabel.text!.count < 6{
                resultLabel.font = UIFont.systemFont(ofSize: 95)
                setNumber(a: Int(sender.tag))
            }else if resultLabel.text!.count < 7{
                resultLabel.font = UIFont.systemFont(ofSize: 85)
                setNumber(a: Int(sender.tag))
            }else if resultLabel.text!.count < 8{
                resultLabel.font = UIFont.systemFont(ofSize: 75)
                setNumber(a: Int(sender.tag))
            }else if resultLabel.text!.count < 9{
                resultLabel.font = UIFont.systemFont(ofSize: 65)
                setNumber(a: Int(sender.tag))
            }else{
                return
            }
        }
        //check to 0
        if resultLabel.text == "0" || resultLabel.text == "0.0"{
            resultLabel.text?.removeAll()
            resultLabel.text?.append(String(numberText))
        }else{
            resultLabel.text?.append(String(numberText))
        }
        
    }
    
    // MARK: - Operations with two numbers
    @IBAction func operationPressed(_ sender: UIButton) {
        //AC -> 13
        guard
            let numberText = resultLabel.text,
            let number = Double(numberText),
            let operation = sender.currentTitle
        else {
            return
        }
        resultLabel.text = "0"
        model.setOperand(number: number)
        model.executeOperation(symbol: operation)
        if operation=="=" || operation=="x!" || operation=="AC" || operation=="%" || operation=="xʸ"
        || operation=="√"
        {
            resultLabel.text = "\(model.result)"
        }
    }
    // MARK: - Constants and some operations which changes only current number(sqrt, clear,factorial)
    @IBAction func constant(_ sender: UIButton) {
        // Double precision (8  fraction digits)
        let format = NumberFormatter()
        format.maximumFractionDigits = 9 - format.maximumIntegerDigits
        var text = ""
        //Rand -> 10
        //Pi -> 12
        //C -> 14
        
        if sender.tag == 10{
            let randomNumber = Double.random(in: 0...1)
            text = String(format:"%.8f", randomNumber)
            resultLabel.font = UIFont.systemFont(ofSize: 65)
        }else if sender.tag == 12{
            let pi = Double.pi
            text = String(format:"%.8f", pi)
            resultLabel.font = UIFont.systemFont(ofSize: 65)
        }else if sender.tag == 14{
            text = "0"
            resultLabel.font = UIFont.systemFont(ofSize: 95)
        }
        resultLabel.text?.removeAll()
        resultLabel.text?.append(text)
    }
}

