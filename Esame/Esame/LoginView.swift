//
//  LoginView.swift
//  Esame
//
//  Created by user243601 on 10/11/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(spacing:28) {
                
                Spacer()
                
                Text("Sign In")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(30)
                
                
                TextField("Enter email", text: $authViewModel.email)
                    .keyboardType(.emailAddress  )
                    .autocapitalization(.none)

                SecureField("Enter password", text: $authViewModel.password)
                
                NavigationLink(destination: AllViews(), isActive: $authViewModel.isLogged) {EmptyView()}
                Button(action: {
                    Task {
                        await authViewModel.signIn(email: authViewModel.email, password: authViewModel.password)
                        
                        
                    }
                }, label: {
                    if(authViewModel.isLoading){
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    else{
                        Text("Sign In")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    
                    
                })
                .padding(.horizontal,8)
                .buttonStyle(.borderedProminent)
                .disabled(!authViewModel.validEmail())
                .disabled(!authViewModel.validPassword())
                
                Text(authViewModel.errorMessage)
                    .foregroundStyle(.red)
                
                Spacer()
                NavigationLink("Sign Up", destination: RegisterView())
            }
        }.textFieldStyle(.roundedBorder)
            .padding()
            .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthViewModel())
    }
}
