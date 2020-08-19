//
//  Request.swift
//  spotify
//
//  Created by Norviah on 8/18/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import Foundation

/// Calls a request to the URL with the given values attached to the request, then, returns the results.
/// - Parameters:
///   - url: The URL to send a request to.
///   - method: The method for the request.
///   - headers: Headers for the request.
///   - body: Data for the HTTP body.
///   - query: A list of query items to append to the URL.
/// - Returns: The response from the API call.
func request(url: String, method: HTTPMethods, headers: [String: String]?, body: String?, query: [String: String]? = nil) -> String {
  // To be able to app data to the URL, e.g. a query item, we first need to
  // initialize a URLComponents instance for the given URL.
  var components: URLComponents = URLComponents(string: url)!

  // Next, if any query items are given, we'll initialize a new array consisting
  // of each key value pair from the dictionary as a URLQueryItem instance.
  components.queryItems = query != nil ? query!.map { URLQueryItem(name: $0.0, value: $0.1) } : nil

  // Most web services need the '+' character escaped, as they consider it as a space, but
  // URLComponents doesn't escape them. Because of this, we must escape that character manually.
  components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")

  // In order to send a request to a URL, we can use the URL itself, but,
  // to add special properties to the request, we'll have to use a URLRequest instance.
  var request: URLRequest = URLRequest(url: components.url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)

  // Represents the headers to use when calling the request.
  request.allHTTPHeaderFields = headers

  // If a body is given, we'll encode it then attach it to the request.
  request.httpBody = body?.data(using: .utf8)

  // Represents the method for the call.
  request.httpMethod = method.rawValue

  // Represents the result of the call.
  var result: String = ""

  // When using URLSession, it's completed in an asynchronous fashion, meaning that
  // this function will return before we can get a response from the call. To
  // fix this, we'll use a (possible hacky) fix.

  // We'll initialize a new DispatchSemaphore instance to force the thread to stop
  // until we have a response from the call.

  // TODO: If possible, implement a more efficient method.
  let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)

  // Once we have set the properties for the request, we can call it via URLSession
  let task: URLSessionDataTask = URLSession.shared.dataTask(with: request) { data, _, error in
    // If an error occurred, we'll throw it, as an error shouldn't occur.
    if error != nil {
      raise(error: "An unknown error occurred, please try again.")
    }

    // If the call was successful, we'll set the result to the given response to a string.
    result = String(data: data!, encoding: .utf8)!

    // Once a call is received, we'll continue the method.
    semaphore.signal()
  }

  // Once a URLSession is initialized, it won't immediately execute, as we have to
  // do it manually by calling it's resume method.
  task.resume()

  // As the URLSession is asynchronous, we'll tell the signal to wait for the
  // API to get a response.
  semaphore.wait()

  return result
}
