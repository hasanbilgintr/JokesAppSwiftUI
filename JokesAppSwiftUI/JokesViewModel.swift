/*
 //en iyi vs değil örnek amaçlı kullanıcaz
 Alamofire  / istek atma alma vs işlemleri yapan bir araçmış
 -spm , cocoapods ilede yükleme yapılabilir biz spm ile yükledik
 -https://github.com/Alamofire/Alamofire.git ile alamofire çıkanı yükledik zaten bir tane dış kütüphanesi varmış, incelenebilir
 */

import Foundation
import Alamofire

class JokesViewModel : ObservableObject{
    
    @Published var jokes = [Value]()
    
    //bu burdaki amaç constractır oldupu çalıştığoında init içindeki çalışçak
    init(){
        getJokes()
    }
    
//    func getJokes (count : Int = 6) { //parametere istedik hocanın apiden çektiği için 5 girilirse 5 tane fıkra çekicekti girilmezzse 6 girilecektir tabi bizde kullanmadık api direk githubtan biz
    func getJokes (count : Int = 6) {
        //http ise info plist içinde izin/bildirmek  almak gerekir. info.plist yok SwiftUıda ana klasöre tıklayıp-> target seçili-> info sekmesinden herhangi keyden + tıklayıp App Transport Security Settings eklemek gerekir bide bu seçili olup solda küçük simge aşağı barhalde onun + sına tıklanmalı ve Allow Arbitrary Loads seçilmeli ve YES value girilmeli
        AF.request("\(Constants.url)/main/chuck.json",method: .get).responseDecodable(of:Welcome.self) { response in
            
            switch response.result {
            case .success(let data):
//                var value = data.value
                //+= jokes fıkra varsa üstüne kelenmiş olucak
                if count == 1 {
                    let random = Int.random(in: 0..<6)
                    //0 ile 5 arasında sayı verir 5 dahil
                    print(random)
                    self.jokes.append(data.value[random])
//                    self.jokes = value
                }else{
                    var value = data.value
                    //value bir dizi gibi for ile döndürüp listeuye atmasına benzer anlamındadır
//                    self.jokes += value
                    self.jokes = value
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}


/*
 // istek atması parametresiz
 AF.request("https://httpbin.org/get") { urlRequest in
     urlRequest.timeoutInterval = 5
     urlRequest.allowsConstrainedNetworkAccess = false
 }
 .response(...)
 
 
 // parametereli istek atma
 struct Login: Encodable {
     let email: String
     let password: String
 }

 let login = Login(email: "test@test.test", password: "testPassword")

 AF.request("https://httpbin.org/post",
            method: .post,
            parameters: login,
            encoder: JSONParameterEncoder.default).response { response in
     debugPrint(response)
 }
 
 
 
 
 // bölede array lı paramtereli atılabilir
 let parameters: [String: [String]] = [
     "foo": ["bar"],
     "baz": ["a", "b"],
     "qux": ["x", "y", "z"]
 ]

 // All three of these calls are equivalent
 AF.request("https://httpbin.org/post", method: .post, parameters: parameters)
 
 
 
 
 
 */
