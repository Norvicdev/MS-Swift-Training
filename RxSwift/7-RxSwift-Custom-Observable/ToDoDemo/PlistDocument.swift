//
//  PlistDocument.swift
//  ToDoDemo
//
//  Created by Alex Jiang on 6/4/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import UIKit

class PlistDocument: UIDocument {
    var plistData: NSData!

    init(fileURL: URL, data: NSData) {
        super.init(fileURL: fileURL)

        self.plistData = data
    }

    override func contents(forType typeName: String) throws -> Any {
        return plistData
    }
    
    override func load(fromContents contents: Any,
                       ofType typeName: String?) throws {
        if let userContent = contents as? NSData {
            plistData = userContent
        }
    }
}
