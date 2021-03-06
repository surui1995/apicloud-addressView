//
//  UZModuleDemoSwift.swift
//  UZModule
//
//  Created by kenny on 15/1/14.
//  Copyright (c) 2015年 APICloud. All rights reserved.
//

import UIKit
import Foundation

@objc(UZModuleDemoSwift)
class UZModuleDemoSwift: UZModule, UIAlertViewDelegate {
    var _cbId : Int = 0;
    
    class func launch() {
        //在module.json里面配置的launchClassMethod，必须为类方法，引擎会在应用启动时调用配置的方法，模块可以在其中做一些初始化操作
    }
    
    override init!(UZWebView webView: AnyObject!) {
        super.init(UZWebView: webView);
        
    }
    
    override func dispose() {
        //do clean
    }
    
    func showAlert(paramDict:NSDictionary) {
        _cbId = paramDict.integerValueForKey("cbId", defaultValue: 0);
        let message = paramDict.stringValueForKey("msg", defaultValue: nil);
        let alert = UIAlertView(title: "", message: message, delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定");
        alert.show();
    }
    
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        let ret: Dictionary<String, Int> = ["index":buttonIndex+1];
        self.sendResultEventWithCallbackId(_cbId, dataDict: ret, errDict: nil, doDelete: false);
    }
}
