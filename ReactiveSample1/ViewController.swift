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
    @IBOutlet weak var smplbtn: UIButton!
    
    @IBOutlet weak var anotherlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RACObserve(self,String(s1.selectedSegmentIndex)) ~> RAC(self,String(s2.selectedSegmentIndex))
        
//        //書き方１
//        textbox.rac_textSignal().subscribeNext { [weak self]
//            (next:AnyObject!) -> () in
//            if let text = next as? String {
//                self?.updatelabel.text = text
//            }
//        }
//
        //書き方2
//        textbox.rac_textSignal().subscribeNextAs {
//            (text:String) -> () in
//            println(text)
//        }
        
        //書き方3
        //これは動かないらしい
        //http://qiita.com/bonegollira/items/12b451046bc14ecf5d97
//        let textsignal = RACObserve(self.textbox, keyPath: "text")
//        textsignal.subscribeNext {
//            (next:AnyObject!) -> () in
//            if let text = next as? String {
//                println(text)
//            }
//        }
        //書き方4：これはOK
        textbox.rac_textSignal() ~> RAC(self.updatelabel, "text")
        
        // Observe label, to update another label:
        //TextFieldにObserveは使えないみたい
        RACObserve(self.updatelabel, "text") ~> RAC(self.anotherlabel, "text")
        
        
        //書き方5：これはコンパイルエラー
        //RAC(self.updatelabel, "text") = self.textbox.rac_textSignal
        
        self.smplbtn.rac_command = RACCommand(signalBlock:{[weak self](_:AnyObject!) -> RACSignal in
            self!.updatelabel.text = ""
            return RACSignal.empty()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}





