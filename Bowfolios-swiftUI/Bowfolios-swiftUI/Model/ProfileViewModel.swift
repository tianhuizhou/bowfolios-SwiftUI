//
//  ProfileViewModel.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 9/1/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift
import Firebase

class ProfileViewModel: ObservableObject{
    
    @Published var profiles: [Profile] = []
    
    let ref = Firestore.firestore()
    
    func getAllProfiles() {
        profiles = []
        ref.collection("Profiles").addSnapshotListener { (snap, error) in
            
            guard let docs = snap else{return}
            
            docs.documentChanges.forEach { (doc) in
                
        
                let profile = try! doc.document.data(as: Profile.self)
                
                if profile != nil {
                    self.profiles.append(profile!)
                    
//                    for eachInterest in profile!.interests{
//                        if !self.allInterests.contains(eachInterest) {
//                            self.allInterests.append(eachInterest)
//                        }
//                    }
                        
                } else {
                    print("Error in loading database!")
                }
            }
        }
    }
}

