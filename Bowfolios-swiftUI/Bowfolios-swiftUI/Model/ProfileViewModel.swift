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
                   
                    
                    if self.profiles.isEmpty {
                        //print("should be display only once")
                        self.profiles.append(profile!)
                        //print("I am adding \(profile!.Name)")
                    } else {
                        var jg = 0
                        for var eachProfile in self.profiles {
                            if eachProfile.Name == profile!.Name{
                                print("I am Changing \(profile!.Name)")
                                eachProfile = profile!
                                jg = 1
                                break
                            }
                        }
                        
                        if jg == 0 {
                            self.profiles.append(profile!)
                            print("I am adding \(profile!.Name)")
                        }
                    }
//                    for eachInterest in profile!.interests{
//                        if !self.allInterests.contains(eachInterest) {
//                            self.allInterests.append(eachInterest)
//                        }
//                    }
                        
                } else {
                    print("Error in loading database!")
                }
                print("the size of collection: \(self.profiles.count)")
            }
        }
        print("test the get files func")
        return
    }
}

