//
//  MVVM_SampleAppApp.swift
//  MVVM-SampleApp
//
//  Created by Kiran Poudel on 6/13/22.
//

import SwiftUI

@main
struct MVVM_SampleAppApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            UserListView(viewModel: UserListViewModel())
        }
    }
}


struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Hello World!")
            Divider()
            Text("Hey World")
            Divider()
                .frame(height: 3)
                .background(.black)
            HStack {
                Text("Horizontal First Text")
                Divider()
                    .background(.red)
                Text("Horizontal Second Text")
            }
        }
    }
}
