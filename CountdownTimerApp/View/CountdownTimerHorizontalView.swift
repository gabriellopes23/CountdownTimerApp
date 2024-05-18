
import SwiftUI

struct CountdownTimerHorizontalView: View {
    @StateObject private var countdownVM = CountdownViewModel()
    @StateObject private var notificationManager = LocalNotificationManager()
    
    var isRunning: Bool {
        countdownVM.isRunning
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    blackBG.ignoresSafeArea()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            TitleAndActivityView(title: "Focus Mode")
                            
                            Spacer()
                            
                            HStack(spacing: 15) {
                                SoundMenuButtonView(selectedSound: $notificationManager.selectedSound)
                                MeditateSoundMenuButtonView(selectedMeditateSound: $countdownVM.selectedMeditateSound, shouldPlayMeditationMusic: $countdownVM.shouldPlayMeditationMusic)
                            }
                        }
                        
                        HStack(spacing: 35) {
                            VStack {
                                TimerPicker()
                                    .environmentObject(countdownVM)
                                
                                HStack {
                                    ButtonView(
                                        name: isRunning ? "Pause" : "Start",
                                        imageName: isRunning ? "pause" : "play",
                                        bgColor: purpleBG,
                                        fontColor: .white,
                                        action: {
                                            if isRunning {
                                                countdownVM.pause()
                                            } else {
                                                countdownVM.start()
                                            }
                                        })
                                    
                                    ButtonView(
                                        name: "Stop",
                                        imageName: "square",
                                        bgColor: blackBG,
                                        fontColor: purpleBG,
                                        action: countdownVM.reset)
                                }
                            }
                            
                            Spacer()
                            
                            CircleView(progress: countdownVM.progress())
                                .environmentObject(countdownVM)
                                .frame(width: geometry.size.width / 2, height: geometry.size.width/2)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.width / 3)
                    }
                }
            }
            
        }
    }
}


#Preview {
    CountdownTimerHorizontalView()
}
