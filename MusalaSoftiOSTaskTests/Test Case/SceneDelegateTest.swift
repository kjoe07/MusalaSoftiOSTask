//
//  SceneDelegateTest.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/23/21.
//

import XCTest
@testable import MusalaSoftiOSTask

class SceneDelegateTest: XCTestCase {
   // var sut: ListCitiesViewController!
   // var sut: ListCitiesViewController
    

    override func setUpWithError() throws {
//        let nc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! UINavigationController
//        sut = nc.viewControllers.first as! ListCitiesViewController
    }

    override func tearDownWithError() throws {
       // sut = nil
    }

    func testInitialViewControllerViewModelNotNil() {
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        let nc = sceneDelegate.window?.rootViewController as! UINavigationController
        let sut = nc.viewControllers.first as! ListCitiesViewController
        XCTAssertNotNil(sut.viewModel)
        //sut.viewDidLoad()
      //  XCTAssertNotNil(sut.viewModel)
    }

}
