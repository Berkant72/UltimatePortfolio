//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Berkant Dursun on 24.12.20.
//

import SwiftUI

struct ContentView: View {
    // @AppStorage("selectedView") var selectedView: String?
    // AppStorage stores the same value in each instance in the whole app

    @SceneStorage("selectedView") var selectedView: String?
    // SceneStorage stores the value in each instance of the scene

    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tag(HomeView.tag)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ProjectsView(showClosedProjects: false)
                .tag(ProjectsView.openTag)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }
            ProjectsView(showClosedProjects: true)
                .tag(ProjectsView.closedTag)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Closed")
                }
            AwardsView()
                .tag(AwardsView.tag)
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Awards")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
