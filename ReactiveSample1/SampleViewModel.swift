//
//  SampleViewModel.swift
//  ReactiveSample1
//
//  Created by HIRATSUKA SHUNSUKE on 2015/06/03.
//  Copyright (c) 2015年 平塚 俊輔. All rights reserved.
//

import Foundation

class SampleViewModel: NSObject {
    dynamic var text_color:UIColor!
    dynamic var text_val:String!
    let updateSignal:RACSubject
    
    override init(){
        updateSignal = RACSubject()
        super.init()
    }
    
    func racSampleFunc() -> RACCommand{
        return RACCommand(signalBlock:{[weak self](_:AnyObject!) -> RACSignal in
//            self!.updatelabel.text = ""
            
            //あとはここに処理を書いていけば良い
            
            return RACSignal.empty()
            })
    }
}