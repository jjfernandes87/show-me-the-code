//
//  MainRouterQuickTest.swift
//  AppChallengeTests
//
//  Created by Julio on 27/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import AppChallenge


class MainRouterQuickTest: QuickSpec {
    
    override func spec() {
        
        var router: MainRouter!
        var rootController: UIViewController?
        
        describe("count number of viewController") {
            beforeEach {
                router = MainRouter(window: nil)
                router.launch()
            }
            
            it("should be 1"){
                expect(router.viewControllers.count).to(equal(1))
            }
        }
        
        describe("RootController type ListingController") {
            beforeEach {
                router = MainRouter(window: nil)
                router.launch()
                rootController = router.viewControllers.first
            }
            
            it("should be class type ListingController") {
                expect(rootController).to(beAnInstanceOf(ListingController.self))
            }
            
        }
    }
    
}
