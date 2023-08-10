//
//  RemoteDataSourceTests.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 10/8/23.
//

import XCTest
@testable import MovieApp

final class RemoteDataSourceTests: XCTestCase {
    
    var sut: RemoteDataSourceProtocol?

    override func setUpWithError() throws {
        let networkMock = NetworkMock()
        sut = RemoteDataSourceImpl(session: networkMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetTopMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMoviesDataExample()
        
        // WHEN
        let result = try await sut?.getTopMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetNewMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMoviesDataExample()
        
        // WHEN
        let result = try await sut?.getNewMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetPopularMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMoviesDataExample()
        
        // WHEN
        let result = try await sut?.getPopularMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetCast_withSuccessResult() async throws {
        // GIVEN
        let expected = getCastDataExample()
        
        // WHEN
        let result = try await sut?.getCast(movieId: 1)
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetPlatforms_withSuccessResult() async throws {
        // GIVEN
        let expected = getPlatformsDataExample()
        
        // WHEN
        let result = try await sut?.getPlatforms(movieId: 1)
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetMovie_withSuccessResult() async throws {
        // GIVEN
        let expected = [getMoviesDataExample().first!]
        
        // WHEN
        let result = try await sut?.getMovie(movieTitle: "title")
        
        // THEN
        XCTAssertEqual(result, expected)
    }


}
