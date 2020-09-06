//
//  Interest.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 9/1/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct anInterest: Codable, Hashable {
    //@DocumentID var id: String?
    var theInterest: String
    var members: [String]
}
