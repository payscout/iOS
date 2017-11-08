import Foundation;
func sayHello(url: String) {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
        ]
        let apiURL = URL(string: url);
        let postData = "client_username={yourUsername}&client_password={yourPassword}&client_token=token&processing_type=REFUND&currency=USD&initial_amount=99.99&original_transaction_id=A0001FFCDJ9".data(using: String.Encoding.utf8);

        var request = URLRequest(url: apiURL!)
        request.httpMethod = "POST"
        request.httpBody = postData
        for(headerName, headerValue) in headers {
            request.addValue(headerValue, forHTTPHeaderField: headerName)
        }

        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) {(data: Data?, response, error) in
            
                guard error == nil else {
                    print(String(describing:error))
                    return
                }
            
                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }
            
            print("================================")
            print(String(data: responseData as Data, encoding: String.Encoding.utf8) as Any)
            print("================================")
        }
        task.resume();
}

sayHello(url: "https://gatewaystaging.payscout.com/api/process");
RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) 
