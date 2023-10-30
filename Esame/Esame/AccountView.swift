//
//  AccountView.swift
//  Esame
//
//  Created by user243601 on 10/11/23.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            
            VStack{
                VStack{
                    Text("Account")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    
                }.padding()
                VStack{
                    List{
                        NavigationLink(destination: AccountDetailsView()
                            .navigationTitle("Account Details")) {
                            HStack{
                                Image("Person Crop Circle Fill")
                                Text("Account")
                                    .foregroundColor(Color.black)
                            }.padding()
                            }
                        
                        NavigationLink(destination: PrivacySecurityView()
                            .navigationTitle("Privacy & Security")){
                            HStack{
                                Image("security")
                                Text("Privacy & Security")
                                    .foregroundColor(Color.black)
                            }.padding()
                        }
                        
                        NavigationLink(destination: HelpCenterView()
                            .navigationTitle("Help Center")){
                            HStack{
                                Image("message")
                                Text("Help Center")
                                    .foregroundColor(Color.black)
                            }.padding()
                        }

                        NavigationLink(destination: AboutView()
                            .navigationTitle("About")) {
                            HStack{
                                Image("info_outline")
                                Text("About")
                                    .foregroundColor(Color.black)
                            }.padding()
                        }

                    }
                }
                Spacer()
                NavigationLink(destination: LoginView(), isActive: $authViewModel.isLoggedOut) {EmptyView()}
                Button(action: {
                    Task {
                        await authViewModel.signoutUser()
                    }
                }) {
                    Text("Log out")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .padding()
                .controlSize(.large)
                
                
            }
        }.navigationBarBackButtonHidden()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(AuthViewModel())
    }
}
