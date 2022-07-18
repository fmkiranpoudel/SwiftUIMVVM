//
//  UserCell.swift
//  MVVM-SampleApp
//
//  Created by Kiran Poudel on 6/14/22.
//

import SwiftUI

/// Design of cell of user
struct UserCell: View {
    
    /// holds data of user to be displayed in current cell view
    var user: User
    
    /// body of cell
    var body: some View {
        HStack(spacing: 10) {
            
            AsyncImage(url: URL(string: user.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                
                    .cornerRadius(30)
                    .overlay(
                        Circle()
                            .fill(user.isOnline ? Color("Online") : Color("Offline"))
                            .frame(width: 15, height: 15)
                        , alignment: .bottomTrailing
                    )
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(user.fullName ).font(.title2)
                    .fontWeight(.medium)
                Text(user.role).foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}
