//
//  ItemsModel.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/08/03.
//  Copyright © 2020 Yuta Toba. All rights reserved.

import Foundation

struct MovieItem : Decodable {
    
    var name:String
    var date:String
    
    init(name:String,date:String){
        self.name = name as String
        self.date = date as String
    }
    
//    override required init() {
//        fatalError("init() has not been implemented")
//    }
    
//    func encode(with coder: NSCoder) {
//        coder.encode(self.name,forKey: "name")
//        coder.encode(self.date,forKey: "date")
//    }
//
//    required init?(coder: NSCoder) {
//        self.name = coder.decodeObject(forKey: "name") as! String
//        self.date = coder.decodeObject(forKey: "date") as! String
//    }
}
