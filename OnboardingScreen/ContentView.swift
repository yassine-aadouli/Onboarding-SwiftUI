//
//  ContentView.swift
//  OnboardingScreen
//
//  Created by Yassine AADOULI on 27/12/2021.
//

import SwiftUI

var totalViews = 3

struct ContentView: View {
    @AppStorage("currentView") var currentView = 1
    
    var body: some View {
        
        if currentView == 1 {
            WalkthroughScreen(
                title: "Connect with tourists",
                description: "Connect with people of faith locally & globally. Discover Chat & Engage",
                bgColor: "PastelColor",
                img: "onboarding-1"
            )
                .transition(.opacity)
        } else if currentView == 2 {
            WalkthroughScreen(
                title: "Discover new things",
                description: "Explore new things through our app. DIscover initiary & other stuffs",
                bgColor: "VilvetColor",
                img: "onboarding-2"
            )
        } else if currentView == 3 {
            WalkthroughScreen(
                title: "Share your moments",
                description: "Share you trip initiary with others. Let’s make the travel fun & enoyable",
                bgColor: "OrangeColor",
                img: "onboarding-3"
            )
        }
        
        
        if currentView == 4 {
            Home()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    var body: some View {
        Text("Welcome to Home!!")
            .font(.title)
            .padding()
    }
}


struct WalkthroughScreen: View {
    
    @AppStorage("currentView") var currentView = 1
    
    var title: String
    var description: String
    var bgColor: String
    var img: String
    
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Text("Hello members !")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                    Spacer()
                    Button(
                        action:{
                            currentView = 4
                        },
                        label: {
                            Text("Skip")
                                .foregroundColor(Color.white)
                        }
                    )
                }.padding()
                Spacer()
                VStack(alignment: .leading){
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Text(title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .font(.title)
                        .padding(.top)
                    
                    
                    Text(description)
                        .padding(.top, 5.0)
                        .foregroundColor(Color.white)
                    Spacer(minLength: 0)
                }
                .padding()
                .overlay(
                    HStack{
                        
                        if currentView == 1 {
                            ContainerRelativeShape()
                                .foregroundColor(.white)
                                .frame(width: 25, height: 5)
                        } else {
                            ContainerRelativeShape()
                                .foregroundColor(.white.opacity(0.5))
                                .frame(width: 25, height: 5)
                        }
                        
                        if currentView == 2 {
                            ContainerRelativeShape()
                                .foregroundColor(.white)
                                .frame(width: 25, height: 5)
                        } else {
                            ContainerRelativeShape()
                                .foregroundColor(.white.opacity(0.5))
                                .frame(width: 25, height: 5)
                        }
                        
                        if currentView == 3 {
                            ContainerRelativeShape()
                                .foregroundColor(.white)
                                .frame(width: 25, height: 5)
                        } else {
                            ContainerRelativeShape()
                                .foregroundColor(.white.opacity(0.5))
                                .frame(width: 25, height: 5)
                        }
                        
                        Spacer()
                        Button(
                            action:{
                                withAnimation(.easeOut) {
                                    if currentView <= totalViews || currentView == 2 {
                                        currentView += 1
                                    } else if currentView == 3 {
                                        currentView = 1
                                    }
                                }
                            },
                            label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 35.0, weight: .semibold))
                                    .frame(width: 55, height: 55)
                                    .background(Color("BgNextBtn"))
                                    .clipShape(Circle())
                                    .padding(17)
                                    .overlay(
                                        ZStack{
                                            Circle()
                                                .stroke(Color.white.opacity(0.4), lineWidth: 2)
                                                .padding()
                                                .foregroundColor(Color.white)
                                        }
                                    )
                            }
                        )
                    }
                        .padding()
                    ,alignment: .bottomTrailing
                )
            }
        }
        .background(Color(bgColor).ignoresSafeArea())
    }
}
