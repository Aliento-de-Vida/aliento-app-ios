
# ¡Aliento App!

|      |      | 
| :--: | :--: |
|  <a href='https://apps.apple.com/mx/app/aliento-de-vida-app/id6451156283?l=en-GB'><img alt='Download on the App Store' src='https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg' width="280" height="125"/></a>  |  <a href='https://play.google.com/store/apps/details?id=com.alientodevida.app'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' width="323" height="125"/></a>  |

Aliento App is an Android and IOS native app used to keep the church attendants connected with what's going on with their local church.

It is an open source project built with the aim to be useful for a non profit organization and to help developers practice and learn the latest good practices and technologies.

|    |    |    | 
| -- | -- | -- |
![1](https://i.imgur.com/e8SoPGc.png) | ![2](https://i.imgur.com/kua9b2n.png)|![3](https://i.imgur.com/HEIAOnW.png)
|![4](https://i.imgur.com/pDWrVpD.png)|![5](https://i.imgur.com/pPpfjCi.png) | ![6](https://i.imgur.com/PJCkc5q.png) |

## Table of Contents

1. [Architecture](#architecture)
2. [Repository](#repository)
3. [Clean Architecture](#clean-architecture)
    1. [Data](#data)
    2. [Domain](#domain)
    3. [Presentation](#presentation)
4. [Design System](#design-system)
5. [Contributors](#contributors)

## Architecture

 - This app is written following the [Clean Architecture](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3) standard. It
   contains a data, domain and presentation layers.  
 - It uses [Resolver](https://github.com/hmlongco/Resolver) for Dependency Injections and MVC with UIKit as Architecture Design Pattern.  
 - The app also contains dark and light theme using the [Material Design 2](https://m3.material.io/) Colors for the Design System.
 - [Alamofire](https://github.com/Alamofire/Alamofire) for network requests.
 - [Firebase](https://firebase.google.com/) Analytics and Crashlytics.
 - Swift Package Manager and Cocoapods.

### Repository

The app uses the [Repository Pattern](https://medium.com/tiendeo-tech/ios-repository-pattern-in-swift-85a8c62bf436) to in order to have a single source of truth for all the info used in the application. 

The following image is an illustration of the separation of layers and how a repository may interact with the rest of components of the app.

![enter image description here](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*9xT1CgG_pp-s4MwmKTn6Zw.png)

### Clean-Architecture
The app contains 3 main layers and it's divided by layer and then by feature.

![enter image description here](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*0R0r00uF1RyRFxkxo3HVDg.png)

#### Data
This layer contains all dependencies and code related to obtaining the data from Youtube, Spotify and our own Backend. It also contains the repositories Implementations.

#### Domain
This layer contains the main models used in the app as well as the repositories protocols. Use cases would also be here containing business logic.

#### Presentation
This layer contains all the views and UI things. This layer uses the repositories through the domain layer using Dependency Injection.

### Design-System
The app uses Material Design 2 colors as it's design system. Using a light and a dark color palette.

![enter image description here](https://lh3.googleusercontent.com/k6WO1fd7T40A9JvSVfHqs0CPLFyTEDCecsVGxEDhOaTP0wUTPYOVVkxt60hKxBprgNoMqs8OyKqtlaQ4tDBtQJs-fTcZrpZEjxhUVQ=w1064-v0)
### Contributors:
<a href="https://github.com/pegongorasep/aliento-app-ios/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=pegongorasep/aliento-app-ios" />
</a>

Made with [contrib.rocks](https://contrib.rocks).
