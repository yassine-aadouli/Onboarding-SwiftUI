//
//  ContentView.swift
//  OnboardingScreen
//
//  Created by Yassine AADOULI on 27/12/2021.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isHome") var currentPage = true
    
    var body: some View {
        WalkthroughScreen(
            title: "Connect with tourists",
            description: "Connect with people of faith locally & globally. Discover Chat & Engage",
            bgColor: "PastelColor",
            img: "onboarding-1"
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    var body: some View {
        Text("Welcom to Home!!")
            .font(.title)
            .padding()
    }
}


struct WalkthroughScreen: View {
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
                        action:{},
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
                        ContainerRelativeShape()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 5)
                        ContainerRelativeShape()
                            .foregroundColor(.white.opacity(0.5))
                            .frame(width: 25, height: 5)
                        ContainerRelativeShape()
                            .foregroundColor(.white.opacity(0.5))
                            .frame(width: 25, height: 5)
                        Spacer()
                        Button(
                            action:{},
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
