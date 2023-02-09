//
//  ContentView.swift
//  MICustomTabBar
//
//  Created by MI-161 on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 0
    var body: some View {
        
        ZStack()
        {
            TabView(selection: $selectedTab) {
                Home()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(0)
                bookmark()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(1)
                Message()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(2)
                Fav()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(3)
                Profile()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(4)
            }
            .overlay {
                ZStack{
                    CustomTab(tabsImage: ["house","bookmark","message","heart","person"], selectedTabColor: Color.red, deSelectedTabColor: Color.black, tabBarBackgroundColor: Color.blue, selectedTab: $selectedTab, tabStyle: .one)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}