# OmniVirt Ad Network: Monetize your VR app with seamless experience

![Screenshot](https://github.com/OmniVirt/OmniVirtAdNetwork-iOS-Example/raw/master/Screenshots/ss.jpg)

**OmniVirt Ad Network** provides you ***an advertising platform*** enables developers and publishers to monetize their apps with engaging VR content in seamless user experience way.

Simply integrate the OmniVirt SDK into your iOS, Android or Web application and get paid for presenting sponsored 360° video experiences to your users. Backfill your inventory with premium CPM experiences from OmniVirt’s network of advertisers. We support both 360° and 2D video ads inside VR apps.

Visit [omnivirt.com](https://omnivirt.com/) to create ad space to start monetizing. Contact us for more info at [contact@omnivirt.com](mailto:contact@omnivirt.com).

# Add the OmniVirt SDK to your app
 
## Using CocoaPods

CocoaPods is the most conventient way to add the OmniVirt SDK to your app. Check out [www.cocoapods.org](https://www.cocoapods.org) for more information.

- Add the following line to your podfile.
```
pod 'OmniVirtSDK'
```
- Install dependencies.
```
$ pod install
```
- Open the newly created `.xcworkspace`

# Usage

**OmniVirt Ad Network** can be integrated into your Android application in just few easy steps.

## Get Started

1. **Sign up** for an account at [OmniVirt](https://www.omnivirt.com)
2. **Create one or more Ad Spaces** for your app (for each Ad Space you can select different content and will get separate reporting)
3. Keep the **AdSpace ID** assigned for further use.

Now an Ad Space is ready. Next step is to enable the Ad on your application.


## Initialize a `VRAd` instance
 
First of all, create an `VRAd` instance with **AdSpace ID** provided by step above along with the callback listener.
```swift
class ViewController: UIViewController, VRAdDelegate {
    var vrAd: VRAd!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        // Create an VRAd instance
        // Replace ADSPACE_ID with one you got from OmniVirt.com
        //
        vrAd = VRAd(adSpaceID: ADSPACE_ID, viewController: self, listener: self)
        //
        // Load an ad in background
        //
        vrAd.loadAd()
    }

    deinit {
        // Let vrAd be destroyed all along with the ViewController
        vrAd.unloadAd()
    }

}
```

Ad will now be loaded **in the background** and once it is ready, `onAdStatusChanged` will be called with `Ready` state.

## Show an Ad

If you want ad to start playing automatically, just add the following code snippet to the callback function.

```swift
...
func adStatusChanged(withAd ad: VRAd, andStatus adState: AdState) {
    if vrAd.isLoaded() {
        vrAd.show(cardboardMode: .Off)
    }
}
...
```

And it's all ... done ! Ad will now be shown on the screen.

## Reload an Ad

**`loadAd(...)` is needed to be called once per ad served.** You can reload an ad to make it ready for the next session by implementing the code inside `onAdStatusChanged` like shown below.

```swift
...
func adStatusChanged(withAd ad: VRAd, andStatus adState: AdState) {
    ...
    if vrAd.isCompleted() {
        vrAd.loadAd()
    }
}
...
```

## Callback

When the state of VRAd has been changed, `onAdStatusChanged` callback function will be called with the new state in the `adState` parameter.

```swift
...
func adStatusChanged(withAd ad: VRAd, andStatus adState: AdState) {
    // Check adState
}
...
```

There are different 5 states in total.

- **AdState.Loading** - Ad is being loaded in the background.

- **AdState.Ready** - Ad is ready to be shown. You can call `show()` function at this state to display the loaded ad.

- **AdState.Showing** - Ad is being displayed.

- **AdState.Completed** - Ad display is finished.

- **AdState.Failed** - Ad could not be loaded.


# Questions?

If you have any question, please don't hesitate to email us at [contact@omnivirt.com](mailto:contact@omnivirt.com) !
