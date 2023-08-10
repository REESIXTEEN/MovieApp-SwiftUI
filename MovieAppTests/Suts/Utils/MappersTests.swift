//
//  MappersTests.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 10/8/23.
//

import XCTest
@testable import MovieApp

final class MappersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMapMoviePhoto() throws {
        // GIVEN
        let expected = getMappedMoviesDataExample()
        
        // WHEN
        let result = mapMoviePhoto(movies: getMoviesDataExample())
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testMapActorPhoto() throws {
        // GIVEN
        let expected = getMappedCastDataExample()
        
        // WHEN
        let result = mapActorPhoto(actors: getCastDataExample())
        
        // THEN
        XCTAssertEqual(result, expected)
    }
    
    func testMapPlatformPhoto() throws {
        // GIVEN
        let expected = getMappedPlatformsDataExample()
        
        // WHEN
        let result = mapPlatformPhoto(platforms: getPlatformsDataExample())
        
        // THEN
        XCTAssertEqual(result, expected)
    }


}
