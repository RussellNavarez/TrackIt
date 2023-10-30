//
//  HomeView.swift
//  Esame
//
//  Created by user243601 on 10/11/23.
//

import SwiftUI

struct HomeView: View {
    
 
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Welcome back!")
                    .padding(.top)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
            }
            VStack{
                Text("Total balance")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("$totalamount")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                   
                HStack{
                    VStack{
                        HStack{
                            Text("Incomes")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                        Text("$total incomes")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        Text("Not currently available")
                            .font(.system(size: 12))
                    }.padding()
                    
                    VStack{
                        HStack{
                            Text("Expenses")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                        Text("$total expenses")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    }.padding()
                    
                    
                }
                
            }
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 3)
                )
                .padding()
    
            HStack{
                Text("Recent transactions")
                    .padding()
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                
                Spacer()
                
                NavigationLink {
                    AllTransactionsView()
                        .navigationTitle("All Transactions")
                } label: {
                    Text("See all")
                }.padding()

            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0..<11) {_ in
                        HStack{
                           
                            VStack{
                                Text("$transaction")
                                Text("$date")
                            }
                            Spacer()
                            Text("$amount")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .border(.black)
                    }
                    .padding(10)
                    }
                }
            
            
            }.navigationBarBackButtonHidden()
            
        
        }
    }
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
