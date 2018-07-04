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
    
    @IBOutlet weak var label_left: UILabel!
    @IBOutlet weak var label_middle: UILabel!
    @IBOutlet weak var label_right: UILabel!
    @IBAction func sliderMoved(_ sender: UISlider) {
        label_middle.text=String(100*sender.value)+"%"
    }
    @IBAction func resetPushed(_ sender: UIButton) {
        number.text=""
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        var old:String=number.text!
        let toAdd:String=sender.title(for: .normal)!
        var allowDot=true
        if old.count>=10 || old=="OVERLOAD"{
            number.text="OVERLOAD"
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
       
//        number.text.append(sender.title(for: .normal))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        number.text=""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

