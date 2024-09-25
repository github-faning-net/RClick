//
//  SettingsView.swift
//  RClick
//
//  Created by 李旭 on 2024/4/4.
//

import SwiftUI

enum Tabs: Hashable {
    case general, actions, about
}

struct SettingsView: View {
    @State var folderItemStore = FolderItemStore()
    @State var menumItemStore = MenuItemStore()
    @State private var tabIndex: Tabs = .general

    var body: some View {
        VStack {
            TabView(selection: $tabIndex) {
                GeneralSettingsTabView(store: folderItemStore)
                    .tabItem {
                        Label(
                            "General", systemImage: "slider.horizontal.2.square"
                        )
                    }
                    .tag(Tabs.general)

                ActionSettingsTabView(store: menumItemStore)
                    .tabItem {
                        Label("Actions", systemImage: "ellipsis.rectangle")
                    }
                    .tag(Tabs.actions)

                AboutSettingsTabView()
                    .tabItem {
                        HStack {
                            Text("About")
                            Image(systemName: "exclamationmark.circle")
                        }
                        //                    Label(
                        //                        "About",
                        //                        systemImage: "exclamationmark.circle"
                        //                    )
                    }
                    .tag(Tabs.about)
            }
            .padding(20)
            .frame(width: 600, height: 450)
        }
    }
}

#Preview {
    SettingsView()
}
