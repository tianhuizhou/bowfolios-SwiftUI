//
//  InterestViewModel.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 9/1/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift
import Firebase

class InterestViewModel: ObservableObject{
    
    @Published var allInterests: [anInterest] = []
    
    let ref = Firestore.firestore()
    
    func getAllInterests() {
        
        print("test1")
        allInterests = []
        ref.collection("Profiles").addSnapshotListener { (snap, error) in
            
            guard let docs = snap else{return}
            
            docs.documentChanges.forEach { (doc) in
                
        
                let profile = try! doc.document.data(as: Profile.self)
                
                print("test2")
                
                if profile != nil {
                    //var num = 0
                    print("stop here?")
                    
                    for var ea in self.allInterests{
                        print("outside loop")
                        for ae in profile!.interests {
                            print("inside loop")
                            if ea.theInterest == ae {
                                print("test4 succeed")
                                ea.members.append(ae)
                            }else{
                                print("test5 succedd")
                                let temp = anInterest(theInterest: ae, members: [profile!.Name])
                                self.allInterests.append(temp)
                            }
                        }
                        
                    }
                    
                    if self.allInterests.isEmpty {
                        print("empty so we do this")
                        for item in profile!.interests {
                            
                            print(item)
                            let temp = anInterest(theInterest: item, members: [profile!.Name])
                            print(temp.theInterest)
                            self.allInterests.append(temp)
                            print("we should have somethings")
                        }
                    }
                        
                } else {
                    print("Error in dealing with interests!")
                }
            }
        }
    }
}
