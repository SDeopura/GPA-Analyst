//
//  SwitchController.swift
//  CalculatorApp
//
//  Created by Sauarbh on 11/27/16.
//  Copyright © 2016 Calculator. All rights reserved.
//

import UIKit



class SwitchController: UIViewController {
    
    
    
    @IBOutlet var switchBtn: UIBarButtonItem!
    fileprivate var calcController: Calculator!
    
    fileprivate var gpaController: GPACalculator!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        
        calcController = storyboard?.instantiateViewController(withIdentifier: "Calculator") as! Calculator
        
        
        
        calcController.view.frame = view.frame
        
        switchViewController(from: nil, to: calcController)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
        if calcController != nil
            
            && calcController!.view.superview == nil {
            
            calcController = nil
            
        }
        
        if gpaController != nil
            
            && gpaController!.view.superview == nil {
            
            gpaController = nil
            
        }
        
        
        
        
        
    }
    
    
    
    fileprivate func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
        
        
        
        if fromVC != nil {
            
            fromVC!.willMove(toParentViewController: nil)
            
            fromVC!.view.removeFromSuperview()
            
            fromVC!.removeFromParentViewController()
            
        }
        
        
        
        if toVC != nil {
            
            self.addChildViewController(toVC!)
            
            self.view.insertSubview(toVC!.view, at: 0)
            
            toVC!.didMove(toParentViewController: self)
            
        }
        
    }
    
    
    @IBAction func switchViews(_ sender: UIBarButtonItem){
        
        if gpaController?.view.superview == nil {
            
            if gpaController == nil {
                
                
                
                gpaController =
                    
                    storyboard?.instantiateViewController(withIdentifier: "GPA") as! GPACalculator
                
                
            }
            
        }else if calcController?.view.superview == nil {
            
            if calcController == nil {
                
                calcController = storyboard?.instantiateViewController(withIdentifier: "Calculator") as! Calculator
                
            }
            
        }
        
        
        
        // switch view controller
        
        if calcController != nil
            
            && calcController!.view.superview != nil {
            
            gpaController.view.frame = view.frame
            
            switchViewController(from: calcController, to: gpaController)
            
        }else {
            
            calcController.view.frame = view.frame
            
            switchViewController(from: gpaController, to: calcController)
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    /*
     
     // MARK: - Navigation
     
     
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
     // Get the new view controller using segue.destinationViewController.
     
     // Pass the selected object to the new view controller.
     
     }
     
     */
    
    
    
}


