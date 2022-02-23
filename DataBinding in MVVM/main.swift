//
//  main.swift
//  DataBinding in MVVM
//
//  Created by Sait Cihaner on 16.02.2022.
//

import Foundation

print("Hello, World!")


// With Delegate

protocol ObserveDelegate:class{
    func propertyChanged(newValue:Int)
}

class ObjectToObserve{
    private var foo:Int = 0
    weak var delegate : ObserveDelegate?
    func changeValue(){
        foo += 1
        delegate?.propertyChanged(newValue: foo)
    }
}


class MyObserver : ObserveDelegate{
    var objectToObserve = ObjectToObserve.init()
    func propertyChanged(newValue: Int) {
        print("Value has been changed to \(newValue)")
    }
    
    init(){
        objectToObserve.delegate = self
    }
    
}

let observer = MyObserver.init()
observer.objectToObserve.changeValue()
