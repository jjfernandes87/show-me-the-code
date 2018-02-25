//
//  TableViewManagerCache.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class TableViewManagerCache: NSObject {
    
    var items = NSMutableDictionary()
    static var instance: TableViewManagerCache!
    
    deinit { NSLog("Dealloc TableViewManagerCache") }
    
    class func shared() -> TableViewManagerCache {
        self.instance = (self.instance ?? TableViewManagerCache())
        
        return self.instance
    }
    
    override init() {
        super.init()
        let selector = #selector(clearCache)
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name.UIApplicationDidReceiveMemoryWarning, object: nil)
    }
    
    func loadNib(path: String?, owner: AnyObject) -> AnyObject? {
        guard let pathItem = path else {
            return nil
        }
        
        var cached: UINib?
        objc_sync_enter(items)
        cached = items.object(forKey: pathItem) as? UINib
        objc_sync_exit(items)
        
        if let cachedNib = cached {
            return cachedNib.instantiate(withOwner: owner, options: [:]) as AnyObject?
        } else {
            let newNib = UINib(nibName: pathItem, bundle: nil)
            objc_sync_enter(items)
            items.setValue(newNib, forKey: pathItem)
            objc_sync_exit(items)
            
            return newNib.instantiate(withOwner: owner, options: [:]) as AnyObject?
        }
    }
    
    @objc func clearCache() {
        items.removeAllObjects()
    }
}
