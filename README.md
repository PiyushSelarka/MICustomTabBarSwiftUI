# iOS Custom Tab Bar in SwiftUI

<a href="https://docs.swift.org/swift-book/" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/swift-5.0-brightgreen">
</a>
<a href="https://developer.apple.com/ios/" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-iOS-red">
</a>
<a href="https://www.codacy.com?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=nikunjprajapati95/Reading-Animation&amp;utm_campaign=Badge_Grade"><img src="https://app.codacy.com/project/badge/Grade/44b16d6ddb96446b875d38bf2ec89b11"/></a>
<a href="https://github.com/parthgohel2810/TopTabBarView-Framework/blob/main/LICENSE" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/licence-MIT-orange">
</a>
<p></p> 

Good news for all our users out there! Now there are no boundaries to your convenience
Checkout this super easy custom tabbar integration and example.!!! 
This is a sample project how to create a custom tab bar in SwiftUI.

<p align="center">
  <img src="https://user-images.githubusercontent.com/42262083/218099149-b9e08dae-6b73-44dd-b05a-0b71dc1e4e5e.gif">
  <img src="https://user-images.githubusercontent.com/42262083/218099441-580ac93d-3594-4557-93c5-bf98816c65b8.gif">
</p>

## Installation
To install it, simply add the following line to your Podfile:

```ruby
pod 'MICustomTabBar', git: 'https://github.com/PiyushSelarka/MICustomTabBarSwiftUI', branch: 'main'
```
Then run `pod install` from the Example directory.

## Features
- Custom tab bar with custom icons and animations
- Uses SwiftUI's built-in `@State` and `@Binding` to manage tab selection

## Usage
The custom tab bar is implemented in the pod `MICustomTabBar`. To use it in your own project, The CustomTabView view and its dependencies into your project, and modify the icons and animations to fit your design.

## Customization 

```swift
    struct ContentView: View {
    
    @State var selectedTab = 0
    var body: some View {
        
        ZStack()
        {
            TabView(selection: $selectedTab) {
                AnyView(Text("Home"))
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(0)
                AnyView(Text("bookmark"))
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(1)
                AnyView(Text("message"))
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(2)
                AnyView(Text("heart"))
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(3)
                AnyView(Text("person"))
                    .ignoresSafeArea(.all,edges: .all)
                    .tag(4)
            }
            .overlay {
                ZStack{
                    CustomTabView(tabsImage: ["house","bookmark","message","heart","person"], selectedTabColor: Color.red, deSelectedTabColor: Color.black, tabBarBackgroundColor: Color.blue, selectedTab: $selectedTab, tabStyle: .one)
                }
            }
        }
    }
}
```

## Requirements
- iOS 13.0+
- Xcode 13.0+


## 📱 Check out other lists of our Mobile UI libraries

<a href="https://github.com/Mindinventory?language=kotlin"> 
<img src="https://img.shields.io/badge/Kotlin-0095D5?&style=for-the-badge&logo=kotlin&logoColor=white"> </a>

<a href="https://github.com/Mindinventory?language=swift"> 
<img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white"> </a>

<a href="https://github.com/Mindinventory?language=dart"> 
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"> </a>


<a href="https://github.com/Mindinventory/react-native-tabbar-interaction"> 
<img src="https://img.shields.io/badge/React_Native-20232A?style=for-the-badge&logo=react&logoColor=61DAFB"> </a>

<br></br>

## 💻 Check out other lists of Web libraries

<a href="hhttps://github.com/Mindinventory?language=javascript"> 
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"></a>

<a href="https://github.com/Mindinventory?language=go"> 
<img src="https://img.shields.io/badge/Go-00ADD8?style=for-the-badge&logo=go&logoColor=white"></a>

<a href="https://github.com/Mindinventory?language=python"> 
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"></a>

<br></br>

<h4><a href="https://www.mindinventory.com/whitepapers.php?utm_source=gthb&utm_medium=special&utm_campaign=folding-cell#demo"><u> 📝 Get FREE Industry WhitePapers →</u></a></h4>

## Check out our Work
<a href="https://dribbble.com/mindinventory"> 
<img src="https://img.shields.io/badge/Dribbble-EA4C89?style=for-the-badge&logo=dribbble&logoColor=white" /> </a>
<br></br>

## 📄 License
iOS-Top-Tab-Navigation is [MIT-licensed](/LICENSE).


If you use our open-source libraries in your project, please make sure to credit us and Give a star to www.mindinventory.com

<a href="https://www.mindinventory.com/contact-us.php?utm_source=gthb&utm_medium=repo&utm_campaign=swift-ui-libraries">
<img src="https://github.com/Sammindinventory/MindInventory/blob/main/hirebutton.png" width="203" height="43"  alt="app development">
</a>
