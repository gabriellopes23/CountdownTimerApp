
import SwiftUI

struct CircleView: View {
    @EnvironmentObject var countdownVM: CountdownViewModel
    var progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.2)
                    .foregroundStyle(blurCircle)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(progress))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(purpleBG)
                    .animation(.linear, value: progress)
                
                GeometryReader { geometry in
                    let size = geometry.size
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Circle()
                                .stroke(purpleBG, lineWidth: 5)
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        )
                        .frame(width: size.width, height: size.height, alignment: .center)
                        .offset(x: size.height / 2)
                        .rotationEffect(.init(degrees: progress * 360))
                        .animation(.linear, value: progress)
                }
                
                Text(countdownVM.formattedTime())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .rotationEffect(.init(degrees: 90))
            }
            .padding(60)
            .frame(height: geometry.size.width)
            .rotationEffect(.init(degrees: -90))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

    }
}

#Preview {
    CircleView(progress: 0.5)
        .environmentObject(CountdownViewModel())
}
