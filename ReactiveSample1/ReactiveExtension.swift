//
//  ReactiveExtension.swift
//  ReactiveSample1
//
//  Created by HIRATSUKA SHUNSUKE on 2015/05/26.
//  Copyright (c) 2015年 平塚 俊輔. All rights reserved.
//



extension RACSignal {
    func subscribeNextAs<T>(nextClosure:(T) -> ()) -> () {
        self.subscribeNext {
            (next: AnyObject!) -> () in
            let nextAsT = next as! T
            nextClosure(nextAsT)
        }
    }
}

func RACObserve(target: NSObject!, keyPath: String) -> RACSignal  {
    return target.rac_valuesForKeyPath(keyPath, observer: target)
}