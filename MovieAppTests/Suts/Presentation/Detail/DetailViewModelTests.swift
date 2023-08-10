//
//  DetailViewModelTests.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 9/8/23.
//

import XCTest
@testable import MovieApp

final class DetailViewModelTests: XCTestCase {

    var sut: DetailViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let repositoryMock = RespositoryMock(success: true)
        let movie = getMoviesDataExample().first
        sut = DetailViewModel(repository: repositoryMock, movie: movie)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCast_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedCastDataExample()
        
        // WHEN
        await sut?.getCast(movieId: (sut?.movie!.id)!)
        do{sleep(1)} // Because the getNewMovies() creates a new thread with DispatchQueue.main.async to update an observable
        // variable, we are force to wait for the main thread to update the UI
        
        // THEN
        XCTAssertNotNil(sut?.cast)
        XCTAssertEqual(sut?.cast, expected)
    }
    
    func testGetPlatforms_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedPlatformsDataExample()
        
        // WHEN
        await sut?.getPlatforms(movieId: (sut?.movie!.id)!)
        do{sleep(1)} // Because the getNewMovies() creates a new thread with DispatchQueue.main.async to update an observable
        // variable, we are force to wait for the main thread to update the UI
        
        // THEN
        XCTAssertNotNil(sut?.platforms)
        XCTAssertEqual(sut?.platforms, expected)
    }


}
