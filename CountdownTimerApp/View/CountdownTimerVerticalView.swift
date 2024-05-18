
import SwiftUI

struct CountdownTimerVerticalView: View {
    @StateObject private var countdownVM = CountdownViewModel()
    @StateObject private var notificationManager = LocalNotificationManager()
    
    var isRunning: Bool {
        countdownVM.isRunning
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                blackBG.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    HStack {
                        TitleAndActivityView(title: "Focus Mode")
                        
                        Spacer()
                        
                        HStack(spacing: 15) {
                            SoundMenuButtonView(selectedSound: $notificationManager.selectedSound)
                            MeditateSoundMenuButtonView(selectedMeditateSound: $countdownVM.selectedMeditateSound, shouldPlayMeditationMusic: $countdownVM.shouldPlayMeditationMusic)
                        }
                        .padding()
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        // Circle View
                        ZStack {
                            CircleView(progress: countdownVM.progress())
                                .environmentObject(countdownVM)
                        }
                        
                        Spacer()
                        
                        // TimerPickers
                        TimerPicker()
                            .environmentObject(countdownVM)
                        
                        Spacer()
                        
                        // Botões de Start/Stop e Reset
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
                        .padding(.horizontal)
                    }
                }
            }
            .onAppear {
                Task {
                    await notificationManager.requestAuthorization()
                    await notificationManager.getCurrentSettings()
                }
            }
            .onChange(of: notificationManager.selectedSound) {
                countdownVM.notificationManager.selectedSound = notificationManager.selectedSound
            }
        }
    }
}

#Preview {
    CountdownTimerVerticalView()
}
