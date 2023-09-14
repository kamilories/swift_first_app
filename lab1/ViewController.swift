//
//  ViewController.swift
//  lab1
//
//  Created by Камила Шагимарданова on 12.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewchangecolor: UIView!
    
    @IBOutlet weak var but: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewchangecolor.backgroundColor = UIColor.blue;
    }
    private var buttonTapbool = false
    private var timercolor = Timer()
    private var sekundomer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func button(_ sender: UIButton) {
        
        if (buttonTapbool==false){
            buttonTapbool=true;
            but.setTitle("Стоп", for: UIControl.State.normal)
            
            sekundomer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(sek), userInfo: NSDate(), repeats: true)
            timercolor = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(changecolor), userInfo: NSDate(), repeats: true)
            
        }
        else{
            buttonTapbool=false;
            timercolor.invalidate();
            sekundomer.invalidate();
            but.setTitle("Старт", for: .normal)
            timerLabel.text="0.00"
        }
        
        
        
        
    }
    @objc func sek() {
        let elapsed = -(self.timercolor.userInfo as! NSDate).timeIntervalSinceNow;
            timerLabel.text="\(elapsed)"
        
    }
    
    @objc func changecolor() {
       
        if (viewchangecolor.backgroundColor == UIColor.blue){
            viewchangecolor.backgroundColor = UIColor.red;
        }
        else if (viewchangecolor.backgroundColor == UIColor.red){
            viewchangecolor.backgroundColor = UIColor.green;
        }
        else{
            viewchangecolor.backgroundColor = UIColor.blue;
        }
    }
}

