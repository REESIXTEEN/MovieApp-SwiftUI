//
//  HomeViewModelTests.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 9/8/23.
//

import XCTest
@testable import MovieApp

final class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let repositoryMock = RespositoryMock(success: true)
        sut = HomeViewModel(repository: repositoryMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetNewMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedMoviesDataExample()
        
        // WHEN
        await sut?.getNewMovies()
        do{sleep(1)} // Because the getNewMovies() creates a new thread with DispatchQueue.main.async to update an observable
        // variable, we are force to wait for the main thread to update the UI
        
        // THEN
        XCTAssertNotNil(sut?.newMovies)
        XCTAssertEqual(sut?.newMovies, expected)
    }
    
    func testGetTopMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedMoviesDataExample()
        
        // WHEN
        await sut?.getTopMovies()
        do{sleep(1)} // Because the getNewMovies() creates a new thread with DispatchQueue.main.async to update an observable
        // variable, we are force to wait for the main thread to update the UI
        
        // THEN
        XCTAssertNotNil(sut?.topMovies)
        XCTAssertEqual(sut?.topMovies, expected)
    }
    
    func testGetPopularMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedMoviesDataExample()
        
        // WHEN
        await sut?.getTopMovies()
        do{sleep(1)} // Because the getNewMovies() creates a new thread with DispatchQueue.main.async to update an observable
        // variable, we are force to wait for the main thread to update the UI
        
        // THEN
        XCTAssertNotNil(sut?.popularMovies)
        XCTAssertEqual(sut?.popularMovies, expected)
    }
    
    func testGetNewMovies_withErrorResult() async throws {
        // GIVEN
        let repositoryMock = RespositoryMock(success: false)
        sut = HomeViewModel(repository: repositoryMock)
        let expected: [Movie] = []
        
        // WHEN
        await sut?.getNewMovies()
        do{sleep(1)} // Because the getNewMovies() creates a new thread with DispatchQueue.main.async to update an observable
        // variable, we are force to wait for the main thread to update the UI
        
        // THEN
        XCTAssertNotNil(sut?.newMovies)
        XCTAssertEqual(sut?.newMovies, expected)
    }
    
    func testGetTopMovies_withErrorResult() async throws {
        // GIVEN
        let repositoryMock = RespositoryMock(success: false)
        sut = HomeViewModel(repository: repositoryMock)
        let expected: [Movie] = []
        
        // WHEN
        await sut?.getTopMovies()
        do{sleep(1)} // Because the getNewMovies() creates a new thread with DispatchQueue.main.async to update an observable
        // variable, we are force to wait for the main thread to update the UI
        
        // THEN
        XCTAssertNotNil(sut?.topMovies)
        XCTAssertEqual(sut?.topMovies, expected)
    }
    
    func testGetPopularMovies_withErrorResult() async throws {
        // GIVEN
        let repositoryMock = RespositoryMock(success: false)
        sut = HomeViewModel(repository: repositoryMock)
        let expected: [Movie] = []
        
        // WHEN
        await sut?.getTopMovies()
        do{sleep(1)} // Because the getNewMovies() creates a new thread with DispatchQueue.main.async to update an observable
        // variable, we are force to wait for the main thread to update the UI
        
        // THEN
        XCTAssertNotNil(sut?.popularMovies)
        XCTAssertEqual(sut?.popularMovies, expected)
    }



}
