
import SwiftUI

struct ButtonView: View {
    let name: String
    let imageName: String
    let bgColor: Color
    let fontColor: Color
    let action: () -> Void
 
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Image(systemName: imageName)
                Text(name)
            }
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .foregroundStyle(fontColor)
            .background(RoundedRectangle(cornerRadius: 10).fill(bgColor))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(purpleBG, lineWidth: 1.5)
            )
        })
    }
}

//#Preview {
//    ButtonView(name: "Start", imageName: "play", bgColor: purpleBG, fontColor: .white)
//}
