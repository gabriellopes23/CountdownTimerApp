
import SwiftUI

struct SoundMenuView: View {
    @Binding var selectedSound: Sounds
    
    var body: some View {
        Form {
            Section(header: Text("Alarm Sounds")) {
                ForEach(Sounds.allCases, id: \.self) { sound in
                    Button(action: {
                        selectedSound = sound
                        
                        playSound(sound: sound.rawValue)
                    }, label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .opacity(selectedSound == sound ? 1.0 : 0.0)

                            Text(sound.rawValue.formatSoundName)
                        }
                    })
                }
            }
        }
        .onDisappear {
            stopPlaying()
        }
    }
}

struct SoundMenuButtonView: View {
    @Binding var selectedSound: Sounds
    
    var body: some View {
            NavigationLink(destination: {
                SoundMenuView(selectedSound: $selectedSound)
            }, label: {
                HStack {
                    Image(systemName: "music.quarternote.3")
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(fontColor)
                .background(RoundedRectangle(cornerRadius: 20).fill(menuBG))
            })
    }
}


#Preview {
    SoundMenuButtonView(selectedSound: .constant(Sounds.alarm01))
}
