import Foundation;
func sayHello(url: String) {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
        ]
        let apiURL = URL(string: url);
        let postData = "client_username={yourUsername}&client_password={yourPassword}&client_token=token&processing_type=PRE_AUTHORIZATION&billing_first_name=John&billing_last_name=Doe&billing_phone_number=2455464&billing_address_line_1=Innovation%20Street%201&billing_address_line_2=Brilliance%20Building%2C%20Apt.%2022&billing_city=Palo%20Alto&billing_state=CA&billing_postal_code=94024&billing_country=US&billing_email_address=demo%40payscout.com&ip_address=98.97.129.52&billing_date_of_birth=19801229&billing_social_security_number=000000000&expiration_month=10&expiration_year=2022&account_number={yourTestCardNumber}&cvv2=123¤cy=USD&initial_amount=99.99&shipping_first_name=Amazing&shipping_last_name=Jane&shipping_email_address=demoshipping%40payscout.com&shipping_cell_phone_number=74477464&shipping_phone_number=7447746400&shipping_address_line_1=Innovation%20Street%201&shipping_address_line_2=Brilliance%20Building%2C%20Apt.%2022&shipping_city=Palo%20Alto&shipping_state=CA&shipping_postal_code=94024&shipping_country=US&billing_invoice_number=1999".data(using: String.Encoding.utf8);

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
