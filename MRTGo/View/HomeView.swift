//
//  HomeView.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isKeyboardActive = false

    var body: some View {
        GeometryReader { geometry in
                VStack {
                    //Header
                    Header()
                        .frame(width: geometry.size.width, height: 200)
                    // Set your desired height for the header
                    
                    Spacer()
                    
                    //Empty State
                    EmptyState()
                        .opacity(isKeyboardActive ? 0 : 1)
                        .padding(.bottom, isKeyboardActive ? keyboardHeight(geometry) : 0)
                    
                    Spacer()
                }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            withAnimation {
                isKeyboardActive = true
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
            withAnimation {
                isKeyboardActive = false
            }
        }
    }
    
    private func keyboardHeight(_ geometry: GeometryProxy) -> CGFloat {
        let keyboardTop = geometry.frame(in: .global).height
        let safeAreaBottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        return keyboardTop - geometry.size.height + safeAreaBottom
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
