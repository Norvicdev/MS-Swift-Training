//
//  TodoItem.swift
//  TodoDemo
//
//  Created by Alex Jiang on 9/4/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import Foundation

class TodoItem: NSObject, NSCoding {
    var name: String = ""
    var isFinished: Bool = false
    var pictureMemoFilename: String = ""
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        isFinished = aDecoder.decodeBool(forKey: "isFinished")
        pictureMemoFilename = aDecoder.decodeObject(
            forKey: "pictureMemoFilename") as! String
        
        super.init()
    }
    
    override init() { super.init() }
    
    init(name: String, isFinished: Bool, pictureMemoFilename: String) {
        self.name = name
        self.isFinished = isFinished
        self.pictureMemoFilename = pictureMemoFilename
    }
    
    func toggleFinished() {
        isFinished = !isFinished
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(isFinished, forKey: "isFinished")
        aCoder.encode(pictureMemoFilename, forKey: "pictureMemoFilename")
    }
}
