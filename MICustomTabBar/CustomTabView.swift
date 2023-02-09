//
//  CustomTabView.swift
//  MICustomTabBar
//
//  Created by MI-161 on 03/02/23.
//

import SwiftUI

public enum TabStyle {
    case one
    case two
}

public struct CustomTabView: View {
    
    public var tabsImage : [String]
    public var selectedTabColor: Color
    public var deSelectedTabColor: Color
    public var tabBarBackgroundColor: Color
    @Binding public var selectedTab: Int
    public var tabStyle : TabStyle = .one

    public var body: some View {
        
        if tabStyle == .one {
            type1(tabsImage: tabsImage, selectedTabColor: selectedTabColor, deSelectedTabColor: deSelectedTabColor, tabBarBackgroundColor: tabBarBackgroundColor, selectedTab: $selectedTab)
        } else {
            type2(tabsImage: tabsImage, selectedTabColor: selectedTabColor, deSelectedTabColor: deSelectedTabColor, tabBarBackgroundColor: tabBarBackgroundColor, selectedTab: $selectedTab)
        }
    }
}

struct type1: View {
    
    var tabsImage : [String]
    var selectedTabColor: Color
    var deSelectedTabColor: Color
    var tabBarBackgroundColor: Color
    @Binding var selectedTab: Int
    
    @State var tabPoints : [CGFloat] = []
    
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    ForEach(0..<tabsImage.count,id: \.self) { index in
                        
                        GeometryReader { reader -> AnyView in
                            
                            let midX = reader.frame(in: .global).midX
                            
                            DispatchQueue.main.async {
                                if tabPoints.count <= 4 {
                                    tabPoints.append(midX)
                                }
                            }
                            
                            return AnyView(
                                Button {
                                    withAnimation(.interactiveSpring(response: 0.6,dampingFraction: 0.5, blendDuration: 0.5)) {
                                        selectedTab = index
                                    }
                                } label: {
                                   
                                    Image(systemName: "\(tabsImage[index])\(selectedTab == index ? ".fill" : "")")
                                        .font(.system(size: 25,weight: .semibold))
                                        .foregroundColor(selectedTab == index ? selectedTabColor : deSelectedTabColor)
                                        .offset(y: selectedTab == index ? -10 : 0)
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            )
                        }
                        .frame(height: 50)
                        
                    }
                }
                .padding()
                .background(
                    tabBarBackgroundColor
                        .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
                )
                .overlay(
                    Circle()
                        .fill(tabBarBackgroundColor)
                        .frame(width: 10,height: 10)
                        .offset(x: getCurvePoint() - 20)
                    ,alignment: .bottomLeading
                )
                .cornerRadius(30)
                .padding(.horizontal)
            }
        }
    }
    func getCurvePoint() -> CGFloat {
        
        if tabPoints.isEmpty {
            return 10
        } else {
            for (i, _) in tabsImage.enumerated() {
                if i == selectedTab {
                    return tabPoints[i]
                }
            }
            return CGFloat.zero
        }
    }
}
struct type2: View {
    
    var tabsImage : [String]
    var selectedTabColor: Color
    var deSelectedTabColor: Color
    var tabBarBackgroundColor: Color
    @Binding var selectedTab: Int
    
    @State var selectedTabCircle = 0
    @State var xAxis: CGFloat = 0
    @State private var animationAmount = 1.0
    @Namespace var animation
    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    
    @State private var animate = false
    @State private var animateCircle = false
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                HStack() {
                    ForEach(0..<tabsImage.count,id: \.self) { index in
                        Spacer()
                        
                        GeometryReader { reader in
                            
                            VStack(spacing: 0.0){
                                
                                Button {
                                    animateCircle = true
                                    selectedTabCircle = index
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                            selectedTab = index
                                            withAnimation(.linear(duration: 0.20)) {
                                                xAxis = reader.frame(in: .global).minX - 7
                                            }
                                            animate = true
                                        }
                                        
                                    }
                                    
                                    
                                } label: {
                                    
                                    Image(systemName: "\(tabsImage[index])\(selectedTab == index ? ".fill" : "")")
                                        .resizable()
                                        .foregroundColor(selectedTab == index ? selectedTabColor : deSelectedTabColor)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25,height: 25)
                                        .padding(selectedTab == index ? 20 : 20)
                                        .background(tabBarBackgroundColor.opacity(selectedTab == index ? 1 : 0) )
                                        .overlay(content: {
                                            
                                            selectedTabCircle == index ?
                                            Circle()
                                                .scale(animateCircle ? 0.35 : 0.75)
                                                .stroke(selectedTabColor, lineWidth: 4.5)
                                                .opacity(animateCircle ? 0.65 : 0.0)
                                                .animation(.linear(duration: 0.25), value: UUID())
                                                .onReceive(timer) { _ in
                                                    animateCircle = false
                                                }
                                            :
                                            
                                            Circle()
                                                .scale(0.5)
                                                .stroke(Color.red, lineWidth: 3.5)
                                                .opacity(0)
                                                .animation(.linear(duration: 0.25), value: UUID())
                                                .onReceive(timer) { _ in
                                                    animateCircle = false
                                                }
                                        })
                                        .clipShape(
                                            Circle()
                                        )
                                        .animation(.linear(duration: 0.25),value: UUID())
                                        .offset(x:  (reader.frame(in: .global).minX - 7) - reader.frame(in: .global).midX ,y: selectedTab == index ? -45 : -20)
                                        .onAppear {
                                            xAxis = reader.frame(in: .global).minX - 7
                                        }
                                }
                                
                            }
                            Spacer()
                            
                        }
                        .frame(width: 25.0, height: 25.0)
                        Spacer()
                        
                    }
                    
                }
                .frame(height: 70, alignment: .center)
                .padding(.horizontal,30)
                .transition(.slide)
                .background(tabBarBackgroundColor.clipShape(
                    customShape(xAxis: xAxis)
                    
                ).cornerRadius(10))
                .shadow(radius: 5)
                .padding(.horizontal)
                .padding(.vertical,0)
            }
        }
    }
}

struct TabCurve: Shape {
    
    var tabPoint : CGFloat
    
    var animatableData: CGFloat{
        get { return tabPoint}
        set { tabPoint = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let mid = tabPoint
            path.move(to: CGPoint(x: mid - 40, y: rect.height))
            
            let to = CGPoint(x: mid, y: rect.height - 20)
            let c1 = CGPoint(x: mid - 15, y: rect.height)
            let c2 = CGPoint(x: mid - 15, y: rect.height - 20)
            
            let to1 = CGPoint(x: mid + 40, y: rect.height)
            let c3 = CGPoint(x: mid + 15, y: rect.height - 20)
            let c4 = CGPoint(x: mid + 15, y: rect.height)
            
            path.addCurve(to: to, control1: c1, control2: c2)
            path.addCurve(to: to1, control1: c3, control2: c4)
            
        }
    }
}


struct customShape: Shape {
    
    var xAxis : CGFloat
    
    var animatableData: CGFloat{
        get { return xAxis}
        set { xAxis = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - 45, y: 0))
            
            let to1 = CGPoint(x: center, y: 50)
            let center1 = CGPoint(x: center - 25, y: 0)
            let center2 = CGPoint(x: center - 50, y: 37)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let center3 = CGPoint(x: center + 60, y: 45)
            let center4 = CGPoint(x: center + 35, y: 0)
            
            path.addCurve(to: to1, control1: center1, control2: center2)
            path.addCurve(to: to2, control1: center3, control2: center4)
            
        }
        
    }
    
}
