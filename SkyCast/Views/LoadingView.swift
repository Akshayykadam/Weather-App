//
//  LoadingView.swift
//  SkyCast
//
//  Created by Akshay Kadam on 17/03/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.automatic)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
