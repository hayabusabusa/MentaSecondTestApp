//
//  ItemsModel.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/08/03.
//  Copyright © 2020 Yuta Toba. All rights reserved.

import Foundation

struct MovieItem : Decodable {
    let id: Int  // データの識別子として id を追加. TMDB にも id は存在するので、そちらを使用する.
    let name:String
    let date:String
}
