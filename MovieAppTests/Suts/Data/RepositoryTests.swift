//
//  RepositoryTests.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 10/8/23.
//

import XCTest
@testable import MovieApp

final class RepositoryTests: XCTestCase {
    
    var sut: RepositoryImpl?

    override func setUpWithError() throws {
        let remoteDataSourceMock = RemoteDataSourceMock(success: true)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetNewMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedMoviesDataExample()
        
        // WHEN
        let result = await sut?.getNewMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetTopMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedMoviesDataExample()
        
        // WHEN
        let result = await sut?.getTopMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetPopularMovies_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedMoviesDataExample()
        
        // WHEN
        let result = await sut?.getPopularMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetCast_withSuccessResult() async throws {
        // GIVEN
        let movie = getMappedMoviesDataExample().first
        let expected = getMappedCastDataExample()
        
        // WHEN
        let result = await sut?.getCast(movieId: movie!.id )
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetPlatforms_withSuccessResult() async throws {
        // GIVEN
        let movie = getMappedMoviesDataExample().first
        let expected = getMappedPlatformsDataExample()
        
        // WHEN
        let result = await sut?.getPlatforms(movieId: movie!.id )
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetMovie_withSuccessResult() async throws {
        // GIVEN
        let expected = getMappedMoviesDataExample().first
        
        // WHEN
        let result = await sut?.getMovie(movieTitle: "title")
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetNewMovies_withErrorResult() async throws {
        // GIVEN
        let remoteDataSourceMock = RemoteDataSourceMock(success: false)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
        let expected: [Movie] = []
        
        // WHEN
        let result = await sut?.getNewMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetTopMovies_withErrorResult() async throws {
        // GIVEN
        let remoteDataSourceMock = RemoteDataSourceMock(success: false)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
        let expected: [Movie] = []
        
        // WHEN
        let result = await sut?.getTopMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetPopularMovies_withErrorResult() async throws {
        // GIVEN
        let remoteDataSourceMock = RemoteDataSourceMock(success: false)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
        let expected: [Movie] = []
        
        // WHEN
        let result = await sut?.getPopularMovies()
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetCast_withErrorResult() async throws {
        // GIVEN
        let remoteDataSourceMock = RemoteDataSourceMock(success: false)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
        let movie = getMappedMoviesDataExample().first
        let expected: [Actor] = []
        
        // WHEN
        let result = await sut?.getCast(movieId: movie!.id )
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testGetPlatforms_withErrorResult() async throws {
        // GIVEN
        let remoteDataSourceMock = RemoteDataSourceMock(success: false)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
        let movie = getMappedMoviesDataExample().first
        let expected: [Platform] = []
        
        // WHEN
        let result = await sut?.getPlatforms(movieId: movie!.id )
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testMovie_withErrorResult() async throws {
        // GIVEN
        let remoteDataSourceMock = RemoteDataSourceMock(success: false)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
        
        // WHEN
        let result = await sut?.getMovie(movieTitle: "title")
        
        // THEN
        XCTAssertNil(result)
    }


}
