//
//  HomeView.swift
//  UltimatePortfolio
//
//  Created by Berkant Dursun on 24.12.20.
//

import CoreData
import SwiftUI

struct HomeView: View {
    static let tag: String? = "Home"
    
    @EnvironmentObject var dataController: DataController
    
    @FetchRequest(entity: Project.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Project.title, ascending: true)], predicate: NSPredicate(format: "closed = false")) var projects: FetchedResults<Project>
    
    let items: FetchRequest<Item>
    var projectRows: [GridItem] {
        [GridItem(.fixed(100))]
    }
    
    init() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let completedPredicate = NSPredicate(format: "completed = false")
        let openPredicate = NSPredicate(format: "project.closed = false")
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [completedPredicate, openPredicate])
        request.predicate = compoundPredicate
        
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Item.priority, ascending: false)
        ]
        
        // more code to come
        request.fetchLimit = 10
        
        items = FetchRequest(fetchRequest: request)
        
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: projectRows) {
                            ForEach(projects, content: ProjectSummaryView.init)
                        } //: GRID
                        .padding([.horizontal, .top])
                        .fixedSize(horizontal: false, vertical: true)
                    } //: SCROLLVIEW
                    VStack(alignment: .leading) {
                        ItemListView(title: "Up next", items: items.wrappedValue.prefix(3))
                        ItemListView(title: "More to explore", items: items.wrappedValue.dropFirst(3))
                    }
                    .padding(.horizontal)
                } //: VSTACK
            } //: SCROLLVIEW
            .background(Color.systemGroupedBackground.ignoresSafeArea())
            .navigationTitle("Home")
        } //: NAVIGATIONVIEW
    }
    
}


//Button("Add Data") {
//    dataController.deleteAll()
//    try? dataController.createSampleData()
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
