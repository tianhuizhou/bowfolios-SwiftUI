//
//  Profile.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 9/1/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Profile: Codable, Identifiable {
    
    @DocumentID var id: String?
    var Bio: String
    var Email: String
    var interests: String
    var Name: String
    var Projects: [String]
    var Title: String
    
    enum CodingKeys: String,CodingKey {
        
        case id
        case Bio
        case Email
        case interests = "Interests"
        case Name
        case Projects
        case Title
        
    }
}

