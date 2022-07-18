//
//  ContentView.swift
//  MVVM-SampleApp
//
//  Created by Kiran Poudel on 6/13/22.
//

import SwiftUI

/// UsersListView that shows list of users fetched from API
struct UserListView: View {
    
    @ObservedObject var viewModel: UserListViewModel
        
    /// body of the view
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.users, id: \.id) { user in
                    NavigationLink(destination: Text(user.fullName)) {
                        UserCell(user: user)
                    }
                    
                }
                .navigationBarTitle("Users")
            }
            /// If showIndicator holds true, show progress view
            if viewModel.showIndicator {
                ProgressView().scaleEffect(2)
            }
        }.onAppear{
            viewModel.callAPI()
        }.alert(isPresented: .constant(!viewModel.alertMessage.isEmpty)) {
            Alert(title: Text(viewModel.alertMessage))
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UserListViewModel())
    }
}
