//
//  AllViews.swift
//  Esame
//
//  Created by user243601 on 10/11/23.
//

import SwiftUI

struct AllViews: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image("home")
                    Text("Home")
                }
            StatisticView()
                .tabItem{
                    Image("chart_bar_alt_fill")
                    Text("Statistic")
                }
            TransactionView()
                .tabItem{
                    Image("plus_square_fill_on_square_fill")
                    Text("New")
                }
            AccountView()
                .tabItem{
                    Image("Person Crop Circle Fill")
                    Text("Account")
                }
        }.navigationBarBackButtonHidden()
            .onAppear {
                            // correct the transparency bug for Tab bars
                            let tabBarAppearance = UITabBarAppearance()
                            tabBarAppearance.configureWithOpaqueBackground()
                            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                            // correct the transparency bug for Navigation bars
                            let navigationBarAppearance = UINavigationBarAppearance()
                            navigationBarAppearance.configureWithOpaqueBackground()
                            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                        }
    }
}

struct AllViews_Previews: PreviewProvider {
    static var previews: some View {
        AllViews().environmentObject(AuthViewModel())
    }
    
}
