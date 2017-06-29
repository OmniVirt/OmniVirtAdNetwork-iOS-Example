//
//  ViewController.swift
//  VRKitExample
//
//  Created by Jatupon Sukkasem on 9/13/16.
//  Copyright © 2016 Jatupon Sukkasem. All rights reserved.
//

import UIKit
import OmniVirtSDK

class ViewController: UIViewController, VRAdDelegate {
    @IBOutlet weak var log: UITextView!
    var vrAd: VRAd? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        vrAd = VRAd.create(withAdSpaceID: 1, andViewController: self, andListener: self);
        vrAd?.load();
    }
    
    deinit {
        vrAd?.unload();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var startAdButton: UIButton!
    @IBAction func startAd(_ sender: Any) {
        vrAd?.show();
    }
    
    public func adStatusChanged(withAd: VRAd, andStatus: AdState) {
        if (vrAd!.isLoaded()) {
            startAdButton.isEnabled = true;
            startAdButton.setTitle("Launch VR Ad", for: UIControlState.normal);
        }
        else {
            startAdButton.isEnabled = false;
            startAdButton.setTitle("Loading VR Ad", for: UIControlState.normal);
        }
        
        if (andStatus == AdState.Completed) {
            vrAd?.load();
        }
        
        switch (andStatus) {
        case AdState.None:
            log.text! += "Ad state changed to None\n";
        case AdState.Loading:
            log.text! += "Ad state changed to Loading\n";
        case AdState.Ready:
            log.text! += "Ad state changed to Ready\n";
        case AdState.Showing:
            log.text! += "Ad state changed to Showing\n";
        case AdState.Failed:
            log.text! += "Ad state changed to Failed\n";
        case AdState.Completed:
            log.text! += "Ad state changed to Completed\n";
        }
    }
}

