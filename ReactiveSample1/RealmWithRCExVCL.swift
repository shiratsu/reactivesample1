//
//  RealmWithRCExVCL.swift
//  ReactiveSample1
//
//  Created by HIRATSUKA SHUNSUKE on 2015/06/01.
//  Copyright (c) 2015年 平塚 俊輔. All rights reserved.
//

import UIKit

class RealmWithRCExVCL: UIViewController {

    @IBOutlet weak var text_box: UITextField!
    @IBOutlet weak var test_btn: UIButton!
    @IBOutlet weak var update_label: UILabel!
    var view_model:SampleViewModel
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view_model = SampleViewModel()
        
        //書き方4：これはOK
        self.text_box.rac_textSignal() ~> RAC(self.update_label, "text")
        
        RACObserve(self.view_model, "text_color") ~> RAC(self.update_label, "textColor")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
