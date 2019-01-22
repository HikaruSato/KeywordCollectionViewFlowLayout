//
//  ViewController.swift
//  KeywordCollectionViewFlowLayout
//
//  Created by HikaruSato on 2019/01/21.
//  Copyright (c) 2019年 HikaruSato. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController{

    fileprivate let cellIdentifier = "cell"
    
    let labelOuterMargin: CGFloat = 5
    let labelInsetMargin: CGFloat = 10
    var cellAmimationStatusDic: [Int : Bool] = [:]
    
    // 糖質の少ない食品
    let keywords = ["こんにゃく", "エリスリトール", "大豆製品（豆腐, 湯葉, 油揚げ, 納豆など）", "枝豆", "無調整豆乳", "アーモンド", "杏仁", "カシューナッツ", "くるみ", "けし", "ごま", "ピスタチオ", "ピーナッツ", "マカダミアナッツ", "オクラ", "かぶ", "カリフラワー", "キャベツ", "キュウリ", "小松菜", "ごぼう", "大根", "タケノコ", "玉ねぎ", "チンゲン菜", "トマト", "なす", "にら", "にんじん", "にんにく", "ねぎ", "白菜", "パプリカ", "ピーマン", "ふき", "ブロッコリー", "ホウレン草", "もやし", "レタス", "アボカド", "きのこ類", "魚", "肉", "卵", "チーズ", "生クリーム", "バター", "牛乳", "ウイスキー", "ウォッカ", "焼酎", "ジン", "ラム", "ワイン（甘口は要注意）", "コーヒー", "紅茶", "日本茶", "ウーロン茶", "プーアル茶", "ジャスミン茶", "コーラゼロ", "こしょう", "塩", "しょうゆ", "酢", "白みそ以外のみそ", "マヨネーズ","こんにゃく", "エリスリトール", "大豆", "大豆製品（豆腐", "湯葉", "油揚げ", "納豆など）", "枝豆", "無調整豆乳", "アーモンド", "杏仁", "カシューナッツ", "くるみ", "けし", "ごま", "ピスタチオ", "ピーナッツ", "マカダミアナッツ", "オクラ", "かぶ", "カリフラワー", "キャベツ", "キュウリ", "小松菜", "ごぼう", "大根", "タケノコ", "玉ねぎ", "チンゲン菜", "トマト", "なす", "にら", "にんじん", "にんにく", "ねぎ", "白菜", "パプリカ", "ピーマン", "ふき", "ブロッコリー", "ホウレン草", "もやし", "レタス", "アボカド", "きのこ類", "魚", "肉", "卵", "チーズ", "生クリーム", "バター", "牛乳", "ウイスキー", "ウォッカ", "焼酎", "ジン", "ラム", "ワイン（甘口は要注意）", "コーヒー", "紅茶", "日本茶", "ウーロン茶", "プーアル茶", "ジャスミン茶", "コーラゼロ", "こしょう", "塩", "しょうゆ", "酢", "白みそ以外のみそ", "マヨネーズ","こんにゃく", "エリスリトール", "大豆", "大豆製品（豆腐", "湯葉", "油揚げ", "納豆など）", "枝豆", "無調整豆乳", "アーモンド", "杏仁", "カシューナッツ", "くるみ", "けし", "ごま", "ピスタチオ", "ピーナッツ", "マカダミアナッツ", "オクラ", "かぶ", "カリフラワー", "キャベツ", "キュウリ", "小松菜", "ごぼう", "大根", "タケノコ", "玉ねぎ", "チンゲン菜", "トマト", "なす", "にら", "にんじん", "にんにく", "ねぎ", "白菜", "パプリカ", "ピーマン", "ふき", "ブロッコリー", "ホウレン草", "もやし", "レタス", "アボカド", "きのこ類", "魚", "肉", "卵", "チーズ", "生クリーム", "バター", "牛乳", "ウイスキー", "ウォッカ", "焼酎", "ジン", "ラム", "ワイン（甘口は要注意）", "コーヒー", "紅茶", "日本茶", "ウーロン茶", "プーアル茶", "ジャスミン茶", "コーラゼロ", "こしょう", "塩", "しょうゆ", "酢", "白みそ以外のみそ", "マヨネーズ","こんにゃく", "エリスリトール", "大豆", "大豆製品（豆腐", "湯葉", "油揚げ", "納豆など）", "枝豆", "無調整豆乳", "アーモンド", "杏仁", "カシューナッツ", "くるみ", "けし", "ごま", "ピスタチオ", "ピーナッツ", "マカダミアナッツ", "オクラ", "かぶ", "カリフラワー", "キャベツ", "キュウリ", "小松菜", "ごぼう", "大根", "タケノコ", "玉ねぎ", "チンゲン菜", "トマト", "なす", "にら", "にんじん", "にんにく", "ねぎ", "白菜", "パプリカ", "ピーマン", "ふき", "ブロッコリー", "ホウレン草", "もやし", "レタス", "アボカド", "きのこ類", "魚", "肉", "卵", "チーズ", "生クリーム", "バター", "牛乳", "ウイスキー", "ウォッカ", "焼酎", "ジン", "ラム", "ワイン（甘口は要注意）", "コーヒー", "紅茶", "日本茶", "ウーロン茶", "プーアル茶", "ジャスミン茶", "コーラゼロ", "こしょう", "塩", "しょうゆ", "酢", "白みそ以外のみそ", "マヨネーズ","こんにゃく", "エリスリトール", "大豆", "大豆製品（豆腐", "湯葉", "油揚げ", "納豆など）", "枝豆", "無調整豆乳", "アーモンド", "杏仁", "カシューナッツ", "くるみ", "けし", "ごま", "ピスタチオ", "ピーナッツ", "マカダミアナッツ", "オクラ", "かぶ", "カリフラワー", "キャベツ", "キュウリ", "小松菜", "ごぼう", "大根", "タケノコ", "玉ねぎ", "チンゲン菜", "トマト", "なす", "にら", "にんじん", "にんにく", "ねぎ", "白菜", "パプリカ", "ピーマン", "ふき", "ブロッコリー", "ホウレン草", "もやし", "レタス", "アボカド", "きのこ類", "魚", "肉", "卵", "チーズ", "生クリーム", "バター", "牛乳", "ウイスキー", "ウォッカ", "焼酎", "ジン", "ラム", "ワイン（甘口は要注意）", "コーヒー", "紅茶", "日本茶", "ウーロン茶", "プーアル茶", "ジャスミン茶", "コーラゼロ", "こしょう", "塩", "しょうゆ", "酢", "白みそ以外のみそ", "マヨネーズ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let  layout = self.collectionView?.collectionViewLayout as? KeywordCollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 8
            layout.delegate = self
        }
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        let mainLabel = cell.viewWithTag(1) as! UILabel
        mainLabel.text = keywords[indexPath.row]
        mainLabel.sizeToFit()
        mainLabel.frame.size = CGSize(width: getLabelWidth(label: mainLabel), height: 40)
        mainLabel.layer.cornerRadius = 5
        mainLabel.layer.masksToBounds = true
        
        // 最初の描画時にアニメーションしてみる
        if !cellAmimationStatusDic.contains(where: { (key, value) -> Bool in
            key == indexPath.row
        }) {
            cellAmimationStatusDic[indexPath.row] = true
            let orgFrame = cell.frame
            let random = arc4random() % 10
            let delay = TimeInterval(random) / 10
            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y + UIScreen.main.bounds.height, width: cell.frame.width, height: cell.frame.height)
            UIView.animate(withDuration: 1.3, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                cell.frame = orgFrame
            }, completion: nil)
        }
        
        return cell
    }
    
    fileprivate func getLabelWidth(label:UILabel) -> CGFloat {
        return label.frame.width + labelInsetMargin * 2
    }
}

extension ViewController:KeywordCollectionViewFlowLayoutDelegate {
    func collectionView(collectionView:UICollectionView, widthAtIndexPath indexPath:IndexPath) -> CGFloat {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = keywords[indexPath.row]
        label.sizeToFit()
        return getLabelWidth(label: label) + labelOuterMargin * 2
    }
}
