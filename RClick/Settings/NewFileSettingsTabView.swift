//
//  NewFileSettingsTabView.swift
//  RClick
//
//  Created by 李旭 on 2024/11/18.
//

import SwiftUI


struct NewFileSettingsTabView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            HStack {
                Text("New File Type").font(.title2)
                Spacer()
                Button {
                    appState.resetFiletypeItems()
                } label: {
                    Label("Reset", systemImage: "arrow.triangle.2.circlepath")
                        .font(.body)
                }
            }
            
            List {
                ForEach($appState.newFiles) { $item in
                    HStack {
                        if let appUrl = item.openApp {
                            Image(nsImage: NSWorkspace.shared.icon(forFile: appUrl.path()))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                        } else  {
                            if item.icon.starts(with: "icon-") {
                                Image(item.icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            } else {
                                Image(systemName: item.icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            }
                        }
                       
                        Text(item.name).font(.title2)
                        Spacer()
                        Toggle("", isOn: $item.enabled)
                            .onChange(of: item.enabled) {
                                appState.toggleActionItem()
                            }
                            .toggleStyle(.switch)
                    }.padding(.vertical, 8)
                }
            }
        }
    }

    
    
}
