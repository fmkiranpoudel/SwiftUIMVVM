//
//  ContentView.swift
//  MVVM-SampleApp
//
//  Created by Kiran Poudel on 6/13/22.
//

import SwiftUI

/// UsersListView that shows list of users fetched from API
struct UserListView: View {
    
    /// holds list of users
    @State private var users = [User]()
    
    ///  holds if alert should be shown or not
    @State private var showAlert = false
    
    /// alert message
    @State private var alertMessage = ""
    
    /// holds if indicator to be shown or not
    @State private var showIndicator = true
    
    
    /// body of the view
    var body: some View {
        ZStack {
            NavigationView {
                List(users, id: \.id) { user in
                    UserCell(user: user)
                    
                }
                .navigationBarTitle("Users")
            }
            /// If show indicator holds true, show progress view
            if showIndicator {
                ProgressView().scaleEffect(2)
            }
        }.onAppear{
            callAPI()
        }.alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage))
        }
    }
    
    /// fetch list of users from API
    func callAPI() {
        NetworkManager.shared.getUsers { result in
            showIndicator = false
            switch result {
            case .success(let user):
                self.users = user
            case .failure(let failure):
                self.showAlert = true
                self.alertMessage = failure.localizedDescription
            }
        } }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
