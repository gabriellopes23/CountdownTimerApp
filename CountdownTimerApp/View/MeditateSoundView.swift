
import SwiftUI

struct MeditateSoundMenuView: View {
    @Binding var selectedMeditateSound: MeditateSounds
    @Binding var shouldPlayMeditationMusic: Bool
    
    var body: some View {
        Form {
            Toggle("Meditate Mode", isOn: $shouldPlayMeditationMusic)
            
            Section(header: Text("Meditate Sounds")) {
                ForEach(MeditateSounds.allCases, id: \.self) { sound in
                    Button(action: {
                        selectedMeditateSound = sound
                    }, label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .opacity(selectedMeditateSound == sound ? 1.0 : 0.0)
                            Text(sound.rawValue.formatSoundName)
                        }
                    })
                }
            }
        }
    }
}

struct MeditateSoundMenuButtonView: View {
    @Binding var selectedMeditateSound: MeditateSounds
    @Binding var shouldPlayMeditationMusic: Bool
    
    var body: some View {
        NavigationLink(destination: {
            MeditateSoundMenuView(selectedMeditateSound: $selectedMeditateSound, shouldPlayMeditationMusic: $shouldPlayMeditationMusic)
        }, label: {
            HStack {
                Image(systemName: "airpodsmax")
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
    MeditateSoundMenuButtonView(selectedMeditateSound: .constant(MeditateSounds.lofi01), shouldPlayMeditationMusic: .constant(false))
}
