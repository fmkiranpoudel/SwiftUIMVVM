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
        HStack(alignment: .center, spacing: 10) {
            ZStack(alignment: .trailing) {
                AsyncImage(url: URL(string: user.image))
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .overlay(
                        Circle()
                            .fill(Color( user.isOnline ? "Online" : "Offline"))
                            .frame(width: 15, height: 15)
                        , alignment: .bottomTrailing)
                    .padding(.vertical, 10)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(user.fullName ).font(.title2)
                    .fontWeight(.medium)
                Text(user.role).foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            Button {
                debugPrint("Tapped Button")
            } label: {
                Image(systemName: "chevron.right")
            }
            .tint(.gray)
        }
    }
}
