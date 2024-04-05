//
//  HomeView.swift
//  Vini-Transport
//
//  Created by yann combette on 05/04/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ViniMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}
