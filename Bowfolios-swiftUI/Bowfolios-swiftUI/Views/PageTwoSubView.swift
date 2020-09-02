//
//  PageTwoSubView.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 9/1/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import SwiftUI

struct PageTwoSubView: View {
    
    @ObservedObject var interestViewModel = InterestViewModel()
    
    
    var body: some View {
        VStack{
                    List{
                        
                        ForEach(self.interestViewModel.allInterests){intestSection in
                            
                            InterestsGroupView(member: intestSection.members, title: intestSection.theInterest)
                        }
                    }
                }.onAppear {
                    self.interestViewModel.getAllInterests()
                }
    }
    
}
    
    


struct InterestsGroupView: View {
    
    var member: [String]
    var title: String
    
    var body: some View {
        VStack{
            Text(title).font(.largeTitle)
            HStack{
                //display people's name who has the same interest
                ForEach(member, id: \.self) {mb in
                    Text("\(mb)").padding(.horizontal)
                }
                
                //in the future, there should display image instead of string
                Spacer()
            }.padding()
        }.padding(.bottom)
    }
}

struct PageTwoSubView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        PageTwoSubView()
    }
}
