//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Berkant Dursun on 24.12.20.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    @StateObject var dataController: DataController

    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.managedObjectContext,
                             dataController.container.viewContext) // used for SwiftUI to read CoreData values
                .environmentObject(dataController) // for our own code to read CoreData values
                // Automatically save when we detect that we are
                // no longer the foreground app. Use this rather than
                // scene phase so we can port to macOS, where scene
                // phase won't detect our app losing focus.
                .onReceive(
                    NotificationCenter.default.publisher(
                        for: UIApplication.willResignActiveNotification),
                    perform: save) // save changes to CoreData when application no longer active
        }
    }

    func save(_ note: Notification) {
        dataController.save()
    }
}
