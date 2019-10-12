//
//  Petition.swift
//  Petitions2
//
//  Created by Kenneth Jackson on 9/20/19.
//  Copyright © 2019 Connections Digital. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
