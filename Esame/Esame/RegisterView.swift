//
//  RegisterView.swift
//  Esame
//
//  Created by user243601 on 10/11/23.
//

import SwiftUI



struct RegisterView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing:28) {
                
                Spacer()
                
                Text("Sign Up")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(30)
                
                
                TextField("Enter email", text: $authViewModel.email)
                    .autocapitalization(.none)
                
                SecureField("Enter password", text: $authViewModel.password)
                
                NavigationLink(destination: AllViews(), isActive: $authViewModel.isRegistered) {EmptyView()}
                Button(action: {
                    Task {
                        await authViewModel.signup(email: authViewModel.email, password: authViewModel.password)
                        
                        
                    }
                }, label: {
                    if(authViewModel.isLoading){
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    else{
                        Text("Sign Up")
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
                NavigationLink("Already have a account", destination: LoginView())
                
            }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .navigationBarBackButtonHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(AuthViewModel())
    }
}
