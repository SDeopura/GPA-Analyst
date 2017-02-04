//
//  Calculator.swift
//  CalculatorApp
//
//  Created by Sauarbh on 11/27/16.
//  Copyright © 2016 Calculator. All rights reserved.
//

import UIKit
import AVFoundation
class Calculator: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {
    
    
    
    @IBOutlet weak var displayLabel: UILabel!
   
    @IBOutlet var scrollviewMain: UIScrollView!
    
    @IBOutlet var displayOperation: UILabel!
    
    
    @IBAction func numberPressed(btn: UIButton!)
    {
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")!
        let soundUrl = NSURL(fileURLWithPath : path)
        
        do{
            try btnSound = AVAudioPlayer(contentsOf : soundUrl as URL )
            btnSound.prepareToPlay()
            //player.delegate = self
            btnSound.play()
        }
        catch let err as NSError{
            print(err.debugDescription)
            
        }

    }
    var isFirstDigit = true
    var operand1: Double = 0
    var operation = "="
    var btnSound: AVAudioPlayer!
    
    
    var displayValue: Double {
        get {
            //notice use of ! twice in below line. If you get that, then you have truely understood optionals :-)
            return NumberFormatter().number(from: displayLabel.text!)!.doubleValue
        }
        set {
            
            displayLabel.text = "\(newValue)"
            isFirstDigit = true
            operation = "="
            
        }
    }
    
    //This single IBAction function is tied to all the digit buttons
    @IBAction func appendDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        //Notice use of ternery operator in below line which results in a single line code
        //instead of usual if-else multiple lines
        displayLabel.text = isFirstDigit ? digit : displayLabel.text! + digit
        isFirstDigit = false
    }
    
    @IBAction func clearDisplay(_ sender: AnyObject) {
        displayValue = 0
    }
    
    @IBAction func saveOperand(_ sender: UIButton) {
        operation = sender.currentTitle!
        displayOperation.text = operation
        operand1 = displayValue
        isFirstDigit = true
    }
    
    @IBAction func calculate(_ sender: AnyObject) {
        switch operation {
        case "/":displayValue = operand1 / displayValue
        case "x":displayValue *= operand1
        case "+":displayValue += operand1
        case "-":displayValue = operand1 - displayValue
        default:break
        }
        displayOperation.text = ""
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         self.scrollviewMain.contentSize = CGSize(width: self.view.frame.size.width, height: 500)
        
        

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        return true;
    }

}
