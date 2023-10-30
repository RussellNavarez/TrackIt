//
//  AccountDetailsView.swift
//  Esame
//
//  Created by user243601 on 10/12/23.
//

import SwiftUI
import Supabase

struct AccountDetailsView: View {
    @StateObject var viewModel = AuthViewModel()
    @State var user: String! = ""
    @State var created = Date()
    var body: some View {
        NavigationStack{
            VStack{
                
                List{
                    Text("Email: \(user)")
                    Text("Created: \(created)")
                }.padding()
                
                
                Text("Enjoy our app!")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
            }.task {
                do {
                    user = try await viewModel.client.auth.session.user.email
                    created = try await viewModel.client.auth.session.user.createdAt
                } catch {
                    print("Error \(error)")
                }
            }
        }
    }
}

struct AccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailsView()
    }
}
