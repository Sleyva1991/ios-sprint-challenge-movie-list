//
//  Movie.swift
//  Movie List
//
//  Created by Steven Leyva on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    var text: String
    var seen: Bool
    
    init(text: String, seen: Bool = false) {
        self.text = text
        self.seen = seen
    }
}
