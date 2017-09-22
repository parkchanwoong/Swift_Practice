//
//  Data.swift
//  CollectionViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 13..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

//import Foundation

//---------------------------


import UIKit

let NSDefault = UserDefaults.standard

class Item: NSObject {
    
    // MARK: - Variable
    var ItemImageName = String()
    var ItemTitleLabel = String()
    
    var CoverImageName = String()
    var Genre = String()
    var Date = String()
    var Platform = String()
    
    var ContentImageData = NSArray()
    var ContentTextData = NSArray()
    // MARK: - Variable_End
    
    
}


class ItemGroup: NSObject {
    
    // MARK: - Variable
    var ItemGroupTitleLabel = String()
    var ItemSet = [Item]()
    // Variable_End
    
    
    func AddItem() -> [ItemGroup] {
        
        // New Item Group //
        let NewItemGroup = ItemGroup()
        NewItemGroup.ItemGroupTitleLabel = "NEW ARRIVALS"
        
        var NewItemSet = [Item]()
        
        let FirstNewItme = Item()
        FirstNewItme.ItemImageName = "NieR_Automata_Cover.png"
        FirstNewItme.ItemTitleLabel = "NieR: Automata"
        FirstNewItme.CoverImageName = "NieR_Automata.png"
        FirstNewItme.Genre = "Genre : Role-Playing"
        FirstNewItme.Date = "Date : 2017.2.23"
        FirstNewItme.Platform = "Platform : Playstation 4"
        FirstNewItme.ContentImageData = ["NieR_Automata_Content_1.png", "NieR_Automata_Content_2.png", "NieR_Automata_Content_3.png"]
        FirstNewItme.ContentTextData = ["니어 오토마타는 기본적으로 3D 액션 게임 이지만, 진행에 따라 종, 횡 스크롤 액션이 되기도 한다.", "니어 오토마타의 특징은 '멀티 엔딩'이다. 다른 게임의 멀티 엔딩과는 다르게, 게임을 마치고 다시 2회차 게임을 마치면 1회차에서 알지 못했던 사건들이 등장하며 이야기에 재미를 더한다.", "슈팅과 롤플레잉 등 다양한 장르가 섞이면서 색다른 게임으로 재탄생하게 된 니어 오토마나는 전세계적으로 100만장 이상의 판매를 올리며 인기를 누리고 있다."]
        NewItemSet.append(FirstNewItme)
        
        let SecondNewItme = Item()
        SecondNewItme.ItemImageName = "Halo_Wars_2_Cover.png"
        SecondNewItme.ItemTitleLabel = "Halo Wars 2"
        SecondNewItme.CoverImageName = "Halo_Wars_2.png"
        SecondNewItme.Genre = "Genre : Strategy"
        SecondNewItme.Date = "Date : 2017.2.21"
        SecondNewItme.Platform = "Platform : Xbox One"
        NewItemSet.append(SecondNewItme)
        
        let ThirdNewItme = Item()
        ThirdNewItme.ItemImageName = "Super_Robot_Wars_V_Cover.png"
        ThirdNewItme.ItemTitleLabel = "Super Robot Wars V"
        ThirdNewItme.CoverImageName = "Super_Robot_Wars_V.png"
        ThirdNewItme.Genre = "Genre : Misc"
        ThirdNewItme.Date = "Date : 2017.2.23"
        ThirdNewItme.Platform = "Platform : Playstation 4"
        NewItemSet.append(ThirdNewItme)
        
        NewItemGroup.ItemSet = NewItemSet
        
        
        // Sale Item Group //
        let SaleItemGroup = ItemGroup()
        SaleItemGroup.ItemGroupTitleLabel = "SALE PRODUCTS"
        
        var SaleItemSet = [Item]()
        
        let FirstSaleItme = Item()
        FirstSaleItme.ItemImageName = "Baldur's_Gate_II_Cover.png"
        FirstSaleItme.ItemTitleLabel = "Baldur's Gate II"
        FirstSaleItme.CoverImageName = "Baldur's_Gate_II.png"
        FirstSaleItme.Genre = "Genre : Role-Playing"
        FirstSaleItme.Date = "Date : 2000.9.24"
        FirstSaleItme.Platform = "Platform : PC"
        SaleItemSet.append(FirstSaleItme)
        
        let SecondSaleItme = Item()
        SecondSaleItme.ItemImageName = "Rise_of_The_Tomb_Raider_Cover.png"
        SecondSaleItme.ItemTitleLabel = "Rise of The Tomb Raider"
        SecondSaleItme.CoverImageName = "Rise_of_The_Tomb_Raider.png"
        SecondSaleItme.Genre = "Genre : Action-Adventure"
        SecondSaleItme.Date = "Date : 2015.11.10"
        SecondSaleItme.Platform = "Platform : Playstation 4"
        SaleItemSet.append(SecondSaleItme)
        
        let ThirdSaleItme = Item()
        ThirdSaleItme.ItemImageName = "Sim_CIty_2000_Cover.png"
        ThirdSaleItme.ItemTitleLabel = "Sim CIty 2000"
        ThirdSaleItme.CoverImageName = "Sim_CIty_2000.png"
        ThirdSaleItme.Genre = "Genre : Simulation"
        ThirdSaleItme.Date = "Date : 1993"
        ThirdSaleItme.Platform = "Platform : PC"
        SaleItemSet.append(ThirdSaleItme)
        
        let FourthSaleItme = Item()
        FourthSaleItme.ItemImageName = "The_Elder_Scrolls_IV_Cover.png"
        FourthSaleItme.ItemTitleLabel = "The Elder Scrolls IV"
        FourthSaleItme.CoverImageName = "The_Elder_Scrolls_IV.png"
        FourthSaleItme.Genre = "Genre : Role-Playing"
        FourthSaleItme.Date = "Date : 2006.3.20"
        FourthSaleItme.Platform = "Platform : Xbox 360"
        SaleItemSet.append(FourthSaleItme)
        
        let FifthSaleItme = Item()
        FifthSaleItme.ItemImageName = "World_of_Warcraft_Cover.png"
        FifthSaleItme.ItemTitleLabel = "World of Warcraft"
        FifthSaleItme.CoverImageName = "World_of_Warcraft.png"
        FifthSaleItme.Genre = "Genre : MMORPG"
        FifthSaleItme.Date = "Date : 2004.11.23"
        FifthSaleItme.Platform = "Platform : PC"
        SaleItemSet.append(FifthSaleItme)
        
        SaleItemGroup.ItemSet = SaleItemSet
        
        
        // Best Item Group //
        let BestItemGroup = ItemGroup()
        BestItemGroup.ItemGroupTitleLabel = "BEST PRODUCTS"
        
        var BestItemSet = [Item]()
        
        let FirstBestItme = Item()
        FirstBestItme.ItemImageName = "Grand_Theft_Auto_V_Cover.png"
        FirstBestItme.ItemTitleLabel = "Grand Theft Auto V"
        FirstBestItme.CoverImageName = "Grand_Theft_Auto_V.png"
        FirstBestItme.Genre = "Genre : Action"
        FirstBestItme.Date = "Date : 2014.11.18"
        FirstBestItme.Platform = "Platform : Playstation 4"
        FirstBestItme.ContentImageData = ["Grand_Theft_Auto_V_Content_1.png", "Grand_Theft_Auto_V_Content_2.png", "Grand_Theft_Auto_V_Content_3.png", "Grand_Theft_Auto_V_Content_4.png"]
        FirstBestItme.ContentTextData = ["음..오늘은 어떤 차를 고를까~?", "오빠 차 뽑았다 널 데리러 가", "삼선 슬리퍼, 반바지, 자전거..이게 바로 멋이지", "뿅뿅뿅\n탈모의 원인은 스트레스"]
        BestItemSet.append(FirstBestItme)
        
        let SecondBestItme = Item()
        SecondBestItme.ItemImageName = "Dragon_Quest_VIII_Cover.png"
        SecondBestItme.ItemTitleLabel = "Dragon Quest VIII"
        SecondBestItme.CoverImageName = "Dragon_Quest_VIII.png"
        SecondBestItme.Genre = "Genre : Role-Playing"
        SecondBestItme.Date = "Date : 2004.1.27"
        SecondBestItme.Platform = "Platform : Playstation 2"
        BestItemSet.append(SecondBestItme)
        
        let ThirdBestItme = Item()
        ThirdBestItme.ItemImageName = "Diablo_3_Cover.png"
        ThirdBestItme.ItemTitleLabel = "Diablo 3"
        ThirdBestItme.CoverImageName = "Diablo_3.png"
        ThirdBestItme.Genre = "Genre : Role-Playing"
        ThirdBestItme.Date = "Date : 2012.5.15"
        ThirdBestItme.Platform = "Platform : PC"
        BestItemSet.append(ThirdBestItme)
        
        let FourthBestItme = Item()
        FourthBestItme.ItemImageName = "Final_Fantasy_X_Cover.png"
        FourthBestItme.ItemTitleLabel = "Final Fantasy X"
        FourthBestItme.CoverImageName = "Final_Fantasy_X.png"
        FourthBestItme.Genre = "Genre : Role-Playing"
        FourthBestItme.Date = "Date : 1992.12.6"
        FourthBestItme.Platform = "Platform : Super Famicom"
        BestItemSet.append(FourthBestItme)
        
        BestItemGroup.ItemSet = BestItemSet
        
        return [NewItemGroup, SaleItemGroup, BestItemGroup]
    }
    
    
}

