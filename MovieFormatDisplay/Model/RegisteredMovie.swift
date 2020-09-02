//
//  RegisteredMovie.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/09/01.
//  Copyright © 2020 Yuta Toba. All rights reserved.
//

import Foundation
import RealmSwift

class RegisteredMovie: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var date: String = ""
}
