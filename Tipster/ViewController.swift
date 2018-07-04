//
//  ViewController.swift
//  Tipster
//
//  Created by Ashwin Mahesh on 7/3/18.
//  Copyright © 2018 Ashwin Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var number: UILabel!
//    Labels
    @IBOutlet weak var label_left: UILabel!
    @IBOutlet weak var label_middle: UILabel!
    @IBOutlet weak var label_right: UILabel!
//    Tips
    @IBOutlet weak var tip_left: UILabel!
    @IBOutlet weak var tip_middle: UILabel!
    @IBOutlet weak var tip_right: UILabel!
//    Totals
    @IBOutlet weak var total_left: UILabel!
    @IBOutlet weak var total_middle: UILabel!
    @IBOutlet weak var total_right: UILabel!
//    Slider
    @IBOutlet weak var slider: UISlider!
    @IBOutlet var zeroes: [UILabel]!
    @IBAction func sliderMoved(_ sender: UISlider) {
        label_middle.text=String(Int(sender.value))+"%"
        label_left.text=String(Int(sender.value)-3)+"%"
        label_right.text=String(Int(sender.value)+3)+"%"
        if number.text=="OVERLOAD"{
            return
        }
        if number.text!.count>0{
//            Middle
            tip_middle.text=String(format:"%.2f", Double(Int(sender.value))*Double(number.text!)!/100)
            total_middle.text=String(format:"%.2f",Double(tip_middle.text!)!+Double(number.text!)!)
//            Left
            tip_left.text=String(format:"%.2f", Double(Int(sender.value)-3)*Double(number.text!)!/100)
            total_left.text=String(format:"%.2f",Double(tip_left.text!)! + Double(number.text!)!)
//            Right
            tip_right.text=String(format:"%.2f", Double(Int(sender.value)+3)*Double(number.text!)!/100)
            total_right.text=String(format:"%.2f", Double(tip_left.text!)!+Double(number.text!)!)
        }
    }
    @IBAction func resetPushed(_ sender: UIButton) {
        number.text=""
        for label in zeroes{
            label.text="0.00"
        }
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        var old:String=number.text!
        let toAdd:String=sender.title(for: .normal)!
        var allowDot=true
        if old.count>=10 || old=="OVERLOAD"{
            number.text="OVERLOAD"
            return
        }
        if old.count==1 && old=="0" && toAdd=="0"{
            return
        }
        if old.count==0 && toAdd=="."{
            old="0."
            number.text=old
            return
        }
        if sender.title(for: .normal)=="."{
            for char in old{
                if char=="."{
                    allowDot=false
                    break;
                }
            }
            if allowDot==true{
                old.append(toAdd)
                number.text=old
            }
        }
        else{
            old.append(toAdd)
            number.text=old
        }
        sliderMoved(slider)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        number.text=""
        label_left.text="12%"
        label_middle.text="15%"
        label_right.text="18%"
        for label in zeroes{
            label.text="0.00"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

