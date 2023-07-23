//
//  DestinationCard.swift
//  MRTGo
//
//  Created by Dary Ramadhan on 20/07/23.
//

import SwiftUI

struct DestinationCard: View {
    @State var name: String?
    @State var distance: Int?
    
    var body: some View {

        
        VStack (alignment: .leading){
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Gray-200"), lineWidth: 1)
                    
                    // Add your card content here, such as text, images, etc.
                    VStack (alignment: .leading) {
                        Image("marker-pin-departure")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 64)
                            .clipped()
                            .roundedCorner(20, corners: [.topLeft, .topRight])
                        
                        VStack (alignment: .leading) {
//                            ForEach(destinationItemDataArray, id: \.name) { user in
//
//                            }
                            if let name = name {
                                Text(name)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(Color("Gray-400"))
                                    .multilineTextAlignment(.leading)
                            }
                            
                            Spacer()
                            HStack(spacing: 4){
                                Image("marker-distance")
                                if let distance = distance {
                                    Text("\(distance) m")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(Color("Secondary"))
                                }
                                
                            
                            }
                            .padding(.bottom, 4)
                            
                            
                        }
                        .padding(8)
                    }
                }
                .frame(width: 120, height: 172)
                .padding(2)
            }
            
        }
        
        
    }
}

//MARK: Rounded Corner
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DestinationCard_Previews: PreviewProvider {
    static var previews: some View {
        DestinationCard(name: "Hotel", distance: 100)
    }
}
