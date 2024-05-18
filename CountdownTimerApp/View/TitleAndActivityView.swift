
import SwiftUI

struct TitleAndActivityView: View {
    @StateObject private var notificationManager = LocalNotificationManager()
    @State var selectedActivity = "Ativity"
    let activities: [String] = ["Study", "Read", "Meditate", "Exercise", "Other"]
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            Menu(content: {
                ForEach(activities, id: \.self) { activity in
                    Button(action: {
                        selectedActivity = activity
                    }, label: {
                        Text(activity)
                    })
                }
            }, label: {
                HStack {
                    Text("\(selectedActivity)")
                    Image(systemName: "chevron.down")
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(fontColor)
                .background(RoundedRectangle(cornerRadius: 20).fill(menuBG))
            })
        }
        .padding()
    }
}

#Preview {
    TitleAndActivityView(title: "Focus Mode")
}
