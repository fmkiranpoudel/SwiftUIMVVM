//
//  UserListViewModel.swift
//  MVVM-SampleApp
//
//  Created by Kiran Poudel on 6/14/22.
//

import Foundation

final class UserListViewModel: ObservableObject {
    
    /// holds list of users
    @Published var users = [User]()
    
    /// alert message
    @Published var alertMessage = ""
    
    /// holds if indicator to be shown or not
    @Published var showIndicator = true
    
    /// fetch list of users from API
    func callAPI() {
        NetworkManager.shared.getUsers { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showIndicator = false
                switch result {
                case .success(let user):
                    self.users = user
                case .failure(let failure):
                    self.alertMessage = failure.localizedDescription
                }
            }
        }
    }
}
