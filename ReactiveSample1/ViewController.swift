//
//  ViewController.swift
//  ReactiveSample1
//
//  Created by 平塚 俊輔 on 2015/05/25.
//  Copyright (c) 2015年 平塚 俊輔. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var s1: UISegmentedControl!
    @IBOutlet weak var s2: UISegmentedControl!

    @IBOutlet weak var textbox: UITextField!
    @IBOutlet weak var updatelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //RACObserve(self,keyPath: String(s1.selectedSegmentIndex)) ~> RAC(self,String(s2.selectedSegmentIndex))
        
        textbox.rac_textSignal().subscribeNext {
            (next:AnyObject!) -> () in
            if let text = next as? String {
                println(text)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func RACObserve(target: NSObject!, keyPath: String) -> RACSignal  {
        return target.rac_valuesForKeyPath(keyPath, observer: target)
    }

    

}



struct RAC  {
    var target : NSObject!
    var keyPath : String!
    var nilValue : AnyObject!
    
    init(_ target: NSObject!, _ keyPath: String, nilValue: AnyObject? = nil) {
        self.target = target
        self.keyPath = keyPath
        self.nilValue = nilValue
    }
    
    func assignSignal(signal : RACSignal) {
        signal.setKeyPath(self.keyPath, onObject: self.target, nilValue: self.nilValue)
    }
}

infix operator ~> {}
func ~> (signal: RACSignal, rac: RAC) {
    rac.assignSignal(signal)
}