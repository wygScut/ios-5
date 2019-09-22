import UIKit

class card{
    var poke1 = [String]()
    var poke2 = [String]()
    var poke3 = [String]()
    var poke4 = [String]()
    
    var pokeName1 = String()
    var pokeName2 = String()
    var pokeName3 = String()
    var pokeName4 = String()
    
    var allCard = [String]()
    
    func creatPokes(){
        let cardNumber: [String] = ["02","03","04","05","06","07","08","09","10","11","12","13","14"]
        let suite: [String] = ["♠️","♦️","❤️","♣️"]
        //生成一整副牌
        func allPoke() -> [String] {
            for oneCardNumber in cardNumber {
                for oneSuite in suite {
                    let item = oneSuite + oneCardNumber
                    allCard.append(item);
                }
            }
            return allCard
        }
        
        //allPoke()
        
        var i = Int()
        //发牌的顺序，获取随机牌分别分给四个玩家
        for i in 0...52
        {
            switch allCard.count % 4
            {
            case 0:
                let num1 = arc4random_uniform(UInt32(allCard.count)) + 0
                let pokeName1 = allCard[Int(num1)]
                //allCard.removeAtIndex(Int(num1))
                func East() -> [String]
                {
                    poke1.append(pokeName1)
                    return poke1
                }
                //East()
                
            case 1:
                let num2 = arc4random_uniform(UInt32(allCard.count)) + 0
                let pokeName2 = allCard[Int(num2)]
                //allCard.removeAtIndex(Int(num2))
                func South() -> [String]
                {
                    poke2.append(pokeName2)
                    return poke2
                }
                //South()
                
            case 2:
                let num3 = arc4random_uniform(UInt32(allCard.count)) + 0
                let pokeName3 = allCard[Int(num3)]
                //allCard.removeAtIndex(Int(num3))
                func West() -> [String]
                {
                    poke3.append(pokeName3)
                    return poke3
                }
                //West()
                
            case 3:
                let num4 = arc4random_uniform(UInt32(allCard.count)) + 0
                let pokeName4 = allCard[Int(num4)]
                //allCard.removeAtIndex(Int(num4))
                func North() -> [String]
                {
                    poke4.append(pokeName4)
                    return poke4
                }
                //North()
                
            default:
                break
            }
        }
        //排序，输出
        //poke1.sortInPlace({ $0 > $1 })
        //poke2.sortInPlace({ $0 > $1 })
        //poke3.sortInPlace({ $0 > $1 })
        //poke4.sortInPlace({ $0 > $1 })
        
        
        print("East:" + "\(poke1)")
        print("South:" + "\(poke2)")
        print("West:" + "\(poke3)")
        print("North:" + "\(poke4)")
    }
}
