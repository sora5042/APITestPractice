//
//  APITestPracticeTests.swift
//  APITestPracticeTests
//
//  Created by 大谷空 on 2022/01/03.
//

import XCTest
@testable import APITestPractice

class APITestPracticeTests: XCTestCase {
    
    private var searchRepositoryViewController: SearchRepositoryViewController!
    private var repositoryViewModel: RepositoryViewModel!
    private var mockRepositoryFetcher: MockRepositoryFetchr!
    private var testWord: String!
    
    
    
    override func setUpWithError() throws {
        searchRepositoryViewController = SearchRepositoryViewController()
        mockRepositoryFetcher = MockRepositoryFetchr()
        repositoryViewModel = .init(fetchRepository: mockRepositoryFetcher)
    }
    
    func testRepositoryViewModel_成功してmockリポジトリーを返す() {
        
        let exp = XCTestExpectation(description: "APITest")
        
        testWord = "apple"
        repositoryViewModel.searchRepository(word: testWord)
        XCTAssertNotNil(repositoryViewModel.repositories)
        XCTAssertEqual("name1", repositoryViewModel.repositories?.name)
        XCTAssertEqual(320, repositoryViewModel.repositories?.stargazersCount)
        
        exp.fulfill()
        
    }
    
//    func testAPI() {
//
//        let exp = XCTestExpectation(description: "APITest2")
//        testWord = "Swift"
//        XCTAssertNotNil(searchRepositoryViewController.repositoryItem)
//        searchRepositoryViewController.fetchSearchRepositoryInfo(word: testWord)
//        XCTAssertEqual("Swift", searchRepositoryViewController.repositoryItem?.fullName)
//        XCTAssertEqual(3000, searchRepositoryViewController.repositoryItem?.watchersCount)
//
//        exp.fulfill()
//
//
//    }
    
    private func testRepositoryViewModel_通信エラーだとnetworkErrorを返す() {
        let exp = XCTestExpectation(description: "APITest")
        mockRepositoryFetcher.fetchResult = .failure(APIError.networkError)
        //        testWord = testWords[4]
        repositoryViewModel.searchRepository(word: testWord)
        XCTAssertNil(mockRepositoryFetcher.returnRepositories)
        XCTAssertEqual(APIError.networkError, repositoryViewModel.apiError)
        exp.fulfill()
    }
    private func testRepositoryViewModel_不明なエラーの時はunknownを返す() {
        let exp = XCTestExpectation(description: "APITest")
        mockRepositoryFetcher.fetchResult = .failure(APIError.unknown)
        //        testWord = testWords[4]
        repositoryViewModel.searchRepository(word: testWord)
        XCTAssertNil(mockRepositoryFetcher.returnRepositories)
        XCTAssertEqual(APIError.unknown, repositoryViewModel.apiError)
        exp.fulfill()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
