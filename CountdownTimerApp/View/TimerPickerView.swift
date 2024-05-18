
import SwiftUI

struct TimerPickerView: View {
    @StateObject private var countdownVM = CountdownViewModel()
    
    let hours = Array(0...23)
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    var body: some View {
        HStack {
            Picker("", selection: $countdownVM.selectedHours) {
                ForEach(0..<hours.count, id: \.self) { i in
                    
                    Text(String(format: "%02d", self.hours[i]))
                        
                }
            }
            .pickerStyle(.wheel)
            
            Picker("", selection: $countdownVM.selectedMinutes) {
                ForEach(0..<minutes.count, id: \.self) { i in
                    Text(String(format: "%02d", self.minutes[i]))
                }
            }
            .pickerStyle(.wheel)
            
            Picker("", selection: $countdownVM.selectedSeconds) {
                ForEach(0..<seconds.count, id: \.self) { i in
                    Text(String(format: "%02d", self.seconds[i]))
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
    }
}

#Preview {
    TimerPickerView()
}
