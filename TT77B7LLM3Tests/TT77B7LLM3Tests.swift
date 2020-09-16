//
//  TT77B7LLM3Tests.swift
//  TT77B7LLM3Tests
//
//  Created by Tolga İskender on 16.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import XCTest
@testable import TT77B7LLM3

class TT77B7LLM3Tests: XCTestCase {
    var session: URLSession!
    var viewModel = PlacesVM()
    override func setUpWithError() throws {
        super.setUp()
        session = URLSession(configuration: .default)
        viewModel = PlacesVM()
        //******
        //viewModel.showEmptyLabel() // yorum satırını kaldırırsanız line 49 da hata vericek cunkut initial value true olmus olucak
        //******
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        session = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
extension TT77B7LLM3Tests {
    func testInitializeValue() {
        XCTAssertEqual(viewModel.section, .loading, "init value must be loading") // initiliaze degerlerini kontrol ediyorum
        XCTAssertEqual(viewModel.showErrorMessage, false, "init value must be false")
    }
    func testScoreIsComputed() {
        // 1. given
        var guess = viewModel.showErrorMessage
        
        // 2. when
        viewModel.showEmptyLabel()
        guess = viewModel.showErrorMessage // bu line i yorum satırı yaparsanız line 60 hata vericek cunku line 50 de guess i false yaptık
        
        // 3. then
        XCTAssertEqual(guess, true, "empty label is on screen")
    }
    func testHTTPStatusCode200() {
        // given
        let url =
            URL(string: "https://api.foursquare.com/v2/venues/search?client_id=1XDQYY1EDEDNQ3A1M1ZSGSTY0TO1ABGS5P3ZMBIGM22R25OP&client_secret=3PBIZQZ01YRAAEB3XCNMQKIPCFSYKFENBNAUIC0QVTGGPIRE&near=Toronto&query=Tim%20Hortons&v=20200101")
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = session.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 10)
        
        // servis url ini test ettim  timeout u 10 yaptım 10 sn den az surede cevap alabılıyormuyum die
        // eger internet baglantısı kotu ise ve 10 sn dan fazla surerse hata verir
        // veya status code 200 dısında olursa hata verır
    }
}
