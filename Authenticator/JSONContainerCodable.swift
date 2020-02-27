//
//  JSONContainerCodable.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/27/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI
/*
/// Conforming to this protocol, makes the type decodable using the JSONContainer class
/// You can use `Decodable` instead.
protocol JSONContainerCodable: Codable {

    /// Returns the name that the type is recognized with, in the JSON.
    /// This is overridable in types conforming to the protocol.
    static var containerIdentifier: String { get }

    /// Defines whether or not the type's container identifier is lowercased.
    /// Defaults to `true`
    static var isLowerCased: Bool { get }
}

extension JSONContainerCodable {

    static var containerIdentifier: String {
        let identifier = String(describing: self)
        return !isLowerCased ? identifier : identifier.lowercased()
    }

    static var isLowerCased: Bool {
        return true
    }
}

struct Product: JSONContainerCodable {

    var name:  String
    var price: Int
}

struct Employee: JSONContainerCodable {

    var lastName:   String
    var department: String
    var manager:    String
}

/// This class is simply a wrapper around JSONDecoder
class JSONContainerDecoder: Decodable {

    private struct AnyCodingKeys: CodingKey {

        var stringValue: String
        var intValue: Int?

        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = "\(intValue)"
        }

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        init(_ string: String) {
            stringValue = string
        }
    }

    private let decoder: JSONDecoder
    private let container: KeyedDecodingContainer<AnyCodingKeys>

    /// Overrides the initializer as specified in `Decodable`.
    required init(from decoder: Decoder) throws {
        self.decoder = JSONDecoder()
        self.container = try decoder.container(keyedBy: AnyCodingKeys.self)
    }

    /// Factory initializer. Swift (4.2) currently doesn't support overriding the parentheses operator.
    static func decoding(_ data: Data, with decoder: JSONDecoder = JSONDecoder()) throws -> JSONContainerDecoder {
        return try decoder.decode(JSONContainerDecoder.self, from: myJSON)
    }

    /// Gets the given type from the JSON, based on its field/container identifier, and decodes it. Assumes there exists only one type with the given field/container identifier, in the JSON.
    func get<T: JSONContainerCodable>(_ type: T.Type, field: String? = nil) throws -> T {
        return try container.decode(T.self, forKey: AnyCodingKeys(field ?? T.containerIdentifier))
    }

    /// Short version of the decode getter above; assumes the variable written to already has its type defined.
    func get<T: JSONContainerCodable>(field: String? = nil) throws -> T {
        return try get(T.self, field: field)
    }
}*/


    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }

