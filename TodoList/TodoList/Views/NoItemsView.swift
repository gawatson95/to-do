//
//  NoItemsView.swift
//  TodoList
//
//  Created by Grant Watson on 4/27/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Woah!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Your agenda is clear.")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Let's change that by adding a few tasks for the day!")
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                
                NavigationLink("Add something") {
                    AddView()
                }
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(animate ? secondaryAccentColor : Color.accentColor)
                .cornerRadius(10)
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 50 : 30)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
