//
//  GetPersonDataService.swift
//  AlamofireTutorial
//
//  Created by yoonyeosong on 2023/08/31.
//

import Foundation
import Alamofire

struct GetPersonDataService {
    static let shared = GetPersonDataService()
    
    func getPersonInfo(completion: @escaping (NetworkResult<Any>) -> Void){
        let URL = "https://mocki.io/v1/e5b82f33-832c-43ae-83c8-c3e053a4ead7"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(URL, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else { return}
                guard let value = dataResponse.value else {return}
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.pathErr)
            }
        }
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(PersonDataModel.self, from: data) else { return .pathErr}
        return .success(decodedData.data)
    }
}
