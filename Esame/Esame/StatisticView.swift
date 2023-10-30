//
//  StatisticView.swift
//  Esame
//
//  Created by user243601 on 10/11/23.
//

import SwiftUI

struct StatisticView: View {
    var body: some View {
        NavigationStack{
            VStack{
                TabView{
                    StatisticExpenses()
                        .tabItem{
                            Text("Expenses")
                        }
                    StatisticIncomes()
                        .tabItem{
                            Text("Incomes")
                                
                        }
                    
                }.tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
        }.navigationBarBackButtonHidden()
           
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
