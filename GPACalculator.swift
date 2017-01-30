//
//  GPACalculator.swift
//  CalculatorApp
//
//  Created by Sauarbh on 12/07/16.
//  Copyright © 2016 Calculator. All rights reserved.
//
import UIKit



class GPACalculator: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {
    
    
    @IBOutlet var scrollviewMain: UIScrollView!

    @IBOutlet var h1: UITextField!
    
    @IBOutlet var h2: UITextField!
    
    @IBOutlet var h3: UITextField!
    
    @IBOutlet var h4: UITextField!
    
    
    
    @IBOutlet var s1: UITextField!
    
    @IBOutlet var s2: UITextField!
    
    @IBOutlet var s3: UITextField!
    
    @IBOutlet var s4: UITextField!
    
    @IBOutlet var gp1: UITextField!
    
    @IBOutlet var gp2: UITextField!
    
    @IBOutlet var totalGPA: UILabel!
    
    @IBOutlet var gp3: UITextField!
    
    @IBOutlet var gp4: UITextField!
    
    @IBOutlet var totalHoursLabel: UILabel!
    
    @IBOutlet var totalPointsLabel: UILabel!
    
    var points : Float = 0
    var hours: Float = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        s1.delegate = self

        self.scrollviewMain.contentSize = CGSize(width: self.view.frame.size.width, height: 530)

        
        // Do any additional setup after loading the view.
        self.gp1.delegate = self;
        self.gp2.delegate = self;
        self.gp3.delegate = self;
        self.gp4.delegate = self;
       // self.calculate as (AnyObject);.delegate = self;

    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    func gradeCal(_ str: String)-> Float{
        
        switch str{
            
        case "": return 0
        case "A+" , "4" : return 4.00
        case "A" , "4" : return 4.00
        case "A-" , "3.7" : return 3.70
        case "B+" , "3.33" :  return 3.33
        case "B" ,"3" : return 3.00
        case "B-" , "2.7" : return 2.70
        case "C+" , "2.3" : return 2.30
        case "C" , "2" : return 2.00
        case "C-" , "1.7" : return 1.70
        case "D+" , "1.3" : return 1.30
        case "D" , "1" : return 1.00
        case "D-" , "0.7 ": return 0.70
        case "F" , "0" : return 0
        default: return 0
        }

    }
    
    func hourCal(_ str: String)-> Float{
        
        if (str != "") {
    
        return Float(NumberFormatter().number(from: str)!.doubleValue)
        }
        else{
         return 0
        }
    }
    
    @IBAction func calculate(_ sender: AnyObject) {
        
        
        let g1: Float = gradeCal(gp1.text!)
        let g2: Float = gradeCal(gp2.text!)
        let g3: Float = gradeCal(gp3.text!)
        let g4: Float = gradeCal(gp4.text!)
        
        
       let hp1: Float =  hourCal(h1.text!)
       let hp2: Float =  hourCal(h2.text!)
       let hp3: Float =  hourCal(h3.text!)
       let hp4: Float =  hourCal(h4.text!)
        
        hours = hp1+hp2+hp3+hp4
        totalHoursLabel.text = "\(hours)"
        points = (hp1*g1) + (hp2*g2) + (hp3*g3) + (hp4*g4)
        totalPointsLabel.text = "\(points)"
        
        let gpa: Float = points/hours
        totalGPA.text = "Total GPA = \(gpa)"
        
    }
    
    @objc(textFieldDidEndEditing:) @IBAction func textFieldDidEndEditing(_ sender: UITextField){
        
        sender.resignFirstResponder()
        
    }
    
    @IBAction func backgroundTap(_ sender: UIControl){
        
        h1.resignFirstResponder()
        
        h2.resignFirstResponder()
        
        h3.resignFirstResponder()
        
        h4.resignFirstResponder()
        
        s1.resignFirstResponder()
        
        s2.resignFirstResponder()
        
        s3.resignFirstResponder()
        
        s4.resignFirstResponder()
        gp1.resignFirstResponder()
        
        gp2.resignFirstResponder()
        
        gp3.resignFirstResponder()
        
        gp4.resignFirstResponder()
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return false
    }

}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 
    
    let viewControllers: [UIViewController] = self.SwitchController!.viewControllers as! [UIViewController];
    
    for  in Switch Controller{
    if(GPA Calculator is Calculator){
    self.navigationController!.popToViewController(aViewController, animated: true);
    }
    }
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        return true;
    }

}*/
