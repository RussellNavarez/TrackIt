//
//  AboutView.swift
//  Esame
//
//  Created by user243601 on 10/12/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("TrackIt")
                Text("Version 1.0.1")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
